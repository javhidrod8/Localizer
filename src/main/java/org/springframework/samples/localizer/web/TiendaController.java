package org.springframework.samples.localizer.web;

import java.util.Collection;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.localizer.model.Intolerancias;
import org.springframework.samples.localizer.model.Preferencias;
import org.springframework.samples.localizer.model.Producto;
import org.springframework.samples.localizer.model.Tienda;
import org.springframework.samples.localizer.service.TiendaService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
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
	
	@GetMapping("/tiendas")
	public String showTiendas(ModelMap modelMap) {
		String vista = "tiendas/tiendasList";
		Iterable<Tienda> tiendas = this.tiendaService.findAll();
		modelMap.addAttribute("tiendas", tiendas);
		return vista;
	}
	
	@GetMapping("/tienda/{tiendaId}")
	public ModelAndView showTienda(@PathVariable("tiendaId") int tiendaId) {
		ModelAndView mav = new ModelAndView("tiendas/tiendaDetails");
		mav.addObject(this.tiendaService.findTiendaById(tiendaId));
		return mav;
	}
	
	@GetMapping(value = "/tiendas/{codigoPostal}")
	public String productListByName(@PathVariable("codigoPostal") Integer codigoPostal, ModelMap modelMap) {
		String vista = "tiendas/tiendasList";
		Iterable<Tienda> tiendas = this.tiendaService.findByCodigoPostal(codigoPostal);
		modelMap.addAttribute("tiendas", tiendas);
		return vista;
	}
	
	
}
