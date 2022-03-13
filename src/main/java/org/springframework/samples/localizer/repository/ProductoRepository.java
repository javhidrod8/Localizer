package org.springframework.samples.localizer.repository;

import java.util.Collection;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import org.springframework.samples.localizer.model.Producto;

public interface ProductoRepository extends JpaRepository<Producto, Integer>{
	
  Producto findById(int id) throws DataAccessException;
	
  @Query("select p from Producto p where p.tienda.id like ?1")
	Collection<Producto> findProductoByTiendaLike(Integer id);
  
  @Query("select p from Producto p")
  	public List<Producto> findAllProductos();
  
  Collection<Producto> findByNombreIgnoreCaseContaining(String nombre);
}