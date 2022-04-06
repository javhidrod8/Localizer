package org.springframework.samples.localizer.web;

import org.assertj.core.util.Lists;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.BDDMockito;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import static org.hamcrest.Matchers.hasProperty;
import static org.hamcrest.Matchers.is;
import static org.mockito.BDDMockito.given;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.FilterType;
import org.springframework.samples.localizer.configuration.SecurityConfiguration;
import org.springframework.samples.localizer.model.Tienda;
import org.springframework.samples.localizer.model.User;
import org.springframework.samples.localizer.service.AuthoritiesService;
import org.springframework.samples.localizer.service.TiendaService;
import org.springframework.samples.localizer.service.UserService;
import org.springframework.security.config.annotation.web.WebSecurityConfigurer;
import org.springframework.security.test.context.support.WithMockUser;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import java.util.Optional;

import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;

/**
 * Test class for {@link OwnerController}
 *
 * @author Colin But
 */

@WebMvcTest(controllers=UserController.class,
		excludeFilters = @ComponentScan.Filter(type = FilterType.ASSIGNABLE_TYPE, classes = WebSecurityConfigurer.class),
		excludeAutoConfiguration= SecurityConfiguration.class)
class UserControllerTests {


	@Autowired
	private UserController userController;

	        
    @MockBean
	private UserService userService;
        
    @MockBean
    private AuthoritiesService authoritiesService; 
    @MockBean
    private TiendaService tiendaService; 

	@Autowired
	private MockMvc mockMvc;

	private User george;
	private User user;
	private Tienda tienda;


	
	@BeforeEach
	void setup() {

		this.george = new User();
		this.george.setUsername("george1");
		this.george.setPassword("pass123");
		this.george.setFirstName("George");
		this.george.setLastName("Franklin");
		this.george.setTienda(null);
		
		this.tienda = new Tienda();
        tienda.setId(1);
        tienda.setCalle("Sevilla");
		tienda.setCodigoPostal("41011");
		tienda.setDescripcion("Amasando pan desde 1990");
		tienda.setHorario("8:00-14:00");
		tienda.setImagen(".....");
		tienda.setNombre("Panaderia Paqui");
	    tienda.setProductos(null);
	    tienda.setProvincia("Sevilla");
	    tienda.setTelefono("955444765"); 
		
		this.user = new User();
		this.user.setUsername("user");
		this.user.setPassword("pass123");
		this.user.setFirstName("George");
		this.user.setLastName("Franklin");
		this.user.setTienda(this.tienda);
		
		
	//	this.userService.saveUser(this.george);
		//this.g = Optional.of(this.george);
		
	//	System.out.println(this.george.toString()+"sdasdasdaspiodjasdfujhasdfguihasdofiuhasdfouiasdhfoasdf");
	//	System.out.println(this.userService.findUser("admin1").toString()+"----------jfnsdajkfhlasdoikfjasdfiojaspdofiajsd");
		BDDMockito.given(this.userService.findUser("george1")).willReturn(this.george);
		BDDMockito.given(this.userService.findUser("user")).willReturn(this.user);
	}

	@WithMockUser(value = "spring")
        @Test
	void testInitCreationForm() throws Exception {
		mockMvc.perform(get("/users/new")).andExpect(status().isOk()).andExpect(model().attributeExists("user"))
				.andExpect(view().name("users/createOrUpdateUserForm"));
	}

	@WithMockUser(value = "spring")
        @Test
	void testProcessCreationFormSuccess() throws Exception {
		mockMvc.perform(post("/users/new")
				.param("firstName", "Jose")
				.param("lastName", "Hidalgo")
				.with(csrf())
				.param("username", "jose1")
				.param("password", "password123"))
				.andExpect(status().is3xxRedirection())
				.andExpect(view().name("redirect:/users/jose1"));
	}

	@WithMockUser(value = "spring")
    @Test
	void testProcessCreationFormHasErrors() throws Exception {
		mockMvc.perform(post("/users/new")
				.with(csrf())
				.param("firstName", "Jose")
				.param("lastName", "")
				.param("username", "jose1")
				.param("password", "password123"))
				.andExpect(status().isOk())
				.andExpect(model().attributeHasErrors("user"))
				.andExpect(model().attributeHasFieldErrors("user", "lastName"))
				.andExpect(view().name("users/createOrUpdateUserForm"));
				
	}


        @WithMockUser(value = "george1")
	@Test
	void testInitUpdateUserForm() throws Exception {
		mockMvc.perform(get("/users/{username}/edit", "george1")).andExpect(status().isOk())
				.andExpect(model().attribute("user", hasProperty("lastName", is("Franklin"))))
				.andExpect(model().attribute("user", hasProperty("firstName", is("George"))))
				.andExpect(model().attribute("user", hasProperty("username", is("george1"))))
				.andExpect(model().attribute("user", hasProperty("password", is("pass123"))))
				.andExpect(view().name("users/createOrUpdateUserForm"));
	}

        @WithMockUser(value = "user")
	@Test
	void testInitUserWithTiendaFormSuccess() throws Exception {
		mockMvc.perform(get("/users/{username}/edit", "user"))	
				.andExpect(status().isOk())
				.andExpect(model().attribute("user", this.user))
				.andExpect(model().attribute("tiendaId", this.tienda.getId()))
				.andExpect(model().attribute("isNew", false))
				.andExpect(view().name("users/createOrUpdateUserForm"));
	}
        @WithMockUser(value = "george1")
    	@Test
    	void testProcessUpdateUserFormSuccess() throws Exception {
    		mockMvc.perform(post("/users/{username}/edit", "george1")
    							.with(csrf())
    							.param("firstName", "Geo")
    							.param("lastName", "Fran")
    							.param("username", "george1")
    							.param("password", "pass123"))
    				.andExpect(status().is3xxRedirection())
    				.andExpect(view().name("redirect:/users/"+this.george.getUsername()));
    	}

        @WithMockUser(value = "spring")
	@Test
	void testProcessUpdateUserFormHasErrors() throws Exception {
		mockMvc.perform(post("/users/{username}/edit", "george1")
							.with(csrf())
							.param("firstName", "")
							.param("lastName", ""))
				.andExpect(status().isOk())
				.andExpect(model().attributeHasErrors("user"))
				.andExpect(model().attributeHasFieldErrors("user", "firstName"))
				.andExpect(model().attributeHasFieldErrors("user", "lastName"))
				.andExpect(view().name("users/createOrUpdateUserForm"));
	}

        @WithMockUser(value = "spring")
	@Test
	void testShowUser() throws Exception {
		mockMvc.perform(get("/users/{username}", "george1"))
				.andExpect(status().isOk())
				.andExpect(model().attribute("user", hasProperty("firstName", is("George"))))
				.andExpect(model().attribute("user", hasProperty("username", is("george1"))))
				.andExpect(model().attribute("user", hasProperty("password", is("pass123"))))
				.andExpect(view().name("users/userDetails"));
	}

}