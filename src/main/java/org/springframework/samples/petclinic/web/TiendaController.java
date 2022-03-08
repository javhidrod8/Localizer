package org.springframework.samples.petclinic.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.model.Tienda;
import org.springframework.samples.petclinic.service.TiendaService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TiendaController {
	
	private final TiendaService tiendaService;
	
	@Autowired
	public TiendaController(TiendaService tiendaService) {
		this.tiendaService = tiendaService;
	}
	
	@ModelAttribute("tienda")
	public Tienda findTienda(@PathVariable("tiendaId") int tiendaId) {
		return this.tiendaService.findTiendaById(tiendaId);
	}
	
	@GetMapping("/tienda/{tiendaId}")
	public ModelAndView showTienda(@PathVariable("tiendaId") int tiendaId) {
		ModelAndView mav = new ModelAndView("tiendas/tiendaDetails");
		mav.addObject(this.tiendaService.findTiendaById(tiendaId));
		return mav;
	}
	
}
