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

public class ProductoTest {

		private Validator createValidator() {
			LocalValidatorFactoryBean localValidatorFactoryBean = new LocalValidatorFactoryBean();
			localValidatorFactoryBean.afterPropertiesSet();
			return localValidatorFactoryBean;
		}
		
		@Test
		void shouldValidate() {
			Producto producto = new Producto();
			Tienda tienda = new Tienda();
			
			producto.setNombre("Tomate frito");
			producto.setMarca("Orlando");
			producto.setPrecio(2.50);
			producto.setMarca("Orlando");
			producto.setDescripcion("Tomate frito para cocinar");
			producto.setEstado(Estado.PENDIENTE);
			producto.setPromocionado(false);
			producto.setImagen("....");
			producto.setMotivo("");
			producto.setIntolerancia(new HashSet<>());
			producto.setPreferencia(Preferencias.TODO);
			producto.setTienda(tienda);
			producto.toString();
			
			Validator validator = createValidator();
			Set<ConstraintViolation<Producto>> constraintViolations = validator.validate(producto);
			
			assertThat(constraintViolations.size()).isEqualTo(0);
			
			assertThat(producto.isNew()).isEqualTo(true);
			assertThat(producto.getNombre()).isEqualTo("Tomate frito");
			assertThat(producto.getPrecio()).isEqualTo(2.50);
			assertThat(producto.getMarca()).isEqualTo("Orlando");
			assertThat(producto.getDescripcion()).isEqualTo("Tomate frito para cocinar");
			assertThat(producto.getEstado()).isEqualTo(Estado.PENDIENTE);
			assertThat(producto.getPromocionado()).isEqualTo(false);
			assertThat(producto.getImagen()).isEqualTo("....");
			assertThat(producto.getMotivo()).isEqualTo("");
			assertThat(producto.getIntolerancia()).isEqualTo(new HashSet<>());
			assertThat(producto.getPreferencia()).isEqualTo(Preferencias.TODO);
			assertThat(producto.getTienda()).isEqualTo(tienda);
			

			
		}
		
		@Test
		void shouldNotValidateWhenPrecioNegative() {
			LocaleContextHolder.setLocale(Locale.ENGLISH);
			Producto producto = new Producto();
			Tienda tienda = new Tienda();
			
			producto.setId(2);
			producto.setNombre("Tomate frito");
			producto.setMarca("Orlando");
			producto.setPrecio(-2.00);
			producto.setMarca("Orlando");
			producto.setDescripcion("Tomate frito para cocinar");
			producto.setEstado(Estado.PENDIENTE);
			producto.setPromocionado(false);
			producto.setImagen("....");
			producto.setMotivo("");
			producto.setIntolerancia(new HashSet<>());
			producto.setPreferencia(Preferencias.TODO);
			producto.setTienda(tienda);
			producto.toString();
			
			Validator validator = createValidator();
			Set<ConstraintViolation<Producto>> constraintViolations = validator.validate(producto);
			
			assertThat(constraintViolations.size()).isEqualTo(1);
			assertThat(producto.getPrecio()).isEqualTo(-2.00);
			ConstraintViolation<Producto> violation = constraintViolations.iterator().next();
			assertThat(violation.getPropertyPath().toString()).isEqualTo("precio");
			assertThat(violation.getMessage()).isEqualTo("must be greater than 0");
			
		}
		
		

}
