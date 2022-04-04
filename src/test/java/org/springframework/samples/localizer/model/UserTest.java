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
		
			User u = new User();
			Set<Authorities> aus = new HashSet<Authorities>();
			Authorities au = new Authorities();
			au.setAuthority("cliente");
			
			u.setUsername("paco1");
			u.setFirstName("paco");
			u.setLastName("me");
			u.setPassword("1234");
			u.setEnabled(true);
			au.setUser(u);
			aus.add(au);
			u.setAuthorities(aus);
			u.setTienda(null);
			
			Validator validator = createValidator();
			Set<ConstraintViolation<User>> constraintViolations = validator.validate(u);
			
			assertThat(constraintViolations.size()).isEqualTo(0);
			assertThat(u.isEnabled()).isEqualTo(true);
			assertThat(u.getTienda()).isEqualTo(null);
			assertThat(u.getAuthorities()).isEqualTo(aus);

			
		}
		@Test
		void shouldNotValidateWhenUsernameBlank() {
			LocaleContextHolder.setLocale(Locale.ENGLISH);
		
			User u = new User();
			Set<Authorities> aus = new HashSet<Authorities>();
			Authorities au = new Authorities();
			au.setAuthority("cliente");
			
			u.setUsername("");
			u.setFirstName("paco");
			u.setLastName("me");
			u.setPassword("1234");
			u.setEnabled(true);
			au.setUser(u);
			aus.add(au);
			u.setAuthorities(aus);
			u.setTienda(null);
			
			Validator validator = createValidator();
			Set<ConstraintViolation<User>> constraintViolations = validator.validate(u);
			
			assertThat(constraintViolations.size()).isEqualTo(1);
			assertThat(u.getUsername()).isEqualTo("");
			ConstraintViolation<User> violation = constraintViolations.iterator().next();
			assertThat(violation.getPropertyPath().toString()).isEqualTo("username");
			assertThat(violation.getMessage()).isEqualTo("must not be blank");

			
		}
		@Test
		void shouldNotValidateWhenFirstNameBlank() {
			LocaleContextHolder.setLocale(Locale.ENGLISH);
		
			User u = new User();
			Set<Authorities> aus = new HashSet<Authorities>();
			Authorities au = new Authorities();
			au.setAuthority("cliente");
			
			u.setUsername("paco1");
			u.setFirstName("");
			u.setLastName("me");
			u.setPassword("1234");
			u.setEnabled(true);
			au.setUser(u);
			aus.add(au);
			u.setAuthorities(aus);
			u.setTienda(null);
			
			Validator validator = createValidator();
			Set<ConstraintViolation<User>> constraintViolations = validator.validate(u);
			
			assertThat(constraintViolations.size()).isEqualTo(1);
			assertThat(u.getFirstName()).isEqualTo("");
			ConstraintViolation<User> violation = constraintViolations.iterator().next();
			assertThat(violation.getPropertyPath().toString()).isEqualTo("firstName");
			assertThat(violation.getMessage()).isEqualTo("must not be blank");
			
		}
		@Test
		void shouldNotValidateWhenLastNameBlank() {
			LocaleContextHolder.setLocale(Locale.ENGLISH);
		
			User u = new User();
			Set<Authorities> aus = new HashSet<Authorities>();
			Authorities au = new Authorities();
			au.setAuthority("cliente");
			
			u.setUsername("paco1");
			u.setFirstName("paco");
			u.setLastName("");
			u.setPassword("1234");
			u.setEnabled(true);
			au.setUser(u);
			aus.add(au);
			u.setAuthorities(aus);
			u.setTienda(null);
			
			Validator validator = createValidator();
			Set<ConstraintViolation<User>> constraintViolations = validator.validate(u);
			
			assertThat(constraintViolations.size()).isEqualTo(1);
			assertThat(u.getLastName()).isEqualTo("");
			ConstraintViolation<User> violation = constraintViolations.iterator().next();
			assertThat(violation.getPropertyPath().toString()).isEqualTo("lastName");
			assertThat(violation.getMessage()).isEqualTo("must not be blank");
			
		}
		
		@Test
		void shouldNotValidateWhenPasswordBlank() {
			LocaleContextHolder.setLocale(Locale.ENGLISH);
		
			User u = new User();
			Set<Authorities> aus = new HashSet<Authorities>();
			Authorities au = new Authorities();
			au.setAuthority("cliente");
			
			u.setUsername("paco1");
			u.setFirstName("paco");
			u.setLastName("me");
			u.setPassword("");
			u.setEnabled(true);
			au.setUser(u);
			aus.add(au);
			u.setAuthorities(aus);
			u.setTienda(null);
			
			Validator validator = createValidator();
			Set<ConstraintViolation<User>> constraintViolations = validator.validate(u);
			
			assertThat(constraintViolations.size()).isEqualTo(1);
			assertThat(u.getPassword()).isEqualTo("");
			ConstraintViolation<User> violation = constraintViolations.iterator().next();
			assertThat(violation.getPropertyPath().toString()).isEqualTo("password");
			assertThat(violation.getMessage()).isEqualTo("must not be blank");
			
		}
		
		
		

}
