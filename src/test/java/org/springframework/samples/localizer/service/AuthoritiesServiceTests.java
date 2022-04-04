package org.springframework.samples.localizer.service;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.logging.Logger;

import javax.validation.ConstraintViolationException;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DataAccessException;
import org.springframework.samples.localizer.model.Authorities;
import org.springframework.samples.localizer.model.Producto;
import org.springframework.samples.localizer.model.Tienda;
import org.springframework.samples.localizer.model.User;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.jdbc.SqlMergeMode;
import org.springframework.test.context.jdbc.SqlMergeMode.MergeMode;
import org.springframework.test.context.transaction.BeforeTransaction;

@SpringBootTest
//@Sql({ "/import.sql" })
class AuthoritiesServiceTests {
	@Autowired
	protected TiendaService tiendaService;
	@Autowired
	protected UserService userService;
	@Autowired
	protected AuthoritiesService authoritiesService;
	private static final Logger LOG = Logger
			.getLogger("org.springframework.samples.localizer.service.AuthoritiesServiceTests");


	@Test // CASO POSITIVO
	// Guardar authority
	void shouldSaveAuthority() {
		User u = this.userService.findUser("cliente1");
		Authorities authority = new Authorities();
		authority.setAuthority("cliente");
		authority.setUser(u);
		this.authoritiesService.saveAuthorities(authority);
		List<Authorities> t = new ArrayList<>();
		t.add(authority);

		int count = t.size();

		assertThat(count).isEqualTo(1);
	}
	@Test// CASO POSITIVO
	void shouldSaveAuthorities() {
		
		this.authoritiesService.saveAuthorities("cliente1","vendedor");
		
	}
	
	@Test
	void shouldNotSaveAuthorities() {
		Assertions.assertThrows(DataAccessException.class, () -> {
			this.authoritiesService.saveAuthorities("clien","vendedor");
		});
		
		
	}


}
