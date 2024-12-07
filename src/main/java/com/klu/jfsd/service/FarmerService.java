package com.klu.jfsd.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.klu.jfsd.model.Farmer;
import com.klu.jfsd.model.Product;
import com.klu.jfsd.model.User;

@Service
public interface FarmerService {
	
	public String farmerRegestration(Farmer f);
	
	
	public Farmer checkFarmerLogin(String username, String Password);
	
	//accepting.................................................................>>>
	
	  
	public List<User> viewAllUsers();
	
	public List<Product> viewAllProducts();
	
	//adding product............................................>
	public String addProduct(Product p );
	
	
	//profile/.......................................>
	Farmer getFarmerById(int id);
    void updateFarmer(Farmer farmer);
    
    
    //
    List<Farmer> getUnapprovedFarmers();
    void approveFarmer(int farmerId);
    void deleteFarmer(int farmerId);


	Farmer findByUsernameAndPhone(String username, String phone);


	Farmer findByUsername(String username);


	void updateFarmerprofile(Farmer farmer);

	
	

	public boolean verifyPassword(Farmer loggedFarmer, String password);


	public String updateFarmer1(Farmer loggedFarmer);


	List<Product> getProductsByFarmerId(Integer farmerId);


	public String deleteProduct(Integer farmerId, int productId);


	
}
