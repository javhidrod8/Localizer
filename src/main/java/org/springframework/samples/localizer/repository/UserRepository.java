package org.springframework.samples.localizer.repository;


import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.samples.localizer.model.Producto;
import org.springframework.samples.localizer.model.Tienda;

import org.springframework.samples.localizer.model.User;


public interface UserRepository extends CrudRepository<User, String>{
	

	@Query("SELECT user FROM User user WHERE user.username=:username")
	public User findByUsername(@Param("username") String username);
	
		

	@Query("select u from User u where u.username = ?1")
	User findUserByUsername(String s) throws DataAccessException; 


}
