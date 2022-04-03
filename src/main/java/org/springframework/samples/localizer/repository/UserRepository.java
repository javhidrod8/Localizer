package org.springframework.samples.localizer.repository;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.samples.localizer.model.Producto;
import org.springframework.samples.localizer.model.Tienda;
import org.springframework.samples.localizer.model.User;


public interface UserRepository extends CrudRepository<User, String>{
	
	@Query("select u from User u where u.username like ?1")
	User findUserByUsername(String s) throws DataAccessException; 

}
