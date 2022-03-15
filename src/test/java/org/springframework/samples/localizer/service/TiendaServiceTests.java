package org.springframework.samples.localizer.service;

import static org.assertj.core.api.Assertions.assertThat;
import java.util.logging.Logger;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.samples.localizer.model.Tienda;



@SpringBootTest
class TiendaServiceTests {                
    @Autowired
	protected TiendaService tiendaService;
    private static final Logger LOG = Logger.getLogger("org.springframework.samples.localizer.service.TiendaServiceTests");    
    
	@Test
	//Encontrar tienda por el id
	void shouldFindTiendaById() {
		
        
		Tienda tienda = new Tienda();
		tienda.setCalle("Sevilla");
		tienda.setCodigoPostal(41011);
		tienda.setDescripcion("Amasando pan desde 1990");
		tienda.setId(2);
		tienda.setHorario("8:00-14:00");
		tienda.setImagen(".....");
		tienda.setNombre("Panaderia Paqui");
	    tienda.setProductos(null);
	    tienda.setProvincia("Sevilla");
	    tienda.setTelefono(955444765);      
	    
	    this.tiendaService.saveTienda(tienda);
		Tienda t = this.tiendaService.findTiendaById(tienda.getId());
		assertThat(t.getId()).isEqualTo(2).isNotNull();
		
	}
	
	
}
