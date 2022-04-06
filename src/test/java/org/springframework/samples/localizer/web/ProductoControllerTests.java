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
import org.springframework.samples.localizer.model.Intolerancias;
import org.springframework.samples.localizer.model.Preferencias;
import org.springframework.samples.localizer.model.Producto;
import org.springframework.samples.localizer.model.Tienda;
import org.springframework.samples.localizer.model.User;
import org.springframework.samples.localizer.repository.TiendaRepository;
import org.springframework.samples.localizer.service.IntoleranciasService;
import org.springframework.samples.localizer.service.ProductoService;
import org.springframework.samples.localizer.service.TiendaService;
import org.springframework.samples.localizer.service.UserService;
import org.springframework.security.config.annotation.web.WebSecurityConfigurer;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;

@WebMvcTest(controllers=ProductoController.class,
excludeFilters = @ComponentScan.Filter(type = FilterType.ASSIGNABLE_TYPE, classes = WebSecurityConfigurer.class),
excludeAutoConfiguration= SecurityConfiguration.class)
public class ProductoControllerTests {

	private static final int TEST_ID = 1;
	private static final int TEST_ID1 = 2;

	
    @Autowired
    private MockMvc mockMvc;

    
    
    @MockBean
    private TiendaService tiendaService;
    
    @MockBean
    private UserService userService;
    
    @MockBean
    private ProductoService productoService;
    
    @MockBean
    private IntoleranciasService intoleranciasService;
    
    private Tienda tienda;
    private Tienda tienda1;
    private User user;
    private User user1;
    private User user2;
    private Producto producto;
    private Collection<Intolerancias> intolerancias;
    private Collection<Preferencias> preferencias;
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
        tienda.setId(TEST_ID);
        tienda.setCalle("Sevilla");
		tienda.setCodigoPostal("41011");
		tienda.setDescripcion("Amasando pan desde 1990");
		tienda.setHorario("8:00-14:00");
		tienda.setImagen(".....");
		tienda.setNombre("Panaderia Paqui");
	    tienda.setProductos(null);
	    tienda.setProvincia("Sevilla");
	    tienda.setTelefono("955444765");
	    
	    this.tienda1 = new Tienda();
        tienda1.setId(TEST_ID1);
        tienda1.setCalle("Sevilla");
		tienda1.setCodigoPostal("41011");
		tienda1.setDescripcion("Amasando pan desde 1990");
		tienda1.setHorario("8:00-14:00");
		tienda1.setImagen(".....");
		tienda1.setNombre("Panaderia Paqui");
	    tienda1.setProductos(null);
	    tienda1.setProvincia("Sevilla");
	    tienda1.setTelefono("955444765"); 
	    
	   
	    this.user.setTienda(this.tienda);
	    this.user1.setTienda(this.tienda1);
	    this.tienda1 = new Tienda();
	    
	    this.producto= new Producto();
	    this.producto.setId(TEST_ID);
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
	    
	    BDDMockito.given(this.productoService.findProductoById(TEST_ID))
        .willReturn(this.producto);
	   
	    BDDMockito.given(this.productoService.findAllPreferencias())
        .willReturn(this.preferencias);
	    
	    BDDMockito.given(this.intoleranciasService.findAllIntolerancias())
        .willReturn(this.intolerancias);
	    BDDMockito.given(this.productoService.findByNombre("Tomate"))
        .willReturn(this.productos);
	    BDDMockito.given(this.productoService.findAllProductos())
        .willReturn(this.productos);
	    BDDMockito.given(this.productoService.findProductoByEstado(Estado.PENDIENTE))
        .willReturn(this.productos);
	    
	    BDDMockito.given(this.userService.findUser("localizer1"))
        .willReturn(this.user);
	    
	    BDDMockito.given(this.userService.findUser("localizer"))
        .willReturn(this.user1);
	    
