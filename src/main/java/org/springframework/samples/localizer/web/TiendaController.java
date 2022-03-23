package org.springframework.samples.localizer.web;

import java.util.Collection;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.samples.localizer.model.Tienda;
import org.springframework.samples.localizer.service.TiendaService;
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
	
	@GetMapping(value = "/tienda/find")
	public String initFindByCPForm(Map<String, Object> model) {
		model.put("tienda", new Tienda());
		return "tiendas/findTiendaByCP";
	}

	@GetMapping(value = "/tiendas")
	public String processFindByCPForm(Tienda tienda, BindingResult result, Map<String, Object> model) {

		// allow parameterless GET request for /tiendas to return all records
		if (tienda.getCodigoPostal() == null) {
			tienda.setCodigoPostal(0); // empty string signifies broadest possible search
		}

		// find elements by codigo postal
		Collection<Tienda> results = this.tiendaService.findByCodigoPostal(tienda.getCodigoPostal());
		if (results.isEmpty()) {
			// no elements found
			result.rejectValue("codigoPostal", "notFound", "not found");
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

	
	@GetMapping("/tiendas/{tiendaId}")
	public ModelAndView showTienda(@PathVariable("tiendaId") int tiendaId) {
		ModelAndView mav = new ModelAndView("tiendas/tiendaDetails");
		mav.addObject(this.tiendaService.findTiendaById(tiendaId));
		return mav;
	}
	
}
