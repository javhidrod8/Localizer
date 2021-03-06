package org.springframework.samples.localizer.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.samples.localizer.model.Estado;
import org.springframework.samples.localizer.model.Intolerancias;
import org.springframework.samples.localizer.model.Preferencias;
import org.springframework.samples.localizer.model.Producto;
import org.springframework.samples.localizer.model.Tienda;
import org.springframework.samples.localizer.repository.ProductoRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ProductoService {

	private ProductoRepository productoRepository;
	private TiendaService tiendaService;
	private ReservaService reservaService;

	@Autowired
	public ProductoService(ProductoRepository productoRepository, TiendaService tiendaService, ReservaService reservaService) {
		this.productoRepository = productoRepository;
		this.tiendaService = tiendaService;
		this.reservaService = reservaService;
	}

	@Transactional(readOnly = true)
	public Producto findProductoById(int id) throws DataAccessException {
		return productoRepository.findById(id);
	}

	@Transactional(readOnly = true)
	public Collection<Producto> findProductoTiendaByLike(Integer id) throws DataAccessException {
		return productoRepository.findProductoByTiendaLike(id);
	}

	@Transactional(readOnly = true)
	public Collection<Producto> findByNombre(String nombre) throws DataAccessException {
		return productoRepository.findByNombreIgnoreCaseContaining(nombre);
	}

	@Transactional(readOnly = true)
	public Collection<Producto> findAllProductos() throws DataAccessException {
		return productoRepository.findAllProductos();
	}

	@Transactional(readOnly = true)
	public Collection<Preferencias> findAllPreferencias() throws DataAccessException {
		Collection<Preferencias> preferencias = new ArrayList<Preferencias>(Arrays.asList(Preferencias.values()));
		return preferencias;
	}

	@Transactional(readOnly = true)
	public Collection<Producto> findProductoByEstado(Estado estado) throws DataAccessException {
		return productoRepository.findProductosByEstado(estado);
	}

	@Transactional
	public void saveProducto(Producto producto) throws DataAccessException {
		productoRepository.save(producto);

	}

	@Transactional
	public void deleteProducto(Producto producto) throws DataAccessException {
		Set<Intolerancias> i = producto.getIntolerancia();
		producto.getIntolerancia().removeAll(i);
		Integer tiendaId = producto.getTienda().getId();
		Tienda t = this.tiendaService.findTiendaById(tiendaId);
		t.getProductos().remove(producto);
		
		productoRepository.findReservasProducto(producto.getId()).stream().forEach(r->{r.setProducto(null);r.setTienda(null);r.setUser(null);reservaService.deleteReserva(r);});
		
		productoRepository.delete(producto);

	}
}