	    BDDMockito.given(this.userService.findUser("admin"))
        .willReturn(this.user2);
	    
	    
        BDDMockito.given(this.tiendaService.findTiendaById(TEST_ID))
        .willReturn(this.tienda);

        
        
        
        
    }
    @WithMockUser(value="localizer1")
    @Test
    void testShowProducto() throws Exception {
        mockMvc.perform(get("/producto/{productoId}",TEST_ID))
        .andExpect(status().isOk())
        .andExpect(model().attribute("intolerancias",this.intolerancias))
        .andExpect(model().attribute("preferencias",this.preferencias))
        .andExpect(model().attribute("producto",this.producto))
        .andExpect(model().attribute("miTienda",false))
        .andExpect(view().name("productos/productoDetails"));
    }
    @WithMockUser(value="admin", authorities = "admin")
    @Test
    void testShowProductoAdmin() throws Exception {
        mockMvc.perform(get("/producto/{productoId}",TEST_ID))
        .andExpect(status().isOk())
        .andExpect(model().attribute("intolerancias",this.intolerancias))
        .andExpect(model().attribute("preferencias",this.preferencias))
        .andExpect(model().attribute("producto",this.producto))
        .andExpect(model().attribute("miTienda",true))
        .andExpect(view().name("productos/productoDetails"));
    }
    @WithMockUser(value="localizer1", authorities = "vendedor")
    @Test
    void testShowMiProducto() throws Exception {
        mockMvc.perform(get("/producto/{productoId}",TEST_ID))
        .andExpect(status().isOk())
        .andExpect(model().attribute("intolerancias",this.intolerancias))
        .andExpect(model().attribute("preferencias",this.preferencias))
        .andExpect(model().attribute("producto",this.producto))
        //.andExpect(model().attribute("miTienda",true))
        .andExpect(view().name("productos/productoDetails"));
    }
    
    @WithMockUser(value="localizer1")
    @Test
    void testProductListSearchEmpty() throws Exception {
        mockMvc.perform(get("/productos/search"))
        .andExpect(status().isOk())
        .andExpect(model().attribute("intolerancias",this.intolerancias))
        .andExpect(model().attribute("preferencias",this.preferencias))
        .andExpect(model().attribute("productos",this.productos))
        .andExpect(view().name("productos/productosList"));
    }
    
    @WithMockUser(value="localizer1")
    @Test
    void testProductListByName() throws Exception {
        mockMvc.perform(get("/productos/search/{name}", "Tomate"))
        .andExpect(status().isOk())
        .andExpect(model().attribute("intolerancias",this.intolerancias))
        .andExpect(model().attribute("preferencias",this.preferencias))
        .andExpect(model().attribute("productos",this.productos))
        .andExpect(view().name("productos/productosList"));
    }
    @WithMockUser(value="localizer1")
    @Test
    void testProductList() throws Exception {
        mockMvc.perform(get("/productos"))
        .andExpect(status().isOk())
        .andExpect(model().attribute("intolerancias",this.intolerancias))
        .andExpect(model().attribute("preferencias",this.preferencias))
        .andExpect(model().attribute("productos",this.productos))
        .andExpect(view().name("productos/productosList"));
    }
    @WithMockUser(value="localizer1", authorities = "nutricionista")
    @Test
    void testProductListNutricionista() throws Exception {
        mockMvc.perform(get("/productos/verificar"))
        .andExpect(status().isOk())
        .andExpect(model().attribute("productos",this.productos))
        .andExpect(view().name("productos/productosVerificar"));
    }
    @WithMockUser(value="localizer1")
    @Test
    void testNotProductListNutricionista() throws Exception {
        mockMvc.perform(get("/productos/verificar"))
        .andExpect(status().isOk())
        .andExpect(view().name("errores/errorAuth"));
    }
    @WithMockUser(value="localizer1", authorities = "vendedor")
    @Test
    void testInitCreationProductoForm() throws Exception {
        mockMvc.perform(get("/tienda/{tiendaId}/productos/new", TEST_ID))
        .andExpect(status().isOk())
        .andExpect(model().attribute("productos",this.productos))
        .andExpect(model().attribute("tiendaId",TEST_ID))
        .andExpect(model().attribute("isNew",true))
        .andExpect(view().name("productos/createOrUpdateProductoForm"));
    }
    @WithMockUser(value="localizer1", authorities = "cliente")
    @Test
    void testNotInitCreationProductoForm() throws Exception {
        mockMvc.perform(get("/tienda/{tiendaId}/productos/new", TEST_ID))
        .andExpect(status().isOk())
        .andExpect(model().attribute("productos",this.productos))
        .andExpect(view().name("errores/errorAuth"));
    }
    @WithMockUser(value="localizer1", authorities = "cliente")
    @Test
    void testNotInitUpdateProductoForm() throws Exception {
        mockMvc.perform(get("/tienda/{tiendaId}/producto/{productoId}/edit", TEST_ID,TEST_ID))
        .andExpect(status().isOk())
        .andExpect(model().attribute("productos",this.productos))
        .andExpect(view().name("errores/errorAuth"));
    }
    @WithMockUser(value="localizer1", authorities = "vendedor")
    @Test
    void testInitUpdateProductoForm() throws Exception {
        mockMvc.perform(get("/tienda/{tiendaId}/producto/{productoId}/edit", TEST_ID,TEST_ID))
        .andExpect(status().isOk())
        .andExpect(model().attribute("productos",this.productos))
        .andExpect(model().attribute("producto",this.producto))
        .andExpect(model().attribute("tiendaId",TEST_ID))
        .andExpect(model().attribute("isNew",false))
        .andExpect(view().name("productos/createOrUpdateProductoForm"));
    }
    @WithMockUser(value="localizer1",authorities = "vendedor")
    @Test
    void testDeleteMiProducto() throws Exception {
        mockMvc.perform(get("/tienda/{tiendaId}/producto/{productoId}/delete", TEST_ID,TEST_ID))
        .andExpect(status().is3xxRedirection())
        .andExpect(view().name("redirect:/tienda/"+this.tienda.getId()));
    }
    @WithMockUser(value="localizer",authorities = "vendedor")
    @Test
    void testNotDeleteNotMiProducto() throws Exception {
        mockMvc.perform(get("/tienda/{tiendaId}/producto/{productoId}/delete", TEST_ID,TEST_ID))
        .andExpect(status().isOk())
        .andExpect(view().name("errores/errorAuth"));
    }
}
