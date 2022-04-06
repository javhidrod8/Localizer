package org.springframework.samples.localizer.web;

import static org.hamcrest.Matchers.hasProperty;
import static org.hamcrest.Matchers.is;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import java.util.Collection;
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
import org.springframework.samples.localizer.model.Estado;
import org.springframework.samples.localizer.model.Preferencias;
import org.springframework.samples.localizer.model.Producto;
import org.springframework.samples.localizer.model.Tienda;
import org.springframework.samples.localizer.model.User;
import org.springframework.samples.localizer.repository.TiendaRepository;
import org.springframework.samples.localizer.service.TiendaService;
import org.springframework.samples.localizer.service.UserService;
import org.springframework.security.config.annotation.web.WebSecurityConfigurer;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;

@WebMvcTest(controllers=TiendaController.class,
excludeFilters = @ComponentScan.Filter(type = FilterType.ASSIGNABLE_TYPE, classes = WebSecurityConfigurer.class),
excludeAutoConfiguration= SecurityConfiguration.class)
public class TiendaControllerTests {

	private static final int TEST_TIENDA_ID = 1;
	private static final int TEST_TIENDA_ID1 = 2;

	
    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private TiendaRepository tiendaRepository;
    
    @MockBean
    private TiendaService tiendaService;
    
    @MockBean
    private UserService userService;
    
    
    private Tienda tienda;
    private Tienda tienda1;
    private User user;
    private User user1;
    private User user2;
    private Producto producto;
    private Collection<Tienda> tiendas;
    private Collection<Producto> productos;
 

    @BeforeEach
    void setup() {
    	
    	this.user = new User();
        this.user.setUsername("localizer1");
        this.user.setPassword("supersecretpass");
        Authorities au = new Authorities();
        Set<Authorities> col = new HashSet<>();
        col.add(au);
        au.setAuthority("vendedor");
        au.setUser(user);
        user.setAuthorities(col);
        user.setEnabled(true);
        

    	this.user1 = new User();
        this.user1.setUsername("localizer");
        this.user1.setPassword("supersecretpass");
        Authorities au1 = new Authorities();
        Set<Authorities> col1 = new HashSet<>();
        col1.add(au1);
        au1.setAuthority("vendedor");
        au1.setUser(user);
        this.user1.setAuthorities(col1);
        this.user1.setEnabled(true);
        

    	this.user2 = new User();
        this.user2.setUsername("admin");
        this.user2.setPassword("supersecretpass");
        Authorities au2 = new Authorities();
        Set<Authorities> col2 = new HashSet<>();
        col2.add(au2);
        au2.setAuthority("admin");
        au2.setUser(user);
        this.user2.setAuthorities(col2);
        this.user2.setEnabled(true);
    
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
	    
	    this.tiendas= new HashSet<Tienda>();
	    this.tiendas.add(this.tienda);
	    this.user.setTienda(this.tienda);
	    this.tienda1 = new Tienda();
	    
        tienda1.setId(TEST_TIENDA_ID1);
        tienda1.setCalle("Sevilla");
		tienda1.setCodigoPostal("41021");
		tienda1.setDescripcion("Amasando pan desde 1990");
		tienda1.setHorario("8:00-14:00");
		tienda1.setImagen(".....");
		tienda1.setNombre("Panaderia Paqui");
	    tienda1.setProductos(null);
	    tienda1.setProvincia("Sevilla");
	    tienda1.setTelefono("955444765"); 
	    
	    this.tiendas= new HashSet<Tienda>();
	    this.tiendas.add(this.tienda);
	    this.tiendas.add(this.tienda1);
	    
	    this.producto= new Producto();
	    this.producto.setNombre("Tomate frito");
		this.producto.setMarca("Orlando");
		this.producto.setPrecio(2.00);
		this.producto.setMarca("Orlando");
		this.producto.setDescripcion("Tomate frito para cocinar");
		this.producto.setEstado(Estado.PENDIENTE);
		this.producto.setPromocionado(false);
		this.producto.setImagen("....");
		this.producto.setMotivo("");
		this.producto.setIntolerancia(new HashSet<>());
		this.producto.setPreferencia(Preferencias.TODO);
		this.producto.setTienda(this.tienda); 
	    
	    this.productos = new HashSet<Producto>();
	    this.productos.add(this.producto);
	    
	    BDDMockito.given(this.tiendaService.findProductos(TEST_TIENDA_ID))
        .willReturn(this.productos);
	    
	    BDDMockito.given(this.userService.findUser("localizer1"))
        .willReturn(this.user);
	    BDDMockito.given(this.userService.findUser("localizer"))
        .willReturn(this.user1);
	    BDDMockito.given(this.userService.findUser("admin"))
        .willReturn(this.user2);
	    BDDMockito.given(this.tiendaService.findByCodigoPostal("41011"))
        .willReturn(this.tiendas);
	    
        BDDMockito.given(this.tiendaService.findTiendaById(TEST_TIENDA_ID))
        .willReturn(this.tienda);

        BDDMockito.given(this.tiendaService.findTiendaById(TEST_TIENDA_ID1))
        .willReturn(this.tienda1);
        
        BDDMockito.given(this.tiendaService.findAll())
        .willReturn(this.tiendas);
        
    }
    @WithMockUser(value="localizer1")
    @Test
    void testShowTiendas() throws Exception {
        mockMvc.perform(get("/tiendas"))
        .andExpect(status().isOk())
        .andExpect(model().attribute("tiendas",this.tiendas));
    }
    
