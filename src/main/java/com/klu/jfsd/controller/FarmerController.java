package com.klu.jfsd.controller;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.klu.jfsd.model.Farmer;
import com.klu.jfsd.model.Product;
import com.klu.jfsd.model.User;
import com.klu.jfsd.service.FarmerService;
import com.klu.jfsd.service.ProductService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class FarmerController {
	
	@Autowired
	 private FarmerService farmerService;
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("/register")
	public ModelAndView homePage() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("register");
		return mv;
	}
	@PostMapping("/checkfarmerregister")
	public ModelAndView registerFarmer(HttpServletRequest request, HttpServletResponse response) {
	    // Retrieve form data from request parameters
	    String name = request.getParameter("name");
	    String phone = request.getParameter("phone");
	    String username = request.getParameter("username");
	    String password = request.getParameter("password");
	    String address = request.getParameter("address");
	    String state = request.getParameter("state");
	    String city = request.getParameter("city"); // Added city field

	    // Default avatar image URL
	    String image = "https://www.clipartkey.com/mpngs/b/30-308184_farmer-clip-art.png";

	    ModelAndView mv = new ModelAndView();

	    try (Connection conn = DriverManager.getConnection(
	            "jdbc:mysql://localhost:3306/farmerdbs", "root", "@Mani7890")) {
	        
	        // Check if username already exists
	        String checkQuery = "SELECT COUNT(*) FROM farmer_table WHERE farmer_username = ?";
	        try (PreparedStatement checkStmt = conn.prepareStatement(checkQuery)) {
	            checkStmt.setString(1, username);
	            ResultSet rs = checkStmt.executeQuery();
	            if (rs.next() && rs.getInt(1) > 0) {
	                // Username exists, forward to registration page with error message
	                mv.setViewName("register");
	                mv.addObject("message", "Username already exists. Please choose another.");
	                return mv;
	            }
	        }

	        // Create a new Farmer object and populate it
	        Farmer farmer = new Farmer();
	        farmer.setName(name);
	        farmer.setPhone(phone);
	        farmer.setUsername(username);
	        farmer.setPassword(password);
	        farmer.setAddress(address);
	        farmer.setState(state);
	        farmer.setCity(city); // Set city field
	        farmer.setImage(image);

	        // Register the farmer using the service layer
	        String message = farmerService.farmerRegestration(farmer);

	        // Set success page with a success message
	        mv.setViewName("regsuccesslogin");
	        mv.addObject("message", message);
	    } catch (Exception e) {
	        // Handle exceptions and display an error page
	        mv.setViewName("error");
	        mv.addObject("message", "An error occurred during registration: " + e.getMessage());
	    }

	    return mv;
	}

	
	
	
	
	@GetMapping("/login")
	public ModelAndView loginPage() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		return mv;
	}
	
	// Login endpoint
    @PostMapping("loginAction")
    public ModelAndView loginAction(HttpServletRequest request, HttpSession session) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        ModelAndView mv = new ModelAndView();
        Farmer farmer = farmerService.checkFarmerLogin(username, password);

        if (farmer != null) {
            if (farmer.isApproved()) {
                session.setAttribute("farmer", farmer);// Corrected attribute name
                session.setAttribute("loggedInFarmerId", farmer.getId());
                 mv.setViewName("redirect:/farmerhome");
            } else {
                mv.setViewName("farmeraprovalpending");
            }
        } else {
            mv.setViewName("login");
            mv.addObject("message", "login failed");
        }
        return mv;
    }

	//login------> farmer home
	@GetMapping("/farmerhome")
	public ModelAndView farmerHome() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("farmerhome");
		return mv;
	}
	
	
	
	
	//add products logic.............................................................................................................>
	@GetMapping("farmeraddproduct")
	public ModelAndView addProduct() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("farmeraddproduct");
		return mv;
	}
	@PostMapping("/farmeraddproduct")
	public ModelAndView addProduct(
	        HttpServletRequest request,
	        HttpSession session,
	        @RequestParam("productimage") MultipartFile file) {

	    ModelAndView mv = new ModelAndView("farmeraddproduct");

	    try {
	        // Ensure session has farmer ID
	        Integer farmerId = Optional.ofNullable((Integer) session.getAttribute("loggedInFarmerId"))
	                .orElseThrow(() -> new IllegalArgumentException("Farmer must be logged in."));

	        // Fetch farmer's city from database
	        Farmer farmer = farmerService.getFarmerById(farmerId);
	        if (farmer == null) {
	            throw new IllegalArgumentException("Farmer details not found.");
	        }
	        String location=farmer.getAddress();
	        String city = farmer.getCity(); // Assume Farmer entity has a 'city' field
	        String state=farmer.getState();
	        // Get form data
	        String name = request.getParameter("name");
	        String type = request.getParameter("type");
	        String date = request.getParameter("date");
	        String quantity = request.getParameter("quantity");
	        double price = Double.parseDouble(request.getParameter("price")); // Convert to double
	        String contact = request.getParameter("contact");
	        String specification = request.getParameter("specification");
	        
	        // Process file
	        byte[] bytes = file.getBytes();
	        Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);

	        // Create product object
	        Product product = new Product();
	        product.setName(name);
	        product.setType(type);
	        product.setDate(date);
	        product.setQuantity(quantity);
	        product.setPrice(price);
	        product.setCity(city);// Set location directly to farmer's city
	        product.setContact(contact);
	        product.setSpecification(specification);
	        product.setImage(blob);
	        product.setFarmerId(farmerId);
	        product.setState(state);
	        product.setLocation(location);
	        

	        // Save product
	        String message = farmerService.addProduct(product);
	        mv.addObject("message", "Product added successfully: " + message);

	    } catch (Exception e) {
	        mv.addObject("message", "Error adding product: " + e.getMessage());
	    }

	    return mv;
	}


	
	@GetMapping("displayprodimage")
	public ResponseEntity<byte[]> displayprodimagedemo(@RequestParam("id") int id) throws Exception
	{
	  Product product =  productService.getProductById(id);
	  byte [] imageBytes = null;
	  imageBytes = product.getImage().getBytes(1,(int) product.getImage().length());

	  return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
	  
	// Response Body, HTTP Status Code, Headers
	}	
	//my products logic................................................>
  
    
    @GetMapping("/farmerproducts")
    public ModelAndView viewFarmerProducts(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        
        // Get the logged-in farmer's ID from the session
        Integer farmerId = (Integer) session.getAttribute("loggedInFarmerId");
        
        if (farmerId == null) {
            mv.setViewName("error"); // Redirect to an error page if not logged in
            mv.addObject("message", "You must be logged in to view your products.");
            return mv;
        }

        // Fetch the products for the logged-in farmer
        List<Product> farmerProducts = farmerService.getProductsByFarmerId(farmerId);
        
        // Add the products to the ModelAndView
        mv.setViewName("farmerproducts"); // JSP to display the products
        mv.addObject("products", farmerProducts);
        
        return mv;
    }

    
    
    
    
    
    
    
    //update products................................................................>
    

    @GetMapping("/farmerupdateproduct")
    public ModelAndView farmerupdateproduct(HttpSession session) {
        // Get the farmer's ID from the session
        Integer farmerId = (Integer) session.getAttribute("loggedInFarmerId");
        
        // If the farmerId is not found in the session, redirect to login page or show an error
        if (farmerId == null) {
            return new ModelAndView("redirect:/login");  // or your login path
        }
        
        ModelAndView modelAndView = new ModelAndView("farmerupdateproduct");

        // Fetch products by farmer ID
        List<Product> products = farmerService.getProductsByFarmerId(farmerId);
        
        if (products == null || products.isEmpty()) {
            System.out.println("No products found for the farmer!");  // Debugging
        }
        
        modelAndView.addObject("products", products);
        modelAndView.addObject("farmerId", farmerId);  // Add the farmerId to the model
        return modelAndView;
    }

    @PostMapping("/updateproduct")
    public String updateProduct(@ModelAttribute("product") Product product, RedirectAttributes redirectAttributes) {
        // Log the product object to check if farmerId is set correctly
        System.out.println("Product before update: " + product);

        String message = productService.updateProduct(product);
        redirectAttributes.addFlashAttribute("message", message);
        return "redirect:/farmerupdateproduct";
    }



    //delete products........................................................................................>
    
    
    @GetMapping("/farmerdeleteproduct")
    public ModelAndView farmerdeleteproduct(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("farmerdeleteproduct");

        // Get the farmerId from session
        Integer farmerId = (Integer) session.getAttribute("loggedInFarmerId"); // Make sure 'farmerId' is set during login

        if (farmerId == null) {
            // Handle case where farmerId is not present (user is not logged in)
            modelAndView.addObject("message", "Please log in to manage your products.");
            return modelAndView;
        }

        // Fetch products based on the logged-in farmerId
        List<Product> products = farmerService.getProductsByFarmerId(farmerId);
        
        if (products == null || products.isEmpty()) {
            System.out.println("No products found for farmer with id: " + farmerId); // Debugging
        }

        modelAndView.addObject("products", products);
        return modelAndView;
    }

    @GetMapping("/deleteproduct")
    public ModelAndView deleteProduct(@RequestParam("id") int productId, HttpSession session, RedirectAttributes redirectAttributes) {
        // Get the farmerId from session to ensure the logged-in farmer is deleting their own product
        Integer farmerId = (Integer) session.getAttribute("loggedInFarmerId");

        if (farmerId == null) {
            redirectAttributes.addFlashAttribute("message", "Please log in to delete products.");
            return new ModelAndView("redirect:/login"); // Redirect to login if not logged in
        }

        // Delete the product if it belongs to the logged-in farmer
        String message = farmerService.deleteProduct(farmerId, productId); // Pass farmerId to service

        redirectAttributes.addFlashAttribute("message", message);
        return new ModelAndView("redirect:/farmerdeleteproduct");
    }

    //view all products....................................................................>
    @GetMapping("farmerviewallproducts")
    public ModelAndView farmerviewallproducts() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("farmerviewallproducts");

        // Ensure this returns all products regardless of farmerId
        List<Product> products = farmerService.viewAllProducts(); 
        mv.addObject("productlist", products);

        return mv;
    }
    
    
    
    //view all users.....................................................................>
    
    
	@GetMapping("farmerviewallusers")
	public ModelAndView farmerViewAllUsers() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("farmerviewallusers");
		
		List<User> users =  farmerService.viewAllUsers();
		mv.addObject("userlist", users);
		
		
		return mv;
	}
	
	
	//update profile

    // Update profile page
    @GetMapping("farmerupdateprofile")
    public ModelAndView viewProfile(HttpSession session) {
        Farmer loggedFarmer = (Farmer) session.getAttribute("farmer"); // Corrected attribute name

        if (loggedFarmer == null) {
            return new ModelAndView("redirect:/login"); // Redirect to login if farmer is not in session
        }

        ModelAndView modelAndView = new ModelAndView("farmerupdateprofile");
        modelAndView.addObject("farmer", loggedFarmer);
        return modelAndView;
    }

    @PostMapping("updatefarmerprofile")
    public ModelAndView updateUserProfile(
        @RequestParam("password") String password,
        @RequestParam("name") String name,
        @RequestParam("username") String username,
        @RequestParam("phone") String phone,
        @RequestParam("address") String address,
        @RequestParam("state") String state,
        HttpSession session,
        RedirectAttributes redirectAttributes) {

        ModelAndView modelAndView = new ModelAndView();

        // Get the farmer from the session
        Farmer loggedFarmer = (Farmer) session.getAttribute("farmer"); // Corrected attribute name

        // If farmer is null, it means the user is not logged in
        if (loggedFarmer == null) {
            modelAndView.addObject("error", "Please log in first.");
            modelAndView.setViewName("login");
            return modelAndView;
        }

        // Verify password
        if (!farmerService.verifyPassword(loggedFarmer, password)) {
            modelAndView.addObject("error", "Invalid password. Please try again.");
            modelAndView.setViewName("farmerupdateprofile");
            return modelAndView;
        }

        // Update farmer details
        loggedFarmer.setName(name);
        loggedFarmer.setUsername(username);
        loggedFarmer.setPhone(phone);
        loggedFarmer.setAddress(address);
        loggedFarmer.setState(state);

        // Save the updated farmer details in the database
        String message = farmerService.updateFarmer1(loggedFarmer);
        redirectAttributes.addFlashAttribute("message", message);

        // Successfully updated, redirect to profile page
        modelAndView.setViewName("redirect:/farmerupdateprofile");
        return modelAndView;
    }
    
    
    
    
    
    
    

    
	
    
    
	    
    
    
    
    
    
    
	  
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    //for the for get password.........................................................................>
		@GetMapping("/forgetpassword")
		public ModelAndView forgetpassword() {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("forgetPassword");
			return mv;
		}
	    
	    @PostMapping("/validateUser")
	    public ModelAndView validateUser(
	            @RequestParam("username") String username,
	            @RequestParam("phone") String phone) {

	        ModelAndView modelAndView = new ModelAndView();

	        // Find farmer by username and phone number
	        Farmer farmer = farmerService.findByUsernameAndPhone(username, phone);

	        if (farmer != null && farmer.isApproved()) {
	            // Set approval to zero for admin re-verification
	            farmer.setApproved(false);
	            farmerService.updateFarmer(farmer);

	            // Redirect to the set password page
	            modelAndView.setViewName("redirect:/setPassword?username=" + username);
	        } else {
	            // If invalid, return to the forgot password page with a message
	            modelAndView.setViewName("forgetPassword");
	            modelAndView.addObject("message", "Invalid username or phone number.");
	        }

	        return modelAndView;
	    }

	    @GetMapping("/setPassword")
	    public ModelAndView setPasswordPage(@RequestParam("username") String username) {
	        ModelAndView modelAndView = new ModelAndView();
	        modelAndView.setViewName("setPassword");
	        modelAndView.addObject("username", username);
	        return modelAndView;
	    }

	    @PostMapping("/updatePassword")
	    public ModelAndView updatePassword(
	            @RequestParam("username") String username,
	            @RequestParam("newPassword") String newPassword,
	            @RequestParam("confirmPassword") String confirmPassword) {

	        ModelAndView modelAndView = new ModelAndView();

	        // Check if passwords match
	        if (!newPassword.equals(confirmPassword)) {
	            modelAndView.setViewName("setPassword");
	            modelAndView.addObject("message", "Passwords do not match!");
	            return modelAndView;
	        }

	        // Find the farmer by username
	        Farmer farmer = farmerService.findByUsername(username);
	        if (farmer != null) {
	            farmer.setPassword(newPassword); // Set new password
	            farmerService.updateFarmer(farmer);

	            // Redirect to login page after password reset
	            modelAndView.setViewName("redirect:/login");
	        } else {
	            modelAndView.setViewName("setPassword");
	            modelAndView.addObject("message", "User not found!");
	        }

	        return modelAndView;
	    }
	    
    
    @RequestMapping("farmerlogout")
    public String logout(HttpSession session) {
        // Invalidate the session
        session.invalidate();

        // Optionally, redirect to a login page or home page after logout
        return "redirect:/home";
}
    
    
    
   

}
    
    
    
   

