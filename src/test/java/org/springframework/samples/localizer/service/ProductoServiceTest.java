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
import org.springframework.samples.localizer.model.Preferencias;
import org.springframework.samples.localizer.model.Producto;
import org.springframework.samples.localizer.model.Tienda;

@SpringBootTest
public class ProductoServiceTest {

	@Autowired
	protected ProductoService productoService;

	@Autowired
	protected TiendaService tiendaService;

	private static final Logger LOG = Logger
			.getLogger("org.springframework.samples.localizer.service.ProductoServiceTests");
	Producto producto1 = new Producto();
	Producto producto2 = new Producto();
	Tienda tienda1 = new Tienda();
	
	/*
	@BeforeTransaction
	public void setup() {

		this.producto1.setDescripcion("Tomate frito para cocinar");
		this.producto1.setId(2);
		this.producto1.setImagen("....");
		this.producto1.setIntolerancia(new HashSet<>());
		this.producto1.setMarca("Orlando");
		this.producto1.setNombre("Tomate frito");
		this.producto1.setPrecio(2.50);
		this.producto1.setPreferencia(Preferencias.TODO);
		this.producto1.setTienda(this.tienda1);
		this.producto1.setVerificado(true);

		this.productoService.saveProducto(this.producto1);

		this.producto2.setDescripcion("Aceite de oliva para cocinar");
		this.producto2.setId(3);
		this.producto2.setImagen("....");
		this.producto2.setIntolerancia(new HashSet<>());
		this.producto2.setMarca("Carbonell");
		this.producto2.setNombre("Aceite de oliva");
		this.producto2.setPrecio(20.00);
		this.producto2.setPreferencia(Preferencias.TODO);
		this.producto2.setTienda(this.tienda1);
		this.producto2.setVerificado(true);

		this.productoService.saveProducto(this.producto2);

		this.tienda1.setCalle("Sevilla");
		this.tienda1.setCodigoPostal(89);
		this.tienda1.setDescripcion("Todo lo que necesitas");
		this.tienda1.setId(2);
		this.tienda1.setHorario("8:00-14:00");
		this.tienda1.setImagen(".....");
		this.tienda1.setNombre("Polvillo");
		this.tienda1.setProductos(null);
		this.tienda1.setProvincia("Sevilla");
		this.tienda1.setTelefono(955444765);
		this.tiendaService.saveTienda(tienda1);

	}*/

	@Test
	// Encontrar tienda por el id
	public void shouldFindProductoById() {
		/*Producto producto = new Producto();

		producto.setDescripcion("Tomate frito para cocinar");
		producto.setId(2);
		producto.setImagen("....");
		producto.setIntolerancia(new HashSet<>());
		producto.setMarca("Orlando");
		producto.setNombre("Tomate frito");
		producto.setPrecio(2.50);
		producto.setPreferencia(Preferencias.TODO);
		producto.setTienda(null);
		producto.setVerificado(true);

		this.productoService.saveProducto(producto);*/
		Producto p = this.productoService.findProductoById(1);
		assertThat(p.getId()).isEqualTo(1).isNotNull();
	}

	@Test
	@Disabled
	// Encontrar productos de una tienda
	public void shouldFindProductosTiendaByLike() {

		Tienda tienda = new Tienda();
		tienda.setCalle("Sevilla");
		tienda.setCodigoPostal(89);
		tienda.setDescripcion("Todo lo que necesitas");
		tienda.setId(2);
		tienda.setHorario("8:00-14:00");
		tienda.setImagen(".....");
		tienda.setNombre("Polvillo");
		tienda.setProductos(null);
		tienda.setProvincia("Sevilla");
		tienda.setTelefono(654654654);
		this.tiendaService.saveTienda(tienda);

		Producto producto1 = new Producto();
		producto1.setDescripcion("Tomate frito para cocinar");
		producto1.setId(2);
		producto1.setImagen("....");
		producto1.setIntolerancia(new HashSet<>());
		producto1.setMarca("Orlando");
		producto1.setNombre("Tomate frito");
		producto1.setPrecio(2.50);
		producto1.setPreferencia(Preferencias.TODO);
		producto1.setTienda(tienda);
		producto1.setPromocionado(true);
		this.productoService.saveProducto(producto1);

		Producto producto2 = new Producto();
		producto2.setDescripcion("Aceite de oliva para cocinar");
		producto2.setId(3);
		producto2.setImagen("....");
		producto2.setIntolerancia(new HashSet<>());
		producto2.setMarca("Carbonell");
		producto2.setNombre("Aceite de oliva");
		producto2.setPrecio(20.00);
		producto2.setPreferencia(Preferencias.TODO);
		producto2.setTienda(tienda);
		producto2.setPromocionado(true);
		this.productoService.saveProducto(producto2);

		Set<Producto> productos = new HashSet<Producto>();
		productos.add(producto1);
		productos.add(producto2);

		tienda.setProductos(productos);
		this.tiendaService.saveTienda(tienda);

		Collection<Producto> res = this.productoService.findProductoTiendaByLike(producto1.getTienda().getId());
		assertThat(res.size()).isEqualTo(2);
	}

	@Test
	// Encontrar todos los productos que contengan un nombre
	public void shouldFindProductosByNombre() {

		/*Producto producto1 = new Producto();
		producto1.setDescripcion("Tomate frito para cocinar");
		producto1.setId(2);
		producto1.setImagen("....");
		producto1.setIntolerancia(new HashSet<>());
		producto1.setMarca("Orlando");
		producto1.setNombre("Tomate frito");
		producto1.setPrecio(2.50);
		producto1.setPreferencia(Preferencias.TODO);
		producto1.setTienda(null);
		producto1.setVerificado(true);
		this.productoService.saveProducto(producto1);

		Producto producto2 = new Producto();
		producto2.setDescripcion("Aceite de oliva para cocinar");
		producto2.setId(3);
		producto2.setImagen("....");
		producto2.setIntolerancia(new HashSet<>());
		producto2.setMarca("Carbonell");
		producto2.setNombre("Aceite de oliva");
		producto2.setPrecio(20.00);
		producto2.setPreferencia(Preferencias.TODO);
		producto2.setTienda(null);
		producto2.setVerificado(true);
		

		Producto producto3 = new Producto();
		producto3.setDescripcion("Tomate frito para cocinar");
		producto3.setId(2);
		producto3.setImagen("....");
		producto3.setIntolerancia(new HashSet<>());
		producto3.setMarca("Orlando");
		producto3.setNombre("Tomate");
		producto3.setPrecio(2.50);
		producto3.setPreferencia(Preferencias.TODO);
		producto3.setTienda(null);
		producto3.setVerificado(true);*/
		

		Collection<Producto> productos = this.productoService.findByNombre("crema");
		assertThat(productos.size()).isEqualTo(4);
	}

	@Test // CASO NEGATIVO
	// No encontrar ningun producto por el nombre
	void shouldNotFindProductoByNombre() {

		List<Producto> p = new ArrayList<>();

		p.addAll(this.productoService.findByNombre("ninguno"));

		int count = p.size();

		Assertions.assertTrue(count == 0);
	}

	@Test
	// Encontrar todos los productos
	public void findAllProducts() {

		Collection<Producto> productos = this.productoService.findAllProductos();
		assertThat(productos.size()).isEqualTo(50);
	}

}
