package org.springframework.samples.petclinic.repository;

import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.samples.petclinic.model.Producto;

public interface ProductoRepository extends JpaRepository<Producto, Integer>{
	
	Producto findById(int id) throws DataAccessException;
}
