package org.springframework.samples.localizer.web;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.HashSet;
import java.util.Set;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.BDDMockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.FilterType;
import org.springframework.samples.localizer.configuration.SecurityConfiguration;
import org.springframework.samples.localizer.model.Authorities;
import org.springframework.samples.localizer.model.Tienda;
import org.springframework.samples.localizer.model.User;
import org.springframework.samples.localizer.repository.TiendaRepository;
import org.springframework.samples.localizer.service.TiendaService;
import org.springframework.security.config.annotation.web.WebSecurityConfigurer;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;


@WebMvcTest(value = TiendaController.class,
excludeFilters = @ComponentScan.Filter(type = FilterType.ASSIGNABLE_TYPE,
    classes = WebSecurityConfigurer.class), excludeAutoConfiguration = SecurityConfiguration.class)

public class TiendaControllerTests {

	private static final int TEST_TIENDA_ID = 2;
	
	@Autowired
    private TiendaController tiendaController;
	
    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private TiendaRepository tiendaRepository;
    
    @MockBean
    private TiendaService tiendaService;
    
    private Tienda tienda;
    private User user;
 

    @BeforeEach
    void setup() {
    	
    	this.user = new User();
        user.setUsername("localizer1");
        user.setPassword("supersecretpass");
        Authorities au = new Authorities();
        Set<Authorities> col = new HashSet<>();
        col.add(au);
        au.setAuthority("user");
        au.setUser(user);
        user.setAuthorities(col);
        user.setEnabled(true);
    
    
    	this.tienda = new Tienda();
        tienda.setId(TEST_TIENDA_ID);
        tienda.setCalle("Sevilla");
		tienda.setCodigoPostal("41011");
		tienda.setDescripcion("Amasando pan desde 1990");
		tienda.setHorario("8:00-14:00");
		tienda.setImagen(".....");
		tienda.setNombre("Panaderia Paqui");
	    tienda.setProductos(null);
	    tienda.setProvincia("Sevilla");
	    tienda.setTelefono("955444765");  

        BDDMockito.given(this.tiendaService.findTiendaById(TEST_TIENDA_ID))
        .willReturn(this.tienda);

        /*given(this.tiendaRepository.findAll(any(Pageable.class))).willReturn(new PageImpl<Tienda>(Lists.newArrayList(tienda)));

        given(this.tiendaRepository.findById(TEST_Tienda_ID)).willReturn(tienda);
        Visit visit = new Visit();
        visit.setDate(LocalDate.now());
        tienda.getPet("Max").getVisits().add(visit);
*/
    }
    
    @WithMockUser(value="localizer1")
    @Test
    void testShowTienda() throws Exception {
        mockMvc.perform(get("/tienda/{tiendaId}",TEST_TIENDA_ID ))
        .andExpect(status().isOk())
        .andExpect(model().attribute("tienda",this.tienda));
//        .andExpect(model().attribute("calle","Sevilla"));
//        .andExpect(model().attribute("codigoPostal", 41011))
//        .andExpect(model().attribute("descripcion", "Amasando pan desde 1990"))
//        .andExpect(model().attribute("horario", "8:00-14:00"))
//        .andExpect(model().attribute("imagen", "....."))
//        .andExpect(model().attribute("nombre", "Panaderia Paqui"))
//        .andExpect(model().attribute("provincia", "Sevilla"))
//        .andExpect(model().attribute("telefono", 955444765));
                //.andExpect(view().name("tiendas/tiendaDetails"));
    }
    
    @WithMockUser(value="localizer1")
    @Test
    void testShowFinderByCPTienda() throws Exception {
        mockMvc.perform(get("/tiendas/search/{codigoPostal}","41011")).andExpect(status().isOk()); //TODO: Arreglar cuando se arregle el controlador
        //.andExpect(model().attribute("tienda",new Tienda()));
    }
//    @WithMockUser(value="localizer1")
//    @Test
//    void testListFinderByCPTienda() throws Exception {
//        mockMvc.perform(get("/tiendas/find")).andExpect(status().is5xxServerError()); //TODO: hacer cuando se pueda hacer la búsqueda 
//        //.andExpect(model().attribute("tienda",new Tienda()));
//    }
}
