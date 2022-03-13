package org.springframework.samples.localizer.repository;

import java.util.Collection;

import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.samples.localizer.model.Tienda;

public interface TiendaRepository extends JpaRepository<Tienda, Integer> {
	
	Tienda findTiendaById(int id) throws DataAccessException; 

	Collection<Tienda> findByCodigoPostal(Integer codigoPostal);
}