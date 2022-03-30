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
import org.springframework.samples.localizer.model.User;
import org.springframework.samples.localizer.service.AuthoritiesService;
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

	@Autowired
	private MockMvc mockMvc;

	private User george;

	private Optional<User> g;
	
	@BeforeEach
	void setup() {

		this.george = new User();
		this.george.setUsername("george1");
		this.george.setPassword("pass123");
		this.george.setFirstName("George");
		this.george.setLastName("Franklin");
		this.george.setTienda(null);
		
	//	this.userService.saveUser(this.george);
		//this.g = Optional.of(this.george);
		
	//	System.out.println(this.george.toString()+"sdasdasdaspiodjasdfujhasdfguihasdofiuhasdfouiasdhfoasdf");
	//	System.out.println(this.userService.findUser("admin1").toString()+"----------jfnsdajkfhlasdoikfjasdfiojaspdofiajsd");
		BDDMockito.given(this.userService.findUser("george1")).willReturn(this.george);
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
		mockMvc.perform(post("/users/new").param("firstName", "Jose").param("lastName", "Hidalgo")
							.with(csrf())
							.param("username", "jose1")
							.param("password", "password123"))
				.andExpect(status().is3xxRedirection());
	}

	@WithMockUser(value = "spring")
        @Test
	void testProcessCreationFormHasErrors() throws Exception {
		mockMvc.perform(post("/users/new")
							.with(csrf())
							.param("firstName", "Jose")
							.param("lastName", "Hidalgo"))
				.andExpect(status().isOk())
				.andExpect(model().attributeHasErrors("user"))
				.andExpect(model().attributeHasFieldErrors("user", "username"))
				.andExpect(model().attributeHasFieldErrors("user", "password"))
				.andExpect(view().name("users/createOrUpdateUserForm"));
	}

//	@WithMockUser(value = "spring")
//        @Test
//	void testInitFindForm() throws Exception {
//		mockMvc.perform(get("/owners/find")).andExpect(status().isOk()).andExpect(model().attributeExists("owner"))
//				.andExpect(view().name("owners/findOwners"));
//	}
//
//	@WithMockUser(value = "spring")
//        @Test
//	void testProcessFindFormSuccess() throws Exception {
//		given(this.clinicService.findOwnerByLastName("")).willReturn(Lists.newArrayList(george, new Owner()));
//
//		mockMvc.perform(get("/owners")).andExpect(status().isOk()).andExpect(view().name("owners/ownersList"));
//	}

//	@WithMockUser(value = "spring")
//        @Test
//	void testProcessFindFormByLastName() throws Exception {
//		given(this.clinicService.findOwnerByLastName(george.getLastName())).willReturn(Lists.newArrayList(george));
//
//		mockMvc.perform(get("/owners").param("lastName", "Franklin")).andExpect(status().is3xxRedirection())
//				.andExpect(view().name("redirect:/owners/" + TEST_OWNER_ID));
//	}

//        @WithMockUser(value = "spring")
//	@Test
//	void testProcessFindFormNoOwnersFound() throws Exception {
//		mockMvc.perform(get("/owners").param("lastName", "Unknown Surname")).andExpect(status().isOk())
//				.andExpect(model().attributeHasFieldErrors("owner", "lastName"))
//				.andExpect(model().attributeHasFieldErrorCode("owner", "lastName", "notFound"))
//				.andExpect(view().name("owners/findOwners"));
//	}

        @WithMockUser(value = "spring")
	@Test
	void testInitUpdateUserForm() throws Exception {
		mockMvc.perform(get("/users/{username}/edit", "george1")).andExpect(status().isOk())
//				.andExpect(model().attributeExists("optional"))
//				.andExpect(model().attribute("user", this.g.get()))
				.andExpect(model().attribute("user", hasProperty("lastName", is("Franklin"))))
				.andExpect(model().attribute("user", hasProperty("firstName", is("George"))))
				.andExpect(model().attribute("user", hasProperty("username", is("george1"))))
				.andExpect(model().attribute("user", hasProperty("password", is("pass123"))))
				.andExpect(view().name("users/createOrUpdateUserForm"));
	}

        @WithMockUser(value = "spring")
	@Test
	void testProcessUpdateUserFormSuccess() throws Exception {
		mockMvc.perform(post("/users/{username}/edit", "george1")
							.with(csrf())
							.param("firstName", "Geo")
							.param("lastName", "Frank")
							.param("username", "george1")
							.param("password", "pass123"))
				.andExpect(status().is3xxRedirection())
				.andExpect(view().name("redirect:/users/{username}"));
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
		mockMvc.perform(get("/users/{username}", "george1")).andExpect(status().isOk())
//		.andExpect(model().attributeExists("optional"))
//		.andExpect(model().attribute("user", this.g.get()))
				.andExpect(model().attribute("user", hasProperty("firstName", is("George"))))
				.andExpect(model().attribute("user", hasProperty("username", is("george1"))))
				.andExpect(model().attribute("user", hasProperty("password", is("pass123"))))
				.andExpect(view().name("users/userDetails"));
	}

}