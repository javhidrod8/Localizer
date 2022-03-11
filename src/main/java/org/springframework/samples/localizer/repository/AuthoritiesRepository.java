package org.springframework.samples.localizer.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.samples.localizer.model.Authorities;



public interface AuthoritiesRepository extends  CrudRepository<Authorities, String>{
	
}
