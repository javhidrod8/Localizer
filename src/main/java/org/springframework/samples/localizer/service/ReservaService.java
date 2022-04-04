package org.springframework.samples.localizer.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.samples.localizer.model.Estado;
import org.springframework.samples.localizer.model.Reserva;
import org.springframework.samples.localizer.repository.ReservaRepository;
import org.springframework.stereotype.Service;

@Service
public class ReservaService {
	
	private ReservaRepository reservaRepository;
	
	@Autowired
	public ReservaService(ReservaRepository reservaRepository) {
		this.reservaRepository = reservaRepository;
	}
	
	@Transactional
	public void saveReserva(Reserva reserva) throws DataAccessException {
		this.reservaRepository.save(reserva);
	}
	
	@Transactional
	public Reserva findReservaById(int id) throws DataAccessException {
		return reservaRepository.findReservaById(id);
	}
	
	@Transactional
	public void deleteReserva(Reserva reserva) throws DataAccessException {
		this.reservaRepository.delete(reserva);
	}
	
	@Transactional
	public List<Reserva> findReservaByTienda(Integer id) throws DataAccessException {
		return this.reservaRepository.findReservaByTienda(id);
	}
	
	@Transactional
	public List<Reserva> findReservaByUser(String username) throws DataAccessException {
		return this.reservaRepository.findReservaByUser(username);
	}
	
	@Transactional
	public List<Reserva> findReservaByEstadoAndTienda(Estado estado, Integer tiendaId) throws DataAccessException {
		return this.reservaRepository.findProductosByEstadoAndTienda(estado, tiendaId);
	}

}
