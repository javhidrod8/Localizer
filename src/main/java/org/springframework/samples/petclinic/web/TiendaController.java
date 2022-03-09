package org.springframework.samples.petclinic.web;

import java.util.Collection;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.model.Owner;
import org.springframework.samples.petclinic.model.Tienda;
import org.springframework.samples.petclinic.service.TiendaService;
import org.springframework.stereotype.Controller;
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
	
	@ModelAttribute("tienda")
	public Tienda findTienda(@PathVariable("tiendaId") int tiendaId) {
		return this.tiendaService.findTiendaById(tiendaId);
	}
	
	@GetMapping(value = "/tiendas/find")
	public String initFindByCPForm(Map<String, Object> model) {
		model.put("tienda", new Tienda());
		return "tiendas/findTiendaByCP";
	}

	@GetMapping(value = "/tiendas")
	public String processFindByCPForm(Tienda tienda, BindingResult result, Map<String, Object> model) {

		// allow parameterless GET request for /tiendas to return all records
		if (tienda.getCodigo_postal() == null) {
			tienda.setCodigo_postal(0); // empty string signifies broadest possible search
		}

		// find elements by codigo postal
		Collection<Tienda> results = this.tiendaService.findByCodigoPostal(tienda.getCodigo_postal());
		if (results.isEmpty()) {
			// no elements found
			result.rejectValue("codigo_postal", "notFound", "not found");
			return "tienda/findTiendaByCP";
		}
		else if (results.size() == 1) {
			// 1 element found
			tienda = results.iterator().next();
			return "redirect:/tiendas/" + tienda.getId();
		}
		else {
			// multiple elements found
			model.put("selections", results);
			return "tiendas/tiendasList";
		}
	}

	
	@GetMapping("/tienda/{tiendaId}")
	public ModelAndView showTienda(@PathVariable("tiendaId") int tiendaId) {
		ModelAndView mav = new ModelAndView("tiendas/tiendaDetails");
		mav.addObject(this.tiendaService.findTiendaById(tiendaId));
		return mav;
	}
	
}
