package org.springframework.samples.localizer.service;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.logging.Logger;

import javax.validation.ConstraintViolationException;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.samples.localizer.model.ChargeRequest;
import org.springframework.samples.localizer.model.Intolerancias;
import org.springframework.samples.localizer.model.Preferencias;
import org.springframework.samples.localizer.model.Producto;
import org.springframework.samples.localizer.model.Tienda;
import org.springframework.samples.localizer.model.ChargeRequest.Currency;

import com.stripe.exception.APIConnectionException;
import com.stripe.exception.APIException;
import com.stripe.exception.AuthenticationException;
import com.stripe.exception.CardException;
import com.stripe.exception.InvalidRequestException;
import com.stripe.model.Charge;

@SpringBootTest
public class StripeServiceTest {

	@Autowired
	protected StripeService  stripeService;

	@Autowired
	protected TiendaService tiendaService;

	private static final Logger LOG = Logger
			.getLogger("org.springframework.samples.localizer.service.StripeServiceTests");
	

	@Test
	// Encontrar todas las intolerancias
	public void charge() {
		ChargeRequest cr = new ChargeRequest();
		
		cr.setAmount(9);
		cr.setDescription("huevos");
		cr.setStripeEmail("hola@localizer.es");
		cr.setStripeToken("sd5f441sdf57e2a1s5");
		cr.setCurrency(Currency.EUR);

		
		Assertions.assertThrows(InvalidRequestException.class, () -> {
			this.stripeService.charge(cr);
		});
		
		
	}

}
