package org.springframework.samples.localizer.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.samples.localizer.model.User;


public interface UserRepository extends  CrudRepository<User, String>{
	
		
}
