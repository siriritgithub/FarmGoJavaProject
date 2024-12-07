package com.klu.jfsd.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.klu.jfsd.model.Farmer;
import com.klu.jfsd.model.User;

@Repository
public interface FarmerRepository extends JpaRepository<Farmer, Integer> {
 
	   List<Farmer> findByApprovedFalse();
	   
	   Farmer findByUsernameAndPhone(String username, String phone);
	    Farmer findByUsername(String username);
  
    @Query("select f from Farmer f where f.username = ?1 and f.password = ?2")
    Farmer checkCustomerLogin(String username, String password);
}
