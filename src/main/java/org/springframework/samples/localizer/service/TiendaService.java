package org.springframework.samples.localizer.service;



import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.samples.localizer.model.Producto;
import org.springframework.samples.localizer.model.Reserva;
import org.springframework.samples.localizer.model.Tienda;
import org.springframework.samples.localizer.repository.TiendaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class TiendaService {
	
	private TiendaRepository tiendaRepository;
	
	private ReservaService reservaService;
	
	
	@Autowired
	public TiendaService(TiendaRepository tiendaRepository, ReservaService reservaService) {
		this.tiendaRepository = tiendaRepository;
		this.reservaService = reservaService;
	}
	
	@Transactional(readOnly = true)
	public Tienda findTiendaById(int id) throws DataAccessException {
		return tiendaRepository.findTiendaById(id);
	}

	@Transactional(readOnly = true)
	public Collection<Tienda> findByCodigoPostal(String codigoPostal) throws DataAccessException {
		return tiendaRepository.findByCodigoPostal(codigoPostal);
	}

	@Transactional
    public void saveTienda(Tienda tienda) throws DataAccessException {
		tiendaRepository.save(tienda); 

    }

	@Transactional(readOnly = true)
	public Collection<Tienda> findAll() throws DataAccessException {
		return tiendaRepository.findAll();
	}

	
	@Transactional
	public Collection<Producto> findProductos(Integer id) throws DataAccessException {		
		return tiendaRepository.findAllProductos(id);
	}
  
	@Transactional
	public void deleteTienda(Tienda tienda) throws DataAccessException {
		tiendaRepository.findAllReservas(tienda.getId()).stream().forEach(r->{r.setProducto(null);r.setTienda(null);r.setUser(null);reservaService.deleteReserva(r);});
		tiendaRepository.delete(tienda); 
	}
	
	@Transactional
	public List<Reserva> findReservasTienda(int tiendaId) throws DataAccessException {
		return tiendaRepository.findAllReservas(tiendaId);
	}
	
}