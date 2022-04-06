package org.springframework.samples.localizer.service;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.samples.localizer.model.Tienda;
import org.springframework.test.context.transaction.BeforeTransaction;



@SpringBootTest
class TiendaServiceTests {                
    @Autowired
	protected TiendaService tiendaService;
    private static final Logger LOG = Logger.getLogger("org.springframework.samples.localizer.service.TiendaServiceTests");    
    private Tienda tienda = new Tienda();
    private Tienda tienda1= new Tienda();
    private Tienda tienda2= new Tienda();
//
//    @BeforeTransaction
//	void setup() {
//    	
//		this.tienda.setCalle("Sevilla");
//		this.tienda.setCodigoPostal(90);
//		this.tienda.setDescripcion("Amasando pan desde 1990");
//		this.tienda.setId(2);
//		this.tienda.setHorario("8:00-14:00");
//		this.tienda.setImagen(".....");
//		this.tienda.setNombre("Panaderia Paqui");
//	    this.tienda.setProductos(null);
//	    this.tienda.setProvincia("Sevilla");
//	    this.tienda.setTelefono(955444765);      
//	    
//	    this.tiendaService.saveTienda(this.tienda);
//	    
//		this.tienda1.setCalle("Sevilla");
//		this.tienda1.setCodigoPostal(89);
//		this.tienda1.setDescripcion("Todo lo que necesitas");
//		this.tienda1.setId(2);
//		this.tienda1.setHorario("8:00-14:00");
//		this.tienda1.setImagen(".....");
//		this.tienda1.setNombre("Polvillo");
//	    this.tienda1.setProductos(null);
//	    this.tienda1.setProvincia("Sevilla");
//	    this.tienda1.setTelefono(955444765);      
//	          
//	    this.tiendaService.saveTienda(this.tienda1);
//
//		this.tienda2.setCalle("Sevilla");
//		this.tienda2.setCodigoPostal(89);
//		this.tienda2.setDescripcion("Tu fruta desde 1990");
//		this.tienda2.setId(2);
//		this.tienda2.setHorario("8:00-14:00");
//		this.tienda2.setImagen(".....");
//		this.tienda2.setNombre("Fruteria pepi");
//	    this.tienda2.setProductos(null);
//	    this.tienda2.setProvincia("Sevilla");
//	    this.tienda2.setTelefono(955444765);      
//	         
//	    this.tiendaService.saveTienda(this.tienda2);
//	    
//    }
	@Test
	//Encontrar tienda por el id
	void shouldFindTiendaById() {
//		Tienda tienda = new Tienda(); 
//		tienda.setCalle("Sevilla");
//		tienda.setCodigoPostal(41011);
//		tienda.setDescripcion("Amasando pan desde 1990");
//		tienda.setId(2);
//		tienda.setHorario("8:00-14:00");
//		tienda.setImagen(".....");
//		tienda.setNombre("Panaderia Paqui");
//	    tienda.setProductos(null);
//	    tienda.setProvincia("Sevilla");
//	    tienda.setTelefono(955444765);      
	    
//	    this.tiendaService.saveTienda(tienda);
		Tienda t = this.tiendaService.findTiendaById(1);
		assertThat(t.getId()).isEqualTo(1).isNotNull();
		
	}
	@Test //CASO POSITIVO 
	//Encontrar tienda por el cp
	void shouldFindTiendaByCP() {
//		Tienda tienda = new Tienda();                           
//		tienda.setCalle("Sevilla");                        
//		tienda.setCodigoPostal(90);                        
//		tienda.setDescripcion("Amasando pan desde 1990");  
//		tienda.setId(2);                                   
//		tienda.setHorario("8:00-14:00");                   
//		tienda.setImagen(".....");                         
//		tienda.setNombre("Panaderia Paqui");               
//		tienda.setProductos(null);                         
//		tienda.setProvincia("Sevilla");                    
//		tienda.setTelefono(955444765);                     
		                                                        
//		this.tiendaService.saveTienda(tienda);                  
		List<Tienda> t = new ArrayList<>();
		
		t.addAll(this.tiendaService.findByCodigoPostal("41001"));
		
		int count = t.size();
		
		Assertions.assertTrue(count == 1);
	}
	@Test //CASO POSITIVO
	//Encontrar varias tiendas por el cp
	void shouldFindTiendasByCP() {
//		Tienda tienda1 = new Tienda();
//		tienda1.setCalle("Sevilla");
//		tienda1.setCodigoPostal(89);
//		tienda1.setDescripcion("Todo lo que necesitas");
//		tienda1.setId(2);
//		tienda1.setHorario("8:00-14:00");
//		tienda1.setImagen(".....");
//		tienda1.setNombre("Polvillo");
//	    tienda1.setProductos(null);
//	    tienda1.setProvincia("Sevilla");
//	    tienda1.setTelefono(955444765);      
//	          
//	    this.tiendaService.saveTienda(tienda1);
//	    
//	    Tienda tienda2 = new Tienda();
//		tienda2.setCalle("Sevilla");
//		tienda2.setCodigoPostal(89);
//		tienda2.setDescripcion("Tu fruta desde 1990");
//		tienda2.setId(2);
//		tienda2.setHorario("8:00-14:00");
//		tienda2.setImagen(".....");
//		tienda2.setNombre("Fruteria pepi");
//	    tienda2.setProductos(null);
//	    tienda2.setProvincia("Sevilla");
//	    tienda2.setTelefono(955444765);      
//	         
//	    this.tiendaService.saveTienda(tienda2);
		List<Tienda> t = new ArrayList<>();
		
		t.addAll(this.tiendaService.findByCodigoPostal("41009"));
		
		int count = t.size();
		
		Assertions.assertTrue(count == 4);
	}
	@Test //CASO NEGATIVO
	//No encontrar ninguna tienda por el cp
	void shouldNotFindTiendaByCP() {
		
		
		List<Tienda> t = new ArrayList<>();
		
		t.addAll(this.tiendaService.findByCodigoPostal("0"));
		
		int count = t.size();
		
		Assertions.assertTrue(count == 0);
	}
	
	
}
