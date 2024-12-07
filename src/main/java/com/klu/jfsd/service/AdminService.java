package com.klu.jfsd.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.klu.jfsd.model.Admin;
import com.klu.jfsd.model.Farmer;
import com.klu.jfsd.model.Feedback;
import com.klu.jfsd.model.Product;
import com.klu.jfsd.model.User;

@Service
public interface AdminService {
    
    // Authentication
    Admin checkAdminLogin(String username, String password);
    
    
    String takeFeedback(Feedback feedback);

    // View operations
    List<Farmer> viewAllFarmers();
    List<Product> viewAllProducts();
    List<User> viewAllUsers();

    // Add operations
    String addFarmer(Farmer farmer);
    String addUser(User user);
    String addProduct(Product product);
    String deleteFarmer(int farmerId);
	String collectfeedback(Feedback feedback);

}
