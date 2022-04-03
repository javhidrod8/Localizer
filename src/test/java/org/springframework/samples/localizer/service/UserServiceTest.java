package org.springframework.samples.localizer.service;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Optional;
import java.util.Set;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.samples.localizer.model.Authorities;
import org.springframework.samples.localizer.model.User;


@SpringBootTest
class UserServiceTest {
	@Autowired
	protected UserService userService;
	@Autowired
	protected AuthoritiesService auService;

	@Test
	void shouldFindUserByUserName() {
		
		User user = new User();
		Authorities au = new Authorities();
		Set<Authorities> aus = new HashSet<Authorities>(); 
		
		
		user.setUsername("pruebador");
		user.setPassword("Contrasen4");
		user.setFirstName("Test");
		user.setLastName("Prueba");
		user.setTienda(null);
		au.setAuthority("cliente");
		au.setUser(user);
		aus.add(au);
		user.setAuthorities(aus);
		
		this.userService.saveUser(user);
		this.auService.saveAuthorities(au);
		
		User usuario = this.userService.findUser("pruebador");
		
		assertThat(usuario.getUsername()).isEqualTo(user.getUsername());
	}

	@Test
	public void shouldInsertUser() {

		User user = new User();
		
		user.setUsername("pruebador");
		user.setPassword("Contrasen4");
		user.setFirstName("Test");
		user.setLastName("Prueba");
		user.setTienda(null);
		String found = user.getUsername();

		this.userService.saveUser(user);
		User usuarios = this.userService.findUser("pruebador");
		
		assertThat(usuarios.getUsername()).isEqualTo(found);
	}

	@Test
	public void shouldDeleteUser() {

		User user = new User();
		Authorities au = new Authorities();
		Set<Authorities> aus = new HashSet<Authorities>(); 
		
		user = this.userService.findUser("admin1");
		this.userService.deleteUser(user);	
		User usuario = this.userService.findUser("admin1");

		assertThat(usuario).isNull();
	}

}
