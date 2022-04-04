package org.springframework.samples.localizer.repository;

import java.util.Collection;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.samples.localizer.model.Estado;
import org.springframework.samples.localizer.model.Producto;
import org.springframework.samples.localizer.model.Reserva;

public interface ReservaRepository extends JpaRepository<Reserva, Integer>{
	
	Reserva findReservaById(int id) throws DataAccessException;
	
	@Query("SELECT reserva FROM Reserva reserva WHERE reserva.tienda.id = ?1")
	public List<Reserva> findReservaByTienda(Integer id) throws DataAccessException;
	
	@Query("SELECT reserva FROM Reserva reserva WHERE reserva.user.username = ?1")
	public List<Reserva> findReservaByUser(String username) throws DataAccessException;
	
	@Query("select reserva from Reserva reserva where reserva.estado = ?1 and reserva.tienda.id = ?1")
	public List<Reserva> findProductosByEstadoAndTienda(Estado estado, Integer tiendaId);

}
