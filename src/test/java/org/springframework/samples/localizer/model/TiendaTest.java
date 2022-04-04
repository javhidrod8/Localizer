package org.springframework.samples.localizer.model;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.Locale;
import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.Validator;

import org.junit.jupiter.api.Test;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;

/**
 * @author Michael Isvy Simple test to make sure that Bean Validation is working (useful
 * when upgrading to a new version of Hibernate Validator/ Bean Validation)
 */
class TiendaTest {

	private Validator createValidator() {
		LocalValidatorFactoryBean localValidatorFactoryBean = new LocalValidatorFactoryBean();
		localValidatorFactoryBean.afterPropertiesSet();
		return localValidatorFactoryBean;
	}
//	@Test
//	void shouldValidateConstructor() {
//
//		LocaleContextHolder.setLocale(Locale.ENGLISH);
//		Tienda tienda = new Tienda();
//		tienda.setCalle("Sevilla");
//		tienda.setCodigoPostal("90");
//		tienda.setDescripcion("Amasando pan desde 1990");
//		tienda.setId(200);
//		tienda.setHorario("8:00-14:00");
//		tienda.setImagen(".....");
//		tienda.setNombre("Panaderia paco");
//		tienda.setProductos(null);
//		tienda.setProvincia("Sevilla");
//		tienda.setTelefono("955444765");    
//		User user = new User();
//		user.setUsername("pruebador");
//		user.setPassword("Contrasen4");
//		user.setFirstName("Test");
//		user.setLastName("Prueba");
//		user.setTienda(tienda);
//		tienda.setUser(user);
//		Tienda tienda1 = new Tienda(tienda);
//		
//		tienda1.getUser();	
//		
//		assertThat(tienda1.getNombre()).isEqualTo("Panaderia paco");
//		assertThat(tienda1.getDescripcion()).isEqualTo("Amasando pan desde 1990");
//		assertThat(tienda1.getProvincia()).isEqualTo("Sevilla");
//		assertThat(tienda1.getCalle()).isEqualTo("Sevilla");
//		assertThat(tienda1.getImagen()).isEqualTo(".....");
//		assertThat(tienda1.getHorario()).isEqualTo("8:00-14:00");
//		assertThat(tienda1.getCodigoPostal()).isEqualTo(90);
//		assertThat(tienda1.getProductos()).isEqualTo(null);
//		//assertThat(tienda1.getUser()).isEqualTo(tienda.getUser());
//		assertThat(tienda1.toString()).isEqualTo(tienda.toString());
//	}
	@Test
	void shouldValidate() {

		LocaleContextHolder.setLocale(Locale.ENGLISH);
		Tienda tienda = new Tienda();
		tienda.setCalle("Sevilla");
		tienda.setCodigoPostal("90");
		tienda.setDescripcion("Amasando pan desde 1990");
		tienda.setId(200);
		tienda.setHorario("8:00-14:00");
		tienda.setImagen(".....");
		tienda.setNombre("Panaderia paco");
		tienda.setProductos(null);
		tienda.setProvincia("Sevilla");
		tienda.setTelefono("955444765");    
		User user = new User();
		user.setUsername("pruebador");
		user.setPassword("Contrasen4");
		user.setFirstName("Test");
		user.setLastName("Prueba");
		user.setTienda(tienda);
		tienda.setUser(user);
		
		Validator validator = createValidator();
		Set<ConstraintViolation<Tienda>> constraintViolations = validator.validate(tienda);	
		
		assertThat(constraintViolations.size()).isEqualTo(0);
		assertThat(tienda.getNombre()).isEqualTo("Panaderia paco");
		assertThat(tienda.getDescripcion()).isEqualTo("Amasando pan desde 1990");
		assertThat(tienda.getProvincia()).isEqualTo("Sevilla");
		assertThat(tienda.getCalle()).isEqualTo("Sevilla");
		assertThat(tienda.getImagen()).isEqualTo(".....");
		assertThat(tienda.getCodigoPostal()).isEqualTo("90");
		assertThat(tienda.getProductos()).isEqualTo(null);
		assertThat(tienda.getHorario()).isEqualTo("8:00-14:00");
		assertThat(tienda.getTelefono()).isEqualTo("955444765");
		assertThat(tienda.getUser()).isEqualTo(user);
	}
	

