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

public class IntoleranciasTest {

		private Validator createValidator() {
			LocalValidatorFactoryBean localValidatorFactoryBean = new LocalValidatorFactoryBean();
			localValidatorFactoryBean.afterPropertiesSet();
			return localValidatorFactoryBean;
		}
		
		@Test
		void shouldValidate() {
		
			Intolerancias i = new Intolerancias();
			i.setNombre("cacahuete");
			System.out.println(i.toString());
			
			Validator validator = createValidator();
			Set<ConstraintViolation<Intolerancias>> constraintViolations = validator.validate(i);
			
			assertThat(constraintViolations.size()).isEqualTo(0);
			assertThat(i.getNombre()).isEqualTo("cacahuete");
			
		}
		

}
