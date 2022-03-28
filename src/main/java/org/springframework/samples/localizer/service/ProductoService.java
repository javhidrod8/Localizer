package org.springframework.samples.localizer.service;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import java.util.Collection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.samples.localizer.model.Producto;
import org.springframework.samples.localizer.repository.ProductoRepository;

@Service
public class ProductoService {

	private ProductoRepository productoRepository;
	
	@Autowired
	public ProductoService(ProductoRepository productoRepository) {
		this.productoRepository = productoRepository;
	}
	
	@InitBinder
	public void setAllowedFields(WebDataBinder dataBinder) {
		dataBinder.setDisallowedFields("id");
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
	
	@Transactional
	public void saveProducto(Producto producto) throws DataAccessException{
		productoRepository.save(producto);
	}

	@Transactional
	public void deleteProducto(Producto producto) throws DataAccessException{
		productoRepository.delete(producto);
		
	}
}