	@Test
	void shouldNotValidateWhenNombreEmpty() {

		LocaleContextHolder.setLocale(Locale.ENGLISH);
		Tienda tienda = new Tienda();
		tienda.setCalle("Sevilla");
		tienda.setCodigoPostal("90");
		tienda.setDescripcion("Amasando pan desde 1990");
		tienda.setId(200);
		tienda.setHorario("8:00-14:00");
		tienda.setImagen(".....");
		tienda.setNombre("");
		tienda.setProductos(null);
		tienda.setProvincia("Sevilla");
		tienda.setTelefono("955444765");    
		User user = new User();
		user.setUsername("pruebador");
		user.setPassword("Contrasen4");
		user.setFirstName("Test");
		user.setLastName("Prueba");
		user.setTienda(tienda);
		tienda.setUser(user);
		
		
		
		Validator validator = createValidator();
		Set<ConstraintViolation<Tienda>> constraintViolations = validator.validate(tienda);
		
		assertThat(tienda.getNombre()).isEqualTo("");
		assertThat(constraintViolations.size()).isEqualTo(1);
		ConstraintViolation<Tienda> violation = constraintViolations.iterator().next();
		assertThat(violation.getPropertyPath().toString()).isEqualTo("nombre");
		assertThat(violation.getMessage()).isEqualTo("must not be empty");
	}
	@Test
	void shouldNotValidateWhenDescriptionEmpty() {

		LocaleContextHolder.setLocale(Locale.ENGLISH);
		Tienda tienda = new Tienda();
		tienda.setCalle("Sevilla");
		tienda.setCodigoPostal("90");
		tienda.setDescripcion("");
		tienda.setId(200);
		tienda.setHorario("8:00-14:00");
		tienda.setImagen(".....");
		tienda.setNombre("Panaderia paco");
		tienda.setProductos(null);
		tienda.setProvincia("Sevilla");
		tienda.setTelefono("955444765");    
		User user = new User();
		user.setUsername("pruebador");
		user.setPassword("Contrasen4");
		user.setFirstName("Test");
		user.setLastName("Prueba");
		user.setTienda(tienda);
		tienda.setUser(user);
		
		
		Validator validator = createValidator();
		Set<ConstraintViolation<Tienda>> constraintViolations = validator.validate(tienda);
		
		assertThat(tienda.getDescripcion()).isEqualTo("");
		assertThat(constraintViolations.size()).isEqualTo(1);
		ConstraintViolation<Tienda> violation = constraintViolations.iterator().next();
		assertThat(violation.getPropertyPath().toString()).isEqualTo("descripcion");
		assertThat(violation.getMessage()).isEqualTo("must not be empty");
	}
	@Test
	void shouldNotValidateWhenCalleEmpty() {

		LocaleContextHolder.setLocale(Locale.ENGLISH);
		Tienda tienda = new Tienda();
		tienda.setCalle("");
		tienda.setCodigoPostal("90");
		tienda.setDescripcion("Amasando pan desde 1990");
		tienda.setId(200);
		tienda.setHorario("8:00-14:00");
		tienda.setImagen(".....");
		tienda.setNombre("Panederia Paco");
		tienda.setProductos(null);
		tienda.setProvincia("Sevilla");
		tienda.setTelefono("955444765");    
		User user = new User();
		user.setUsername("pruebador");
		user.setPassword("Contrasen4");
		user.setFirstName("Test");
		user.setLastName("Prueba");
		user.setTienda(tienda);
		tienda.setUser(user);
		
		
		
		Validator validator = createValidator();
		Set<ConstraintViolation<Tienda>> constraintViolations = validator.validate(tienda);
		
		assertThat(tienda.getCalle()).isEqualTo("");
		assertThat(constraintViolations.size()).isEqualTo(1);
		ConstraintViolation<Tienda> violation = constraintViolations.iterator().next();
		assertThat(violation.getPropertyPath().toString()).isEqualTo("calle");
		assertThat(violation.getMessage()).isEqualTo("must not be empty");
	}
	@Test
	void shouldNotValidateWhenProvinciaEmpty() {

		LocaleContextHolder.setLocale(Locale.ENGLISH);
		Tienda tienda = new Tienda();
		tienda.setCalle("Sevilla");
		tienda.setCodigoPostal("90");
		tienda.setDescripcion("Amasando pan desde 1990");
		tienda.setId(2);
		tienda.setHorario("8:00-14:00");
		tienda.setImagen(".....");
		tienda.setNombre("Panaderia Paco");
		tienda.setProductos(null);
		tienda.setProvincia("");
		tienda.setTelefono("955444765");    
		User user = new User();
		user.setUsername("pruebador");
		user.setPassword("Contrasen4");
		user.setFirstName("Test");
		user.setLastName("Prueba");
		user.setTienda(tienda);
		tienda.setUser(user);
		
		
		Validator validator = createValidator();
		Set<ConstraintViolation<Tienda>> constraintViolations = validator.validate(tienda);
		
		assertThat(tienda.getProvincia()).isEqualTo("");
		assertThat(constraintViolations.size()).isEqualTo(1);
		ConstraintViolation<Tienda> violation = constraintViolations.iterator().next();
		assertThat(violation.getPropertyPath().toString()).isEqualTo("provincia");
		assertThat(violation.getMessage()).isEqualTo("must not be empty");
	}
	@Test
	void shouldNotValidateWhenImagenEmpty() {

		LocaleContextHolder.setLocale(Locale.ENGLISH);
		Tienda tienda = new Tienda();
		tienda.setCalle("Sevilla");
		tienda.setCodigoPostal("90");
		tienda.setDescripcion("Amasando pan desde 1990");
		tienda.setId(200);
		tienda.setHorario("8:00-14:00");
		tienda.setImagen("");
		tienda.setNombre("Panaderia Paco");
		tienda.setProductos(null);
		tienda.setProvincia("Sevilla");
		tienda.setTelefono("955444765");    
		User user = new User();
		user.setUsername("pruebador");
		user.setPassword("Contrasen4");
		user.setFirstName("Test");
		user.setLastName("Prueba");
		user.setTienda(tienda);
		tienda.setUser(user);
		
		
		
		Validator validator = createValidator();
		Set<ConstraintViolation<Tienda>> constraintViolations = validator.validate(tienda);
		
		assertThat(tienda.getImagen()).isEqualTo("");
		assertThat(constraintViolations.size()).isEqualTo(1);
		ConstraintViolation<Tienda> violation = constraintViolations.iterator().next();
		assertThat(violation.getPropertyPath().toString()).isEqualTo("imagen");
		assertThat(violation.getMessage()).isEqualTo("must not be empty");
	}
	@Test
	void shouldNotValidateWhenCodigoPostalEmpty() {

		LocaleContextHolder.setLocale(Locale.ENGLISH);
		Tienda tienda = new Tienda();
		tienda.setCalle("Sevilla");
		tienda.setCodigoPostal("");
		tienda.setDescripcion("Amasando pan desde 1990");
		tienda.setId(200);
		tienda.setHorario("8:00-14:00");
		tienda.setImagen("....");
		tienda.setNombre("Panaderia Paco");
		tienda.setProductos(null);
		tienda.setProvincia("Sevilla");
		tienda.setTelefono("955444765");    
		User user = new User();
		user.setUsername("pruebador");
		user.setPassword("Contrasen4");
		user.setFirstName("Test");
		user.setLastName("Prueba");
		user.setTienda(tienda);
		tienda.setUser(user);
		tienda.toString();
		
		
		Validator validator = createValidator();
		Set<ConstraintViolation<Tienda>> constraintViolations = validator.validate(tienda);
		
		assertThat(tienda.getCodigoPostal()).isEqualTo("");
		assertThat(constraintViolations.size()).isEqualTo(1);
		ConstraintViolation<Tienda> violation = constraintViolations.iterator().next();
		assertThat(violation.getPropertyPath().toString()).isEqualTo("codigoPostal");
		assertThat(violation.getMessage()).isEqualTo("must not be empty");
	}
//	@Test
//	void shouldNotValidateWhenTelefonoEmpty() {
//
//		LocaleContextHolder.setLocale(Locale.ENGLISH);
//		Tienda tienda = new Tienda();
//		tienda.setCalle("Sevilla");
//		tienda.setCodigoPostal("90");
//		tienda.setDescripcion("Amasando pan desde 1990");
//		tienda.setId(200);
//		tienda.setHorario("8:00-14:00");
//		tienda.setImagen("....");
//		tienda.setNombre("Panaderia Paco");
//		tienda.setProductos(null);
//		tienda.setProvincia("Sevilla");
//		tienda.setTelefono("");    
//		User user = new User();
//		user.setUsername("pruebador");
//		user.setPassword("Contrasen4");
//		user.setFirstName("Test");
//		user.setLastName("Prueba");
//		user.setTienda(tienda);
//		tienda.setUser(user);
//		
//		
//		
//		Validator validator = createValidator();
//		Set<ConstraintViolation<Tienda>> constraintViolations = validator.validate(tienda);
//		
//		assertThat(tienda.getTelefono()).isEqualTo("");
//		assertThat(constraintViolations.size()).isEqualTo(1);
//		ConstraintViolation<Tienda> violation = constraintViolations.iterator().next();
//		assertThat(violation.getPropertyPath().toString()).isEqualTo("telefono");
//		assertThat(violation.getMessage()).isEqualTo("must not be empty");
//	}
	@Test
	void shouldNotValidateWhenHorarioEmpty() {

		LocaleContextHolder.setLocale(Locale.ENGLISH);
		Tienda tienda = new Tienda();
		tienda.setCalle("Sevilla");
		tienda.setCodigoPostal("90");
		tienda.setDescripcion("Amasando pan desde 1990");
		tienda.setId(200);
		tienda.setHorario("");
		tienda.setImagen(".....");
		tienda.setNombre("Panaderia Paco");
		tienda.setProductos(null);
		tienda.setProvincia("Sevilla");
		tienda.setTelefono("955444765");    
		User user = new User();
		user.setUsername("pruebador");
		user.setPassword("Contrasen4");
		user.setFirstName("Test");
		user.setLastName("Prueba");
		user.setTienda(tienda);
		tienda.setUser(user);
		
		
		
		Validator validator = createValidator();
		Set<ConstraintViolation<Tienda>> constraintViolations = validator.validate(tienda);
		
		assertThat(tienda.getHorario()).isEqualTo("");
		assertThat(constraintViolations.size()).isEqualTo(1);
		ConstraintViolation<Tienda> violation = constraintViolations.iterator().next();
		assertThat(violation.getPropertyPath().toString()).isEqualTo("horario");
		assertThat(violation.getMessage()).isEqualTo("must not be empty");
	}

}
