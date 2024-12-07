package com.klu.jfsd.service;

import java.util.List;
import org.springframework.web.servlet.ModelAndView;
import com.klu.jfsd.model.Farmer;
import com.klu.jfsd.model.Product;
import com.klu.jfsd.model.User;

public interface UserService {
    String userRegistration(User user);
    User checkUserLogin(String username, String password);
    List<Farmer> viewAllFarmers();
    List<Product> viewAllProducts();
    List<Product> getProductsBySpecification(String specification);
    List<Product> getProductsByType(String type);
    
    
    
    
    
    
    //approval......................................................................................>
	List<User> getAllPendingUsers();
	void approveUser(int userId);
	void rejectUser(int userId);
	
	
	
	
	  // Method to find a user by username and phone
    User findByUsernameAndPhone(String username, String phone);

    // Method to find a user by username
    User findByUsername(String username);

    String updateUser(User user);
    
    
    //updation user......................................................>
    User getUserById(int userId);
    boolean updateUser1(User user, String password);
	
	boolean verifyPassword(User currentUser, String password);
	
	
	
}
