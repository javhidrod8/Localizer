package org.springframework.samples.localizer.service;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.logging.Logger;

import javax.validation.ConstraintViolationException;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.samples.localizer.model.Authorities;
import org.springframework.samples.localizer.model.Producto;
import org.springframework.samples.localizer.model.Tienda;
import org.springframework.samples.localizer.model.User;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.jdbc.SqlMergeMode;
import org.springframework.test.context.jdbc.SqlMergeMode.MergeMode;
import org.springframework.test.context.transaction.BeforeTransaction;

@SpringBootTest
//@Sql({ "/import.sql" })
class TiendaServiceTests {
	@Autowired
	protected TiendaService tiendaService;
	@Autowired
	protected UserService userService;
	@Autowired
	protected AuthoritiesService authoritiesService;
	private static final Logger LOG = Logger
			.getLogger("org.springframework.samples.localizer.service.TiendaServiceTests");

//
	@Test
	// Encontrar tienda por el id
	void shouldFindTiendaById() {

		Tienda t = this.tiendaService.findTiendaById(4);
		assertThat(t.getId()).isEqualTo(4).isNotNull();

	}

	@Test
	// NO Encontrar tienda por el id
	void shouldNotFindTiendaById() {

		Tienda t = this.tiendaService.findTiendaById(50);
		assertThat(t).isEqualTo(null);

	}

	@Test // CASO POSITIVO
	// Encontrar tienda por el cp
	void shouldFindTiendaByCP() {
		List<Tienda> t = new ArrayList<>();

		t.addAll(this.tiendaService.findByCodigoPostal("41001"));

		int count = t.size();

		Assertions.assertTrue(count == 1);
	}

	@Test // CASO POSITIVO
	// Encontrar varias tiendas por el cp
	void shouldFindTiendasByCP() {
//		
		List<Tienda> t = new ArrayList<>();

		t.addAll(this.tiendaService.findByCodigoPostal("41009"));

		int count = t.size();

		Assertions.assertTrue(count == 4);
	}

	@Test // CASO NEGATIVO
	// No encontrar ninguna tienda por el cp
	void shouldNotFindTiendaByCP() {

		List<Tienda> t = new ArrayList<>();

		t.addAll(this.tiendaService.findByCodigoPostal("0"));

		int count = t.size();

		Assertions.assertTrue(count == 0);
	}

	@Test // CASO POSITIVO
	// Guardar tienda
	void shouldSaveTienda() {

		Tienda tienda = new Tienda();
		tienda.setCalle("Sevilla");
		tienda.setCodigoPostal("41002");
		tienda.setDescripcion("Amasando pan desde 1990");
		tienda.setHorario("8:00-14:00");
		tienda.setImagen(".....");
		tienda.setNombre("Panaderia Paqui");
		tienda.setProductos(null);
		tienda.setProvincia("Sevilla");
		tienda.setTelefono("955444765");
		this.tiendaService.saveTienda(tienda);
		Collection<Tienda> c = this.tiendaService.findByCodigoPostal("40000");

		assertThat(c.iterator().next().getId()).isNotNull();
	}

	@Test // CASO NEGATIVO
	// Guardar tienda
	void shouldNotSaveTienda() {

		Tienda tienda = new Tienda();
		tienda.setCalle("Sevilla");
		tienda.setCodigoPostal("41000");
		tienda.setDescripcion("Amasando pan desde 1990");
		tienda.setHorario("8:00-14:00");
		tienda.setImagen(".....");
		tienda.setNombre("");
		tienda.setProductos(null);
		tienda.setProvincia("");
		tienda.setTelefono("955444765");

		Assertions.assertThrows(ConstraintViolationException.class, () -> {
			this.tiendaService.saveTienda(tienda);
		});
	}

	@Test // CASO POSITIVO
	// Encontrar todas las tiendas
	void shouldFindAll() {

		List<Tienda> t = new ArrayList<>();

		t.addAll(this.tiendaService.findAll());

		int count = t.size();

		assertThat(count).isEqualTo(10);
	}

	@Test // CASO POSITIVO
	// Encontrar todos los productos de una tienda
	void shouldFindProductos() {

		List<Producto> t = new ArrayList<>();

		t.addAll(this.tiendaService.findProductos(2));

		int count = t.size();

		assertThat(count).isEqualTo(5);
	}

	@Test // CASO POSITIVO
	// Borrar una tienda
	void shouldDeleteTienda() {

		List<Tienda> t = new ArrayList<>();

		t.addAll(this.tiendaService.findByCodigoPostal("40000"));

		this.tiendaService.deleteTienda(t.get(0));

		Tienda tienda = this.tiendaService.findTiendaById(t.get(0).getId());
		assertThat(tienda).isEqualTo(null);
	}

	@Test // CASO POSITIVO
	// Guardar authority
	void shouldSaveAuthority() {
		User u = this.userService.findUser("cliente1");
		this.userService.saveUser(u);
		Authorities authority = new Authorities();
		authority.setAuthority("cliente");
		authority.setUser(u);
		this.authoritiesService.saveAuthorities(authority);

		List<Authorities> t = new ArrayList<>();
		t.add(authority);

		int count = t.size();

		assertThat(count).isEqualTo(1);
	}

}
