package org.springframework.samples.localizer.repository;

import java.util.Collection;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.samples.localizer.model.Producto;
import org.springframework.samples.localizer.model.Tienda;

public interface TiendaRepository extends JpaRepository<Tienda, Integer> {
	
	Tienda findTiendaById(int id) throws DataAccessException; 
	
	List<Tienda> findAll() throws DataAccessException;
  
  @Query("select p from Producto p where p.tienda.id = 1")
	public List<Producto> findAllProductos();
	
	@Query("select t from Tienda t where t.codigoPostal = ?1")
	Collection<Tienda> findByCodigoPostal(String codigoPostal);

}
