package com.klu.jfsd.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.klu.jfsd.model.User;

public interface UserRepository extends JpaRepository<User, Integer> {

   
	 List<User> findByUserApproval(boolean userApproval); 
	 
	// Find a user by username and phone number
	    User findByUsernameAndPhone(String username, String phone);

	    // Find a user by username
	    User findByUsername(String username);
	    
	    
	 
    // Custom query for user login validation
    @Query("SELECT u FROM User u WHERE u.username = ?1 AND u.password = ?2")
    User checkUserLogin(String username, String password);
}
