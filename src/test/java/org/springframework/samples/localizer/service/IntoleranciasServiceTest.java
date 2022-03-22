package org.springframework.samples.localizer.service;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.Collection;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.samples.localizer.model.Intolerancias;

@SpringBootTest
public class IntoleranciasServiceTest {
	
	@Autowired
	protected IntoleranciasService intoleranciasService;
	
	@Test
	public void findAllIntolerancias() {
		Collection<Intolerancias> intolerancias = this.intoleranciasService.findAllIntolerancias();
    	assertThat(intolerancias.size()).isEqualTo(16);
    	System.out.println("Id=4 debe de ser SACAROSA= " + intoleranciasService.findIntoleranciasById(4));
	}
	
	

}
