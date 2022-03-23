package org.springframework.samples.localizer.service;



import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.samples.localizer.model.Tienda;
import org.springframework.samples.localizer.repository.TiendaRepository;
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
	public Collection<Tienda> findByCodigoPostal(Integer codigoPostal) throws DataAccessException {
		return tiendaRepository.findByCodigoPostal(codigoPostal);
	}

	@Transactional
    public void saveTienda(Tienda tienda) throws DataAccessException {
        Tienda t = new Tienda(tienda);
		tiendaRepository.save(t); 

    }
}
