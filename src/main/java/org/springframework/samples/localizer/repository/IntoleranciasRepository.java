package org.springframework.samples.localizer.repository;


import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.samples.localizer.model.Intolerancias;

public interface IntoleranciasRepository extends JpaRepository<Intolerancias, Integer> {
	
	Intolerancias findIntoleranciasById(int id) throws DataAccessException; 

	List<Intolerancias> findAll() throws DataAccessException; 
	
	
}
