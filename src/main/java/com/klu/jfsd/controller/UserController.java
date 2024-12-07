package com.klu.jfsd.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.klu.jfsd.model.Farmer;
import com.klu.jfsd.model.Product;
import com.klu.jfsd.model.User;
import com.klu.jfsd.service.ProductService;
import com.klu.jfsd.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("userregister")
    public ModelAndView showRegistrationForm() {
        return new ModelAndView("userregestration");
    }
    @PostMapping("/checkuserregister")
    public ModelAndView handleRegistration(HttpServletRequest request,HttpServletResponse response) {
        // Retrieve form data from request parameters
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String state = request.getParameter("state");
        String city = request.getParameter("city");


        // Default avatar image URL
        String image = "https://th.bing.com/th/id/OIP.ldw7xl7IjKTIGKKVqvCEsAHaHa?rs=1&pid=ImgDetMain";

        ModelAndView mv = new ModelAndView();

        try (Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/farmerdbs", "root", "@Mani7890")) {
            
            // Check if username already exists in the database
            String checkQuery = "SELECT COUNT(*) FROM user_table WHERE user_username = ?";
            try (PreparedStatement checkStmt = conn.prepareStatement(checkQuery)) {
                checkStmt.setString(1, username);
                ResultSet rs = checkStmt.executeQuery();
                if (rs.next() && rs.getInt(1) > 0) {
                    // Username exists, forward to registration page with error message
                    mv.setViewName("userregestration");
                    mv.addObject("message", "Username already exists. Please choose another.");
                    return mv;
                }
            }
            

            // Create a new User object and populate its fields
            User user = new User();
            user.setName(name);
            user.setPhone(phone);
            user.setUsername(username);
            user.setPassword(password);
            user.setAddress(address);
            user.setState(state);
            user.setImageUrl(image);
            user.setCity(city);


            // Register the user using the service layer
            String message = userService.userRegistration(user);

            // Set success page with a success message
            mv.setViewName("userregsuccesslogin");
            mv.addObject("message", message);
        } catch (Exception e) {
            // Handle exceptions and display an error page
            mv.setViewName("error");
            mv.addObject("message", "An error occurred during registration: " + e.getMessage());
        }

        return mv;
    }
    @GetMapping("userlogin")
    public ModelAndView showLoginForm() {
    	ModelAndView mv = new ModelAndView();
		mv.setViewName("userlogin");
		return mv;
    }
    @PostMapping("checkuserlogin")
    public ModelAndView loginAction(HttpServletRequest request, HttpSession session) {
        // Retrieve username and password from the request
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        ModelAndView mv = new ModelAndView();
        
        // Authenticate user
        User user = userService.checkUserLogin(username, password);
        
        if (user != null) {
            // Store user details in session
            session.setAttribute("user", user);  // Store the entire user object for future use
            session.setAttribute("userCity", user.getCity()); // Optionally store city
            session.setAttribute("userState", user.getState()); // Optionally store state
            
            // Redirect to user home page
            mv.setViewName("userhome");
        } else {
            // If login fails, redirect back to login page with error message
            mv.setViewName("userlogin");
            mv.addObject("message", "Login failed. Please try again.");
        }
        
        return mv;
    }

   
    
    
    
    
    
    
    
    @GetMapping("userhome")
    public ModelAndView userHome(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        
        // Retrieve the user object from the session
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            // If no user is found in session, redirect to login page
            mv.setViewName("userlogin");
            mv.addObject("message", "Your session has expired. Please log in again.");
        } else {
            // If user is found, display the user home page
            mv.setViewName("userhome");
            mv.addObject("user", user);
        }
        
        return mv;
    }

    
    
    
    
    
    //nav-bar function......................................................................>
    @GetMapping("userviewallfarmers")
    public ModelAndView userViewAllFarmers(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("userviewallfarmers");

        // Retrieve user data from session
        String userCity = (String) session.getAttribute("userCity");
        String userState = (String) session.getAttribute("userState");

        if (userCity == null || userState == null) {
            // Redirect to login if session data is missing
            return new ModelAndView("redirect:/login");
        }

        // Fetch all farmers
        List<Farmer> farmers = userService.viewAllFarmers();

        // Filter farmers based on user city and state
        List<Farmer> filteredFarmers = farmers.stream()
            .filter(farmer -> userCity.equals(farmer.getCity()) && userState.equals(farmer.getState()))
            .collect(Collectors.toList());

        if (filteredFarmers.isEmpty()) {
            System.out.println("No farmers found for the same city and state!");  // Debugging
        }

        modelAndView.addObject("farmerslist", filteredFarmers);
        return modelAndView;
    }

    @GetMapping("userviewallproducts")
    public ModelAndView userviewallproducts(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("userviewallproducts");

        // Retrieve user data from session
        String userCity = (String) session.getAttribute("userCity");
        String userState = (String) session.getAttribute("userState");

        if (userCity == null || userState == null) {
            // Redirect to login if session data is missing
            return new ModelAndView("redirect:/login");
        }

        // Fetch all products
        List<Product> products = userService.viewAllProducts();

        // Filter products based on user city and state
        List<Product> filteredProducts = products.stream()
            .filter(product -> userCity.equals(product.getCity()) && userState.equals(product.getState()))
            .collect(Collectors.toList());

        modelAndView.addObject("productslist", filteredProducts);
        return modelAndView;
    }

    
    @GetMapping("userbuyproducts")
    public ModelAndView userbuyproducts() {
    	ModelAndView modelAndView = new ModelAndView("userbuyproducts");
        List<Product> products = userService.viewAllProducts();
        if (products == null || products.isEmpty()) {
            System.out.println("No products found!"); // Debugging
        }
        modelAndView.addObject("productslist", products);
        return modelAndView;
    }
    
    
    
    
    
    @GetMapping("/filterproducts")
    public ModelAndView filterProducts(@RequestParam("specification") String specification) {
        // Fetch the filtered products based on the type parameter
    	List<Product> filteredProducts = userService.getProductsBySpecification(specification);
        if (filteredProducts == null || filteredProducts.isEmpty()) {
            System.out.println("No products found!"); // Debugging
        }
        // Create a new ModelAndView object
        

        // Add filtered products to the model
        ModelAndView modelAndView = new ModelAndView("userbuyproducts");

        
        modelAndView.addObject("productslist", filteredProducts);

        return modelAndView;
    }
  
    
    
    
    
   
    
  
    /*@GetMapping("userbuyproducts")
    public ModelAndView filterProducts(@RequestParam(value = "type", required = false) String type) {
        List<Product> products;
        if (type == null || type.isEmpty()) {
            products = userService.viewAllProducts();
        } else {
            products = userService.getProductsByType(type);
        }
        ModelAndView mav = new ModelAndView("userbuyproducts");
        mav.addObject("productslist", products);
        return mav;
    }*/

    
    
    
    
    
    
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //update password................................................................................>\
    
    @GetMapping("/user/forgetpassword")
    public ModelAndView forgetPassword() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("userForgetPassword");
        return mv;
    }

    @PostMapping("/user/validateUser")
    public ModelAndView validateUser(
            @RequestParam("username") String username,
            @RequestParam("phone") String phone) {

        ModelAndView modelAndView = new ModelAndView();

        // Find user by username and phone number
        User user = userService.findByUsernameAndPhone(username, phone);

        if (user != null && user.isUserApproval()) {
            // Set approval to false for admin re-verification
            user.setUserApproval(false);
            userService.updateUser(user);

            // Redirect to the set password page
            modelAndView.setViewName("redirect:/user/setPassword?username=" + username);
        } else {
            // If invalid, return to the forgot password page with a message
            modelAndView.setViewName("userForgetPassword");
            modelAndView.addObject("message", "Invalid username or phone number.");
        }

        return modelAndView;
    }

    @GetMapping("/user/setPassword")
    public ModelAndView setPasswordPage(@RequestParam("username") String username) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("userSetPassword");
        modelAndView.addObject("username", username);
        return modelAndView;
    }

    @PostMapping("/user/updatePassword")
    public ModelAndView updatePassword(
            @RequestParam("username") String username,
            @RequestParam("newPassword") String newPassword,
            @RequestParam("confirmPassword") String confirmPassword) {

        ModelAndView modelAndView = new ModelAndView();

        // Check if passwords match
        if (!newPassword.equals(confirmPassword)) {
            modelAndView.setViewName("userSetPassword");
            modelAndView.addObject("message", "Passwords do not match!");
            return modelAndView;
        }

        // Find the user by username
        User user = userService.findByUsername(username);
        if (user != null) {
            user.setPassword(newPassword); // Set new password
            userService.updateUser(user);

            // Redirect to login page after password reset
            modelAndView.setViewName("redirect:/userlogin");
        } else {
            modelAndView.setViewName("userSetPassword");
            modelAndView.addObject("message", "User not found!");
        }

        return modelAndView;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //update profiel
    @GetMapping("userupdateprofile")
    public ModelAndView viewProfile(HttpSession session) {
    	 User loggedUser = (User) session.getAttribute("user");
        if (loggedUser == null) {
            return new ModelAndView("redirect:/userlogin");
        }

        
        ModelAndView modelAndView = new ModelAndView("userupdateprofile");
        modelAndView.addObject("user", loggedUser);
        return modelAndView;
    }
   
        @PostMapping( "updateuserprofile")
        public ModelAndView updateUserProfile(@RequestParam("password") String password,
                                              @RequestParam("name") String name,
                                              @RequestParam("email") String username,
                                              @RequestParam("phone") String phone,
                                              @RequestParam("address") String address,
                                              @RequestParam("state") String state,
                                              HttpSession session,
                                              RedirectAttributes redirectAttributes) {

            ModelAndView modelAndView = new ModelAndView();

            // Get the user from the session
            User currentUser = (User) session.getAttribute("user");

            // If user is null, it means the user is not logged in, handle accordingly
            if (currentUser == null) {
                modelAndView.addObject("error", "Please log in first.");
                modelAndView.setViewName("userlogin");  // Redirect to login page
                return modelAndView;
            }

            // Verify password
            if (!userService.verifyPassword(currentUser, password)) {
                modelAndView.addObject("error", "Invalid password. Please try again.");
                modelAndView.setViewName("updateprofile");  // Return to the update profile page with an error
                return modelAndView;
            }

            // Update user details
            currentUser.setName(name);
            currentUser.setUsername(username);
            currentUser.setPhone(phone);
            currentUser.setAddress(address);
            currentUser.setState(state);
            //try  to make the approval to false

            // Save the updated user details in the database
           String message = userService.updateUser(currentUser);
           redirectAttributes.addFlashAttribute("message", message );
            // Successfully updated, redirect to login page
            modelAndView.setViewName("redirect:/userupdateprofile");  // Redirect to login page after successful update
            return modelAndView;
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        @GetMapping("/userlogout")
        public String logout(HttpSession session) {
            // Invalidate the session to clear all attributes
            session.invalidate();
            return "redirect:/userlogin"; // Redirect to login page after logout
        }

        
        @Autowired
        private ProductService productService;

        
        
        @GetMapping("/products")
        public String getFarmerProducts(@RequestParam("farmerId") int farmerId, Model model) {
            System.out.println("Fetching products for farmer ID: " + farmerId);  // Debug log
            List<Product> productList = productService.getProductsByFarmerId(farmerId);
            
            if (productList.isEmpty()) {
                model.addAttribute("message", "No products found for this farmer.");
            } else {
                model.addAttribute("productList", productList);
            }

            return "userfarmerproduct";
        }

        
        
        @GetMapping("/buyProduct")
        public String buyProduct(@RequestParam("id") int productId, Model model) {
            Product product = productService.getProductById(productId); // Fetch product by ID
            model.addAttribute("product", product); // Add product to the model
            return "buyProduct"; // Return the view for product details
        }
        
        
        
        
        @GetMapping("/payment")
        public String showCheckoutPage(@RequestParam("productId") int productId, Model model) {
            // Fetch product data by its ID
            Product product = productService.getProductById(productId);
            
            // Add product details to the model
            model.addAttribute("product", product);
            
            // Return the checkout page view
            return "payment";
        }
        
        @PostMapping("/process-payment")
        public String processPayment(@RequestParam("productId") int productId, 
                                     @RequestParam("productName") String productName,
                                     @RequestParam("totalPrice") Double totalPrice, 
                                     @RequestParam("paymentMethod") String paymentMethod, 
                                     Model model) {
            // Process payment logic here (e.g., integrate with payment gateway)
            
            // Assuming payment is successful, generate a transaction ID
            String transactionId = generateTransactionId(); // Implement this method to generate transaction ID
            
            // Create a product object or fetch it from the database
            Product product = productService.getProductById(productId); // Fetch product details from the DB
            
            // Add payment details to the model to pass to the JSP
            model.addAttribute("product", product); // Add the product details
            model.addAttribute("paymentMethod", paymentMethod); // Add the payment method
            model.addAttribute("transactionId", transactionId); // Add the transaction ID
            
            // Redirect to the payment success page
            return "payment-success"; // This will resolve to payment-success.jsp
        }

        // Helper method to generate a dummy transaction ID (replace with actual payment gateway logic)
        private String generateTransactionId() {
            return "TXN" + System.currentTimeMillis(); // Simple example, customize as needed
        }
} 
    
