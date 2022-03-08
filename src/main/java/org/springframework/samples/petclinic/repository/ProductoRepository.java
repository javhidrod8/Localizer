package org.springframework.samples.petclinic.repository;

import java.util.Collection;

import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import org.springframework.samples.petclinic.model.Producto;

public interface ProductoRepository extends JpaRepository<Producto, Integer>{
	
  Producto findById(int id) throws DataAccessException;
	
  @Query("select p from Producto p where p.tienda.id like ?1")
	Collection<Producto> findProductoByTiendaLike(Integer id);
}
