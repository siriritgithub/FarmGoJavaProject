package com.klu.jfsd.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klu.jfsd.model.Admin;
import com.klu.jfsd.model.Farmer;
import com.klu.jfsd.model.Feedback;
import com.klu.jfsd.model.Product;
import com.klu.jfsd.model.User;
import com.klu.jfsd.service.AdminService;
import com.klu.jfsd.service.FarmerService;

import com.klu.jfsd.service.UserService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class AdminController {

	@Autowired
	AdminService adminService;

    @Autowired
    private FarmerService farmerService;	
    
    @Autowired
    private UserService userService;
	
    
    @GetMapping("/")
    public String home() {
        return "home"; // This will render home.html from the templates folder
    }
   
	//regular home page before any logins
	@GetMapping("/home")
	public ModelAndView homePage() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("home");
		return mv;
	}
	
	
	//calling admin login page
	@GetMapping("/adminlogin")
	public ModelAndView  adminLogin() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminlogin");
		return mv;
	}
	@PostMapping("checkadminlogin")
	public ModelAndView checkAdminLogin(HttpServletRequest request) {
		String name = request.getParameter("admin-username");
		String Password  = request.getParameter("admin-password");
		
		Admin admin = adminService.checkAdminLogin(name, Password);
		
		ModelAndView mv = new ModelAndView();
		
		if(admin != null) {
			mv.setViewName("adminhome");
		}
		else {
			mv.setViewName("adminlogin");
			mv.addObject("message", "login failed! Please try again");
		}
		return mv;
	}
	
	//next to login goto admin home
	
	@GetMapping("adminhome")
	public ModelAndView adminhome() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminhome");
		return mv;
	}
	
	//performing c-r-u-d operations
	//add
	//functions
	@GetMapping("addfarmer")
	public ModelAndView addFarmer() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addfarmers");
		return mv;
	}
	@PostMapping("adminaddfarmer")
	public ModelAndView adminAddFarmer(HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView();
	    
	    // Retrieve form parameters
	    String name = request.getParameter("name");
	    String phone = request.getParameter("phone");
	    String username = request.getParameter("username");
	    String address = request.getParameter("address");
	    String state = request.getParameter("state");
	    String password = request.getParameter("password");
	    String image = request.getParameter("image");
	    // Create a Farmer object
	    Farmer farmer = new Farmer();
	    farmer.setName(name);
	    farmer.setPhone(phone);
	    farmer.setUsername(username);
	    farmer.setAddress(address);
	    farmer.setState(state);
	    farmer.setPassword(password);
	    farmer.setImage(image);
	    // Call the adminService to add the farmer
	    String message = adminService.addFarmer(farmer);
	    
	    // Set view name and add attributes
	    mv.setViewName("addfarmer"); // Adjust the view name to your farmer-specific page
	    mv.addObject("message", message);
	    
	    return mv;
	}

	
	@GetMapping("adduser")
	public ModelAndView addUser() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adduser");
		return mv;
	}
	
	@PostMapping("adminaddUser")
	public ModelAndView adminAddUser(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        String address = request.getParameter("address");
        String state = request.getParameter("state");
        String password = request.getParameter("password");
        String image = request.getParameter("image");
        User user = new User();
        user.setName(name);
        user.setPhone(phone);
        user.setUsername(username);
        user.setAddress(address);
        user.setState(state);
        user.setPassword(password);
       
		user.setImageUrl(image);
		
        String Message = adminService.addUser(user);
        mv.setViewName("adduser");
        
        mv.addObject("message",Message);
        return mv;
	}
	
	
	
	@GetMapping("addproduct")
	public ModelAndView addProduct() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addproduct");
		return mv;
	}
	
    

	//..............................................................................>
    @GetMapping("aboutus")
	public ModelAndView aboutUs() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("homeaboutus");
		return mv;
	}
    @GetMapping("feedbackus")
   	public ModelAndView feedbackUs() {
   		ModelAndView mv = new ModelAndView();
   		mv.setViewName("homefeedbackus");
   		return mv;
   	}
    @PostMapping("/submitContact")
    public ModelAndView submitContact(HttpServletRequest request) {
    	 ModelAndView mv = new ModelAndView();

         // Retrieve the form fields from the HttpServletRequest
         String name = request.getParameter("name");
         String accessor = request.getParameter("accessor");
         String email = request.getParameter("email");
         String subject = request.getParameter("subject");
         String message = request.getParameter("message");
     	
         Feedback feedback = new Feedback();
         feedback.setName(name);
         feedback.setEmail(email);
         feedback.setAccessor(accessor);
         feedback.setSubject(subject);
         feedback.setMessage(message);
         
    
         mv.setViewName("messagepage");
         mv.addObject("message", "posted sucessful");
         
         return mv;
    }
    
    @GetMapping("services")
   	public ModelAndView services() {
   		ModelAndView mv = new ModelAndView();
   		mv.setViewName("homeservices");
   		return mv;
   	}
    
    //......................................................................................................>
	

	
	
	
	@GetMapping("adminviewallfarmers")
    public ModelAndView userViewAllFarmers() {
    	ModelAndView modelAndView = new ModelAndView("adminviewallfarmers");
        List<Farmer> farmers = adminService.viewAllFarmers();
        if (farmers == null || farmers.isEmpty()) {
            System.out.println("No farmers found!"); // Debugging
        }
        modelAndView.addObject("farmerslist", farmers);
        return modelAndView;
    }
	
	@GetMapping("adminviewallusers")
	public ModelAndView adminViewAllUsers() {
	    ModelAndView modelAndView = new ModelAndView("adminviewallusers");
	    List<User> users = adminService.viewAllUsers();
	    if (users == null || users.isEmpty()) {
	        System.out.println("No users found!"); // Debugging
	    }
	    modelAndView.addObject("userslist", users);
	    return modelAndView;
	}

	@GetMapping("adminviewallproducts")
	public ModelAndView adminViewAllProducts() {
	    ModelAndView modelAndView = new ModelAndView("adminviewallproducts");
	    List<Product> products = adminService.viewAllProducts();
	    if (products == null || products.isEmpty()) {
	        System.out.println("No users found!"); // Debugging
	    }
	    modelAndView.addObject("productslist", products);
	    return modelAndView;
	}



	public ModelAndView viewUnapprovedFarmers2() {
        List<Farmer> unapprovedFarmers = farmerService.getUnapprovedFarmers();

        // Debugging output
        System.out.println("Unapproved Farmers Count: " + unapprovedFarmers.size());
        for (Farmer farmer : unapprovedFarmers) {
            System.out.println("Farmer ID: " + farmer.getId());
            System.out.println("Farmer Name: " + farmer.getName());
            System.out.println("Farmer Approved: " + farmer.isApproved());
        }

        ModelAndView modelAndView = new ModelAndView("adminapprovefarmer");
        modelAndView.addObject("farmers", unapprovedFarmers);
        return modelAndView;
    }



	 @GetMapping("/adminapprovefarmers")
	    public ModelAndView viewUnapprovedFarmers() {
	        List<Farmer> unapprovedFarmers = farmerService.getUnapprovedFarmers();
	        ModelAndView modelAndView = new ModelAndView("adminapprovefarmer");
	        modelAndView.addObject("farmers", unapprovedFarmers);
	        System.out.println("Farmers sent to JSP: " + unapprovedFarmers);
	        return modelAndView;
	        
	    }

	 @PostMapping("/approvefarmer")
	    public ModelAndView approveFarmer(@RequestParam("farmerId") int farmerId) {
	        farmerService.approveFarmer(farmerId);
	        return new ModelAndView("redirect:/adminapprovefarmers");
	    }

	    // Reject a farmer
	    @PostMapping("/rejectfarmer")
	    public ModelAndView rejectFarmer(@RequestParam("farmerId") int farmerId) {
	        farmerService.deleteFarmer(farmerId);
	        return new ModelAndView("redirect:/adminapprovefarmers");
	    }
    
    
	    

	    @GetMapping("/adminapproveusers")
	    public ModelAndView showPendingUsers() {
	        List<User> pendingUsers = userService.getAllPendingUsers();
	        ModelAndView modelAndView = new ModelAndView("adminapproveuser");
	        modelAndView.addObject("users", pendingUsers);
	        return modelAndView;
	    }

	    @PostMapping("/approveuser")
	    public String approveUser(@RequestParam("userId") int userId) {
	        userService.approveUser(userId);
	        return "redirect:/adminapproveusers";
	    }

	    @PostMapping("/rejectuser")
	    public String rejectUser(@RequestParam("userId") int userId) {
	        userService.rejectUser(userId);
	        return "redirect:/adminapproveusers";
	    }
	    @PostMapping("/deletefarmer")
	    public ModelAndView deleteFarmer(@RequestParam("farmerId") int farmerId) {
	        ModelAndView modelAndView = new ModelAndView("adminviewallfarmers");  // Redirecting back to the list page
	        String message = adminService.deleteFarmer(farmerId);  // Call the service to delete the farmer
	        
	        // Add the message to the ModelAndView object so it can be displayed on the JSP
	        modelAndView.addObject("message", message);
	        
	        // Optionally, fetch updated list of farmers to show the remaining ones
	        List<Farmer> farmers = adminService.viewAllFarmers();
	        modelAndView.addObject("farmerslist", farmers);
	        
	        return modelAndView;  // Return to the farmers list view
	    }
}

