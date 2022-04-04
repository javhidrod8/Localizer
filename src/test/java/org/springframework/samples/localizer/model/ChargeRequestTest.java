package org.springframework.samples.localizer.model;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.Validator;

import org.junit.jupiter.api.Test;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.samples.localizer.model.ChargeRequest.Currency;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;

public class ChargeRequestTest {

		private Validator createValidator() {
			LocalValidatorFactoryBean localValidatorFactoryBean = new LocalValidatorFactoryBean();
			localValidatorFactoryBean.afterPropertiesSet();
			return localValidatorFactoryBean;
		}
		
		@Test
		void shouldValidate() {
		
			ChargeRequest cr = new ChargeRequest();
			
			cr.setAmount(9);
			cr.setDescription("huevos");
			cr.setStripeEmail("hola@localizer.es");
			cr.setStripeToken("sd5f441sdf57e2a1s5");
			cr.setCurrency(Currency.EUR);
		
			
			Validator validator = createValidator();
			Set<ConstraintViolation<ChargeRequest>> constraintViolations = validator.validate(cr);
			
			assertThat(constraintViolations.size()).isEqualTo(0);
			assertThat(cr.getAmount()).isEqualTo(9);
			assertThat(cr.getCurrency()).isEqualTo(Currency.EUR);
			assertThat(cr.getDescription()).isEqualTo("huevos");
			assertThat(cr.getStripeEmail()).isEqualTo("hola@localizer.es");
			assertThat(cr.getStripeToken()).isEqualTo("sd5f441sdf57e2a1s5");
			
			
		}

}
