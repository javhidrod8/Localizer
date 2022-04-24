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
import org.springframework.samples.localizer.repository.TiendaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pl.coderion.model.Product;

@Service
public class ProductoService {

	private ProductoRepository productoRepository;
	private TiendaRepository tiendaRepository;
	private TiendaService tiendaService;
	private IntoleranciasService intoleranciasService;

	@Autowired
	public ProductoService(ProductoRepository productoRepository, TiendaService tiendaService) {
		this.productoRepository = productoRepository;
		this.tiendaService = tiendaService;
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
		
		productoRepository.delete(producto);

	}
	@Transactional
	public void saveProductoAPI(Product producto, Integer tiendaId, Double precio) throws DataAccessException {
		Producto p = new Producto();
		Tienda t = tiendaService.findTiendaById(tiendaId);
		p.setTienda(t);
		p.setDescripcion(producto.getProductName());
		p.setEstado(Estado.ACEPTADO);
		p.setImagen(producto.getImageFrontSmallUrl());
		Set<Intolerancias> listIntolerancias = new HashSet<Intolerancias>();
		String[] traces = producto.getAllergensTags();
		for(int i = 0; i<traces.length;i++) {
			Intolerancias j = new Intolerancias();
			j.setNombre(traces[i].replace("en:", "").toUpperCase().trim());
			listIntolerancias.add(j);
		}
		p.setIntolerancia(listIntolerancias);
		p.setMarca(producto.getBrands());
		p.setNombre(producto.getProductName());
		p.setPreferencia(Preferencias.TODO);
		p.setPrecio(precio);
		p.setPromocionado(false);
		System.out.println("======================language" + producto.getLanguagesCodes() + "===========================");
		System.out.println("======================language" + producto.getLanguagesHierarchy() + "===========================");
		System.out.println("======================language" + producto.getLanguagesTags().toString() + "===========================");
		System.out.println("======================AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAa" + producto.getAllergensFromUser() + "===========================");
		System.out.println("======================AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAa" + producto.getIngredientsTextWithAllergens() + "===========================");
		System.out.println("======================AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAa" + producto.getIngredients() + "===========================");
		System.out.println("======================AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAa" + producto.getAllergens() + "===========================");
		System.out.println("======================AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAa" + producto.getImageIngredientsSmallUrl() + "===========================");
		System.out.println("======================AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAa" + producto.getTracesFromIngredients() + "===========================");
		System.out.println("======================AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAa" + producto.getLabels() + "===========================");
		System.out.println("======================AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAa" + producto.getLabelsLc() + "===========================");
		System.out.println("======================AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAa" + producto.getAllergensLc() + "===========================");

		this.productoRepository.save(p);
		t.getProductos().add(p);
		
		//this.tiendaRepository.save(tienda);
	}

}
