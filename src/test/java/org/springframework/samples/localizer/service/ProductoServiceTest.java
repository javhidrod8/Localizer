package org.springframework.samples.localizer.service;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.logging.Logger;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.samples.localizer.model.Estado;
import org.springframework.samples.localizer.model.Intolerancias;
import org.springframework.samples.localizer.model.Preferencias;
import org.springframework.samples.localizer.model.Producto;
import org.springframework.samples.localizer.model.Tienda;

@SpringBootTest
public class ProductoServiceTest {

	@Autowired
	protected ProductoService productoService;

	@Autowired
	protected IntoleranciasService IntoleranciasService;
	
	@Autowired
	protected TiendaService tiendaService;

	private static final Logger LOG = Logger
			.getLogger("org.springframework.samples.localizer.service.ProductoServiceTests");


	@Test
	// Encontrar tienda por el id
	public void shouldFindProductoById() {

		Producto p = this.productoService.findProductoById(1);
		assertThat(p.getId()).isEqualTo(1).isNotNull();
	}

	@Test
	// Encontrar productos de una tienda
	public void shouldFindProductosTiendaByLike() {


		Collection<Producto> res = this.productoService.findProductoTiendaByLike(1);
		assertThat(res.size()).isEqualTo(9);
	}

	@Test
	// Encontrar todos los productos que contengan un nombre
	public void shouldFindProductosByNombre() {

		Collection<Producto> productos = this.productoService.findByNombre("crema");
		assertThat(productos.size()).isEqualTo(1);
	}
	@Test // CASO NEGATIVO
	// No encontrar ningun producto por el nombre
	void shouldNotFindProductoByNombre() {

		List<Producto> p = new ArrayList<>();

		p.addAll(this.productoService.findByNombre("ninguno"));

		int count = p.size();

		assertThat(count).isEqualTo(0);
	}

	@Test
	// Encontrar todos los productos que contengan un nombre
	public void shouldFindAllPreferencias() {

		Collection<Preferencias> preferencias = this.productoService.findAllPreferencias();
		assertThat(preferencias.size()).isEqualTo(3);
	}
	@Test
	// Encontrar todos los productos que contengan un nombre
	public void shouldFindProductosByEstado() {

		Collection<Producto> productos = this.productoService.findProductoByEstado(Estado.PENDIENTE);
		assertThat(productos.size()).isEqualTo(6);
	}
	
	@Test
	void shouldSaveandDeleteProducto() {
		
		Producto producto = new Producto();
		
		Tienda tienda = this.tiendaService.findTiendaById(3);
		
		producto.setNombre("Tomate frito");
		producto.setMarca("Orlando");
		producto.setPrecio(2.00);
		producto.setMarca("Orlando");
		producto.setDescripcion("Tomate frito para cocinar");
		producto.setEstado(Estado.PENDIENTE);
		producto.setPromocionado(false);
		producto.setImagen("....");
		producto.setMotivo("");
		producto.setPreferencia(Preferencias.TODO);
		producto.setTienda(tienda); 
					
		
		this.productoService.saveProducto(producto);
		Producto producto1 = this.productoService.findProductoById(producto.getId());
		assertThat(producto1.getId()).isNotNull().isEqualTo(75);
	
		this.productoService.deleteProducto(producto1);
		Producto p1 = this.productoService.findProductoById(74);
//		assertThat(p1).isNull();//TODO
		assertThat(producto1.getId()).isNotNull().isEqualTo(75);
	}
	
//	@Test
//	void shouldDeleteProducto() {
//		Producto producto1 = this.productoService.findProductoById(51);
//	
//		
//		this.productoService.deleteProducto(producto1);
//		Producto p = this.productoService.findProductoById(51);
//		assertThat(p.getId()).isNull();
//	}
	
	@Test
	// Encontrar todos los productos
	public void shouldFindAllProducts() {

		Collection<Producto> productos = this.productoService.findAllProductos();
		assertThat(productos.size()).isEqualTo(75);
	}

}
