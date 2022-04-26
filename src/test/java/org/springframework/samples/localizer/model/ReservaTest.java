package org.springframework.samples.localizer.model;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.Validator;

import org.junit.jupiter.api.Test;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;

public class ReservaTest {
	private Validator createValidator() {
		LocalValidatorFactoryBean localValidatorFactoryBean = new LocalValidatorFactoryBean();
		localValidatorFactoryBean.afterPropertiesSet();
		return localValidatorFactoryBean;
	}
	
	@Test
	void shouldValidate() {
		Reserva reserva = new Reserva();
		Tienda tienda = new Tienda();
		Producto producto = new Producto();
		User user = new User();
		
		reserva.setId(1);
		reserva.setCantidad(2);
		reserva.setComentario("Orlando");
		reserva.setEstado(Estado.PENDIENTE);
		reserva.setProducto(producto);
		reserva.setUser(user);
		reserva.setTienda(tienda);
		reserva.toString();
		
		Validator validator = createValidator();
		Set<ConstraintViolation<Reserva>> constraintViolations = validator.validate(reserva);
		
		assertThat(constraintViolations.size()).isEqualTo(0);
		
		assertThat(reserva.isNew()).isEqualTo(false);
		assertThat(reserva.getId()).isEqualTo(1);
		assertThat(reserva.getUser()).isEqualTo(user);
		assertThat(reserva.getPrecio_total()).isEqualTo(2.50);
		assertThat(reserva.getComentario()).isEqualTo("Orlando");
		assertThat(reserva.getCantidad()).isEqualTo(2);
		assertThat(reserva.getEstado()).isEqualTo(Estado.PENDIENTE);
		assertThat(reserva.getTienda()).isEqualTo(tienda);
		assertThat(reserva.getProducto()).isEqualTo(producto);
	}
	@Test
	void shouldValidateConstructor() {
		
		Tienda tienda = new Tienda();
		Producto producto = new Producto();
		User user = new User();
		Reserva reserva = new Reserva(tienda,producto);
		reserva.setCantidad(2);
		reserva.setComentario("Orlando");
		reserva.setEstado(Estado.PENDIENTE);
		reserva.setUser(user);
		reserva.toString();
		
		Validator validator = createValidator();
		Set<ConstraintViolation<Reserva>> constraintViolations = validator.validate(reserva);
		
		assertThat(constraintViolations.size()).isEqualTo(0);
		
		assertThat(reserva.isNew()).isEqualTo(true);
		assertThat(reserva.getUser()).isEqualTo(user);
		assertThat(reserva.getPrecio_total()).isEqualTo(2.50);
		assertThat(reserva.getComentario()).isEqualTo("Orlando");
		assertThat(reserva.getCantidad()).isEqualTo(2);
		assertThat(reserva.getEstado()).isEqualTo(Estado.PENDIENTE);
		assertThat(reserva.getTienda()).isEqualTo(tienda);
		assertThat(reserva.getProducto()).isEqualTo(producto);
	}
	
	
	@Test
	void shouldNotValidateWhenCantidadNull() {
		LocaleContextHolder.setLocale(Locale.ENGLISH);
		Tienda tienda = new Tienda();
		Producto producto = new Producto();
		User user = new User();
		Reserva reserva = new Reserva(tienda,producto);
		reserva.setCantidad(null);
		reserva.setComentario("Orlando");
		reserva.setEstado(Estado.PENDIENTE);
		reserva.setUser(user);
		reserva.toString();
		
		Validator validator = createValidator();
		Set<ConstraintViolation<Reserva>> constraintViolations = validator.validate(reserva);
		
		assertThat(constraintViolations.size()).isEqualTo(1);
		assertThat(reserva.getCantidad()).isEqualTo(null);
		ConstraintViolation<Reserva> violation = constraintViolations.iterator().next();
		assertThat(violation.getPropertyPath().toString()).isEqualTo("cantidad");
		assertThat(violation.getMessage()).isEqualTo("must not be null");

	}
	@Test
	void shouldNotValidateWhenEsatdoNull() {
		
		LocaleContextHolder.setLocale(Locale.ENGLISH);
		Tienda tienda = new Tienda();
		Producto producto = new Producto();
		User user = new User();
		Reserva reserva = new Reserva(tienda,producto);
		reserva.setCantidad(2);
		reserva.setComentario("Orlando");
		reserva.setEstado(null);
		reserva.setUser(user);
		reserva.toString();
		
		Validator validator = createValidator();
		Set<ConstraintViolation<Reserva>> constraintViolations = validator.validate(reserva);
		
		assertThat(constraintViolations.size()).isEqualTo(1);
		assertThat(reserva.getEstado()).isEqualTo(null);
		ConstraintViolation<Reserva> violation = constraintViolations.iterator().next();
		assertThat(violation.getPropertyPath().toString()).isEqualTo("estado");
		assertThat(violation.getMessage()).isEqualTo("must not be null");

	}

}
