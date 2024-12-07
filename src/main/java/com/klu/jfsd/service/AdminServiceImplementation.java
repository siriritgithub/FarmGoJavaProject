package com.klu.jfsd.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klu.jfsd.model.Admin;
import com.klu.jfsd.model.Farmer;
import com.klu.jfsd.model.Feedback;
import com.klu.jfsd.model.Product;
import com.klu.jfsd.model.User;
import com.klu.jfsd.repository.AdminRepository;
import com.klu.jfsd.repository.FarmerRepository;
import com.klu.jfsd.repository.FeedbackRepository;
import com.klu.jfsd.repository.ProductRepository;
import com.klu.jfsd.repository.UserRepository;

@Service
public class AdminServiceImplementation implements AdminService {

    @Autowired
    private AdminRepository adminRepository;

    @Autowired
    private FarmerRepository farmerRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired 
    private FeedbackRepository feedbackRepository;
    
    
    @Override
    public List<Farmer> viewAllFarmers() {
        return farmerRepository.findAll();
    }

    @Override
    public List<Product> viewAllProducts() {
        return productRepository.findAll();
    }

    @Override
    public List<User> viewAllUsers() {
        return userRepository.findAll();
    }

    @Override
    public Admin checkAdminLogin(String username, String password) {
        return adminRepository.checkAdminLogin(username, password);
    }

    @Override
    public String addFarmer(Farmer farmer) {
        try {
            farmerRepository.save(farmer);
            return "Farmer added successfully!";
        } catch (Exception e) {
            e.printStackTrace();
            return "Something went wrong while adding farmer. Please try again.";
        }
    }

    @Override
    public String addUser(User user) {
        try {
            userRepository.save(user);
            return "User added successfully!";
        } catch (Exception e) {
            e.printStackTrace();
            return "Something went wrong while adding user. Please try again.";
        }
    }

    @Override
    public String addProduct(Product product) {
        try {
            productRepository.save(product);
            return "Product added successfully!";
        } catch (Exception e) {
            e.printStackTrace();
            return "Something went wrong while adding product. Please try again.";
        }
    }

    public String collectfeedback(Feedback feedback) {
        try {
            feedbackRepository.save(feedback); // Save the feedback object
            return "Feedback submitted successfully!";
        } catch (Exception e) {
            e.printStackTrace();
            return "Failed to submit feedback!";
        }
    }

	@Override
	public String takeFeedback(Feedback feedback) {
		try {
		feedbackRepository.save(feedback);
		return "feedback posted sucessfully wait for reply! Thank(ing)you ,ADMIN";
		}
		catch(Exception e) {
			e.printStackTrace();
			return "Something went wrong during Submission , try again";
		}
	}
	@Override
    public String deleteFarmer(int farmerId) {
        try {
            // Check if the farmer exists in the database
            if (farmerRepository.existsById(farmerId)) {
                // Perform the delete operation
                farmerRepository.deleteById(farmerId);
                return "Farmer deleted successfully!";
            } else {
                return "Farmer not found!";
            }
        } catch (Exception e) {
            // Handle any errors that occur during the deletion process
            return "Error deleting farmer: " + e.getMessage();
        }
    }
	


  
	}
     
     

