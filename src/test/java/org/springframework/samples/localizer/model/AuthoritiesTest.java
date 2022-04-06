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

public class AuthoritiesTest {

		private Validator createValidator() {
			LocalValidatorFactoryBean localValidatorFactoryBean = new LocalValidatorFactoryBean();
			localValidatorFactoryBean.afterPropertiesSet();
			return localValidatorFactoryBean;
		}
		
		@Test
		void shouldValidate() {
		
			User u = new User();
			Authorities au = new Authorities();
			au.setAuthority("cliente");
			
			u.setUsername("paco1");
			u.setFirstName("paco");
			u.setLastName("me");
			u.setPassword("1234");
			u.setEnabled(true);
			
			au.setUser(u);
		
		
			
			Validator validator = createValidator();
			Set<ConstraintViolation<Authorities>> constraintViolations = validator.validate(au);
			
			assertThat(constraintViolations.size()).isEqualTo(0);
			assertThat(u.isEnabled()).isEqualTo(true);
			assertThat(au.getUser()).isEqualTo(u);
			assertThat(au.getAuthority()).isEqualTo("cliente");

			
		}
		@Test
		void shouldNotValidateWhenAuthorityLessSize3 () {
			LocaleContextHolder.setLocale(Locale.ENGLISH);
					
			User u = new User();
			Authorities au = new Authorities();
			au.setAuthority("cl");
			
			u.setUsername("paco1");
			u.setFirstName("paco");
			u.setLastName("me");
			u.setPassword("1234");
			u.setEnabled(true);
			
			au.setUser(u);
		
		
			
			Validator validator = createValidator();
			Set<ConstraintViolation<Authorities>> constraintViolations = validator.validate(au);
			
			assertThat(constraintViolations.size()).isEqualTo(1);
			assertThat(au.getAuthority()).isEqualTo("cl");
			ConstraintViolation<Authorities> violation = constraintViolations.iterator().next();
			assertThat(violation.getPropertyPath().toString()).isEqualTo("authority");
			assertThat(violation.getMessage()).isEqualTo("size must be between 3 and 50");
			
		}
		@Test
		void shouldNotValidateWhenAuthorityMoreSize50 () {
			LocaleContextHolder.setLocale(Locale.ENGLISH);
					
			User u = new User();
			Authorities au = new Authorities();
			au.setAuthority("cliente879cliente879cliente879cliente879cliente879123");
			
			u.setUsername("paco1");
			u.setFirstName("paco");
			u.setLastName("me");
			u.setPassword("1234");
			u.setEnabled(true);
			
			au.setUser(u);
		
		
			
			Validator validator = createValidator();
			Set<ConstraintViolation<Authorities>> constraintViolations = validator.validate(au);
			
			assertThat(constraintViolations.size()).isEqualTo(1);
			assertThat(au.getAuthority()).isEqualTo("cliente879cliente879cliente879cliente879cliente879123");
			ConstraintViolation<Authorities> violation = constraintViolations.iterator().next();
			assertThat(violation.getPropertyPath().toString()).isEqualTo("authority");
			assertThat(violation.getMessage()).isEqualTo("size must be between 3 and 50");
			
		}

}
