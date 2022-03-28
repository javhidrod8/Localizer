package org.springframework.samples.localizer.service;


import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.samples.localizer.model.Estado;
import org.springframework.samples.localizer.model.Producto;
import org.springframework.samples.localizer.repository.ProductoRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ProductoService {

	private ProductoRepository productoRepository;
	
	@Autowired
	public ProductoService(ProductoRepository productoRepository) {
		this.productoRepository = productoRepository;
	}
	
	@Transactional(readOnly = true)
	public Producto findProductoById(int id) throws DataAccessException {
		return productoRepository.findById(id);
	}
	
	@Transactional(readOnly = true)
	public Collection<Producto> findProductoTiendaByLike(Integer id) throws DataAccessException{
		return productoRepository.findProductoByTiendaLike(id);
	}
	
	@Transactional(readOnly = true)
	public Collection<Producto> findByNombre(String nombre) throws DataAccessException{
		return productoRepository.findByNombreIgnoreCaseContaining(nombre);
	}
	
	@Transactional(readOnly = true)
	public Collection<Producto> findAllProductos() throws DataAccessException{
		return productoRepository.findAllProductos();
	}
	
	@Transactional(readOnly = true)
	public Collection<Producto> findProductoByEstado(Estado estado) throws DataAccessException {
		return productoRepository.findProductosByEstado(estado);
	}
	
	@Transactional
	public void saveProducto(Producto producto) throws DataAccessException{
		productoRepository.save(producto);
	}
}
