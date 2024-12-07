package com.klu.jfsd.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klu.jfsd.model.Farmer;
import com.klu.jfsd.model.Product;
import com.klu.jfsd.repository.ProductRepository;

@Service
public class ProductServiceImplementation implements ProductService {
	
	@Autowired
	private ProductRepository productRepository;
	
	@Override
	public List<Product> getAllProducts() {
		return productRepository.findAll();
	}
	
	   public List<Product> getProductsByType(String type) {
	        return productRepository.findByType(type);
	    }
	
	//public Product getProductById(int id) {
	  //  return productRepository.findById(id).orElseThrow(() -> new RuntimeException("Product not found"));
	//}

	//public void updateProduct(Product product) {
	//    productRepository.save(product); // Use save for both insert and update in Spring Data JPA
	//}

	 @Override
	    public Product getProductById(int productId) {
	        Optional<Product> product = productRepository.findById(productId);
	        
	        // If product is not found, throw an exception with a custom message or return null
	        return product.orElseThrow(() -> new RuntimeException("Product not found with ID: " + productId));
	    }

	   

		@Override
		public String updateProduct(Product product) {
			try {
				productRepository.save(product);
				return "Product updated success";
			}catch(Exception e) {
				e.printStackTrace();
				return "Some thing went wrong try again";
			}
			
		}
		
		@Override
		public String deleteProduct(int id) {
	        Optional<Product> productOptional = productRepository.findById(id);
	        if (productOptional.isPresent()) {
	            productRepository.deleteById(id);
	            return "Product deleted successfully!";
	        } else {
	            return "Product not found!";
	        }
	    }

		@Override
		public List<Product> getProductsByFarmer(Farmer farmer) {
			// TODO Auto-generated method stub
			return null;
		}
		
		
		 public List<Product> getProductsByFarmerId(int farmerId) {
		        // Fetch products by farmer ID
		        return productRepository.findByFarmerId(farmerId);
		    }

		
		@Override
		public void addToCart(int productId, int quantity) {
			// TODO Auto-generated method stub
			
		}

		@Override
		public void proceedToCheckout(int productId, int quantity) {
			// TODO Auto-generated method stub
			
		}
}


