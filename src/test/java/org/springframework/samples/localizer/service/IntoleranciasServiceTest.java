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
import org.springframework.samples.localizer.model.Intolerancias;
import org.springframework.samples.localizer.model.Preferencias;
import org.springframework.samples.localizer.model.Producto;
import org.springframework.samples.localizer.model.Tienda;

@SpringBootTest
public class IntoleranciasServiceTest {

	@Autowired
	protected IntoleranciasService  intoleranciasService;

	@Autowired
	protected TiendaService tiendaService;

	private static final Logger LOG = Logger
			.getLogger("org.springframework.samples.localizer.service.IntoleranciasServiceTests");
	Intolerancias intolerancias = new Intolerancias();

	@Test
	// Encontrar todas las intolerancias
	public void findAllProducts() {

		Collection<Intolerancias> into = this.intoleranciasService.findAllIntolerancias();
		assertThat(into.size()).isEqualTo(16);
	}

}
