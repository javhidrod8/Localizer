package org.springframework.samples.localizer.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
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

}
