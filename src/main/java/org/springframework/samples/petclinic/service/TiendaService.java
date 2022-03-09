package org.springframework.samples.petclinic.service;



import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.samples.petclinic.model.Tienda;
import org.springframework.samples.petclinic.repository.TiendaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class TiendaService {
	
	private TiendaRepository tiendaRepository;
	
	@Autowired
	public TiendaService(TiendaRepository tiendaRepository) {
		this.tiendaRepository = tiendaRepository;
	}
	
	@Transactional(readOnly = true)
	public Tienda findTiendaById(int id) throws DataAccessException {
		return tiendaRepository.findTiendaById(id);
	}

	@Transactional(readOnly = true)
	public Collection<Tienda> findByCodigoPostal(Integer codigo_postal) throws DataAccessException {
		return tiendaRepository.findByCodigoPostal(codigo_postal);
	}
}
