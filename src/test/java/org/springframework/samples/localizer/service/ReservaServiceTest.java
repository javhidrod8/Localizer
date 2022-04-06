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
import org.springframework.samples.localizer.model.Preferencias;
import org.springframework.samples.localizer.model.Producto;
import org.springframework.samples.localizer.model.Reserva;
import org.springframework.samples.localizer.model.Tienda;
import org.springframework.samples.localizer.model.User;

@SpringBootTest
public class ReservaServiceTest {

	@Autowired
	protected ReservaService reservaService;
	
	@Autowired
	protected ProductoService productoService;

	@Autowired
	protected TiendaService tiendaService;
	
	@Autowired
	protected UserService userService;


	private static final Logger LOG = Logger
			.getLogger("org.springframework.samples.localizer.service.ReservaServiceTests");

	

	@Test
	// Encontrar reserva por el id
	public void shouldFindReservaById() {

		Reserva p = this.reservaService.findReservaById(1);
		assertThat(p.getId()).isEqualTo(1).isNotNull();
	}

	@Test
	// Encontrar reservas de una tienda
	public void shouldFindReservaByTienda() {


		List<Reserva> res = this.reservaService.findReservaByTienda(1);
		assertThat(res.size()).isEqualTo(1);
	}

	@Test
	// Encontrar todos las reservas de un usuario
	public void shouldFindReservaByUser() {

		List<Reserva> res = this.reservaService.findReservaByUser("cliente1");
		assertThat(res.size()).isEqualTo(1);
	}
	@Test 
	// encontrar reservas por estado y tienda
	//TODO no devuelve nada
	void shouldNotFindReservaByEstadoAndTienda() {

		List<Reserva> p = new ArrayList<>();

		p.addAll(this.reservaService.findReservaByEstadoAndTienda(Estado.PENDIENTE, 1));

		int count = p.size();

		assertThat(count).isEqualTo(0);
	}

		
	@Test
	void shouldSaveandDeleteReserva() {
		
		Reserva res = new Reserva();
		Tienda tienda = this.tiendaService.findTiendaById(4);
		Producto p = this.tiendaService.findProductos(tienda.getId()).iterator().next();
		User user = this.userService.findUser("cliente1");
		res.setTienda(tienda);
		res.setProducto(p);
		res.setCantidad(1);
		res.setEstado(Estado.PENDIENTE);
		res.setUser(user);
		res.setPrecio_total(2.00);
		
		this.reservaService.saveReserva(res);
		assertThat(res.getId()).isNotNull().isEqualTo(2);
		
		this.reservaService.deleteReserva(res);
		Reserva r = this.reservaService.findReservaById(2);
		assertThat(r).isNull();

	}
	
	

}
