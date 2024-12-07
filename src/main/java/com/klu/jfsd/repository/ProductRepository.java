package com.klu.jfsd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klu.jfsd.model.Farmer;
import com.klu.jfsd.model.Product;
@Repository
public interface ProductRepository extends JpaRepository<Product, Integer > {
	
	
	
	//@Query("select p from Product p where p.specification = ?1")
	  List<Product> findByType(String specification);
	  
	  
	  List<Product> findByFarmerId(Integer farmerId);
	 

	List<Product> findBySpecification(String specification);
	
	
	List<Product> findByFarmerId(int farmerId);
	  


}
