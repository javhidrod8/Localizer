package org.springframework.samples.petclinic.repository;

import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.samples.petclinic.model.Tienda;

public interface TiendaRepository extends JpaRepository<Tienda, Integer> {
	
	Tienda findTiendaById(int id) throws DataAccessException; 

}
