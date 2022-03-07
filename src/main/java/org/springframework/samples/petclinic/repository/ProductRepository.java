package org.springframework.samples.petclinic.repository;

import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.samples.petclinic.model.Product;

public interface ProductRepository extends JpaRepository<Product, Integer>{
	
	Product findById(int id) throws DataAccessException;
}