    @WithMockUser(value="localizer1", authorities = "vendedor")
    @Test
    void testproductList() throws Exception {
        mockMvc.perform(get("/tienda/{tiendaId}",TEST_TIENDA_ID ))
        .andExpect(status().isOk())
        .andExpect(model().attribute("tienda",this.tienda))
        .andExpect(model().attribute("tienda",hasProperty("calle", is("Sevilla"))))
        .andExpect(model().attribute("tienda",hasProperty("codigoPostal",is("41011"))))
        .andExpect(model().attribute("tienda", hasProperty("descripcion",is("Amasando pan desde 1990"))))
        .andExpect(model().attribute("tienda", hasProperty("horario",is("8:00-14:00"))))
        .andExpect(view().name("tiendas/tiendaDetails"));
    }
     
    @WithMockUser(value="localizer1", authorities = "vendedor")
    @Test
    void testTiendasByCP() throws Exception {
        mockMvc.perform(get("/tiendas/search/{codigoPostal}","41011")).andExpect(status().isOk())
        .andExpect(model().attribute("tiendas",this.tiendas));
    }
    @WithMockUser(value="localizer1", authorities = "vendedor")
    @Test
    void testMiTienda() throws Exception {
        mockMvc.perform(get("/tiendas/miTienda")).andExpect(status().isOk())
        .andExpect(model().attribute("tienda",this.tienda))
        .andExpect(model().attribute("productos",this.productos))
        .andExpect(model().attribute("miTienda",true));
    }
    @WithMockUser(value="localizer", authorities = "vendedor")
    @Test
    void testMiTiendaWithoutTienda() throws Exception {
        mockMvc.perform(get("/tiendas/miTienda")).andExpect(status().is3xxRedirection())
        .andExpect(view().name("redirect:/checkout"));
    }
    
    @WithMockUser(value="admin", authorities = "admin")
    @Test
    void testMiTiendaAdmin() throws Exception {
        mockMvc.perform(get("/tiendas/miTienda"))
        .andExpect(status().is3xxRedirection())
        .andExpect(view().name("redirect:/tiendas/new"));
    }
    @WithMockUser(value="localizer1")
    @Test
    void testMiTiendaCliente() throws Exception {
        mockMvc.perform(get("/tiendas/miTienda")).andExpect(status().isOk())
        .andExpect(view().name("errores/errorAuth"));
    }
    @WithMockUser(value="localizer1",authorities = "vendedor")
    @Test
    void testDeleteMiTienda() throws Exception {
        mockMvc.perform(get("/tienda/{tiendaId}/delete", TEST_TIENDA_ID))
        .andExpect(status().is3xxRedirection())
        .andExpect(view().name("redirect:/"));
    }
    @WithMockUser(value = "localizer1")
    @Test
    void testDeleteError() throws Exception {
        mockMvc.perform(get("/tienda/{tiendaId}/delete", TEST_TIENDA_ID))
        .andExpect(status().isOk())
        .andExpect(view().name("errores/errorAuth"));
    }
    @WithMockUser(value = "localizer1")
    @Test
    void testNotInitCreationTiendaForm() throws Exception {
        mockMvc.perform(get("/tiendas/new"))
        .andExpect(status().isOk())
        .andExpect(view().name("errores/errorAuth"));
    }
    @WithMockUser(value = "localizer", authorities = "vendedor")
    @Test
    void testInitCreationTiendaForm() throws Exception {
        mockMvc.perform(get("/tiendas/new"))
        .andExpect(status().isOk())
        .andExpect(model().attribute("isNew",true))
        .andExpect(view().name("tiendas/createOrUpdateTiendaForm"));
    }
    @WithMockUser(value = "localizer1", authorities = "vendedor")
    @Test
    void testInitUpdateTiendaForm() throws Exception {
        mockMvc.perform(get("/tienda/{tiendaId}/edit",TEST_TIENDA_ID))
        .andExpect(status().isOk())
        .andExpect(model().attribute("tienda",this.tienda))
        .andExpect(view().name("tiendas/createOrUpdateTiendaForm"));
    }
    @WithMockUser(value = "localizer1")
    @Test
    void testNotInitUpdateTiendaForm() throws Exception {
        mockMvc.perform(get("/tienda/{tiendaId}/edit",TEST_TIENDA_ID))
        .andExpect(status().isOk())
        .andExpect(view().name("errores/errorAuth"));
    }
    
}
