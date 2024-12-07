package com.klu.jfsd.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.klu.jfsd.model.Farmer;
import com.klu.jfsd.model.Product;

@Service
public interface ProductService {
	
	public String updateProduct(Product product);
	
	 public List<Product> getProductsByType(String type);
	
	public List<Product> getAllProducts(); 
       
	
	
	
	
	
	
	 List<Product> getProductsByFarmer(Farmer farmer);
	   

		String deleteProduct(int productId);
		
		public List<Product> getProductsByFarmerId(int farmerId);

		public void addToCart(int productId, int quantity);

		public void proceedToCheckout(int productId, int quantity);

		Product getProductById(int productId);

}
