package com.klu.jfsd.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import com.klu.jfsd.model.Farmer;
import com.klu.jfsd.model.Product;
import com.klu.jfsd.model.User;
import com.klu.jfsd.repository.FarmerRepository;
import com.klu.jfsd.repository.ProductRepository;
import com.klu.jfsd.repository.UserRepository;

@Service
public class UserServiceImplementation implements UserService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private FarmerRepository farmerRepository;
    @Autowired
    private ProductRepository productRepository;

    @Override
    public String userRegistration(User user) {
        try {
            userRepository.save(user);
            
            return "Registration Success. Please click login to access.";
        } catch (Exception e) {
            e.printStackTrace();
           
            return "Registration failed. Please try again.";
        }
    }

    @Override
    public User checkUserLogin(String username, String password) {
        return userRepository.checkUserLogin(username, password);
    }

    @Override
    public List<Farmer> viewAllFarmers() {
        return farmerRepository.findAll();
    }

    @Override
    public List<Product> viewAllProducts() {
        return productRepository.findAll();
    }

    @Override
    public List<Product> getProductsByType(String type) {
        return productRepository.findByType(type);
    }

    @Override
    public List<Product> getProductsBySpecification(String specification) {
        if (specification == null || specification.isEmpty()) {
            return productRepository.findAll();
        }
        return productRepository.findBySpecification(specification);
    }

    
    
    
    
    
    
    
    
    
    @Override
    public List<User> getAllPendingUsers() {
        return userRepository.findByUserApproval(false); // Updated reference
    }

    @Override
    public void approveUser(int userId) {
        User user = userRepository.findById(userId).orElseThrow(() -> new RuntimeException("User not found!"));
        user.setUserApproval(true); // Updated reference
        userRepository.save(user);
    }

    @Override
    public void rejectUser(int userId) {
        userRepository.deleteById(userId);
    }
    
    
    @Override
	public String updateUser(User user) {
    	try {
		userRepository.save(user);
		return "Update Done Sucessfully";
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    		return "update unsucessful, try again";
    	}
    	
    	
    	
    	

	}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @Override
    public User findByUsernameAndPhone(String username, String phone) {
        // Find the user by username and phone number
        return userRepository.findByUsernameAndPhone(username, phone);
    }

    @Override
    public User findByUsername(String username) {
        // Find the user by username
        return userRepository.findByUsername(username);
    }

   
   
    
    
    
    
    
    
    @Override
    public User getUserById(int userId) {
        return userRepository.findById(userId).orElse(null);
    }

    @Override
    public boolean updateUser1(User user, String password) {
        User existingUser = userRepository.findById(user.getId()).orElse(null);
        if (existingUser != null && existingUser.getPassword().equals(password)) {
            userRepository.save(user);
            return true;
        }
        return false;
    }
    
    @Override
   public  boolean verifyPassword(User currentUser,String password) {
    	 return password.equals(currentUser.getPassword()); 
    }
    

	

}
