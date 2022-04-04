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

public class UserTest {

		private Validator createValidator() {
			LocalValidatorFactoryBean localValidatorFactoryBean = new LocalValidatorFactoryBean();
			localValidatorFactoryBean.afterPropertiesSet();
			return localValidatorFactoryBean;
		}
		
		@Test
		void shouldValidate() {
			Producto producto = new Producto();
			Tienda tienda = new Tienda();
			User u = new User();
			Set<Authorities> aus = new HashSet<Authorities>();
			Authorities au = new Authorities();
			au.setAuthority("cliente");
			
			u.setFirstName("paco");
			u.setLastName("me");
			u.setPassword("1234");
			u.setEnabled(true);
			au.setUser(u);
			u.setAuthorities(aus);
			
			Validator validator = createValidator();
			Set<ConstraintViolation<Producto>> constraintViolations = validator.validate(producto);
			
			assertThat(constraintViolations.size()).isEqualTo(0);
			
			assertThat(producto.isNew()).isEqualTo(true);
		
			

			
		}
		
//		@Test
//		void shouldNotValidateWhenPrecioNegative() {
//			LocaleContextHolder.setLocale(Locale.ENGLISH);
//			Producto producto = new Producto();
//			Tienda tienda = new Tienda();
//			
//			producto.setId(2);
//			producto.setNombre("Tomate frito");
//			producto.setMarca("Orlando");
//			producto.setPrecio(-2.00);
//			producto.setMarca("Orlando");
//			producto.setDescripcion("Tomate frito para cocinar");
//			producto.setEstado(Estado.PENDIENTE);
//			producto.setPromocionado(false);
//			producto.setImagen("....");
//			producto.setMotivo("");
//			producto.setIntolerancia(new HashSet<>());
//			producto.setPreferencia(Preferencias.TODO);
//			producto.setTienda(tienda);
//			producto.toString();
//			
//			Validator validator = createValidator();
//			Set<ConstraintViolation<Producto>> constraintViolations = validator.validate(producto);
//			
//			assertThat(constraintViolations.size()).isEqualTo(1);
//			assertThat(producto.getPrecio()).isEqualTo(-2.00);
//			ConstraintViolation<Producto> violation = constraintViolations.iterator().next();
//			assertThat(violation.getPropertyPath().toString()).isEqualTo("precio");
//			assertThat(violation.getMessage()).isEqualTo("must be greater than 0");
//			
//		}
//		
		

}
