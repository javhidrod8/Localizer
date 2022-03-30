package org.springframework.samples.localizer.service;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.samples.localizer.model.User;


@SpringBootTest
class UserServiceTest {
	@Autowired
	protected UserService userService;

	@Test
	void shouldFindUserByUserName() {
		User user = new User();
		user.setUsername("pruebador");
		user.setPassword("Contrasen4");
		user.setFirstName("Test");
		user.setLastName("Prueba");
		user.setTienda(null);
		
		this.userService.saveUser(user);
		Optional<User> usuario = this.userService.findUser("pruebador");
		assertThat(usuario.get().getUsername()).isEqualTo(user.getUsername());
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

		Optional<User> usuarios = this.userService.findUser("pruebador");
		assertThat(usuarios.get().getUsername()).isEqualTo(found);
	}

	@Test
	public void shouldDeleteUser() {

		User user = new User();
		user.setUsername("pruebador");
		user.setPassword("Contrasen4");
		user.setFirstName("Test");
		user.setLastName("Prueba");
		user.setTienda(null);
		
		this.userService.saveUser(user);
		this.userService.deleteUser(user);
		Optional<User> usuarios = this.userService.findUser("pruebador");

		assertThat(usuarios.orElse(null)).isNull();
	}

}
