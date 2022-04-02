package org.springframework.samples.localizer.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.samples.localizer.model.User;


public interface UserRepository extends  CrudRepository<User, String>{
	
	@Query("SELECT user FROM User user WHERE user.username=:username")
	public User findByUsername(@Param("username") String username);
	
		
}
