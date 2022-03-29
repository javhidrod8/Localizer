package org.springframework.samples.localizer.web;

import java.util.Collection;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.localizer.model.Intolerancias;
import org.springframework.samples.localizer.model.Preferencias;
import org.springframework.samples.localizer.model.Producto;
import org.springframework.samples.localizer.model.Tienda;
import org.springframework.samples.localizer.model.User;
import org.springframework.samples.localizer.service.TiendaService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
public class TiendaController {
	private static final String VIEWS_TIENDA_CREATE_OR_UPDATE_FORM = "tiendas/createOrUpdateTiendaForm";
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

	
//	@GetMapping("/tienda/{tiendaId}")
//	public ModelAndView showTienda(@PathVariable("tiendaId") int tiendaId) {
//		ModelAndView mav = new ModelAndView("tiendas/tiendaDetails");
//		mav.addObject(this.tiendaService.findTiendaById(tiendaId));
//		return mav;
//	}
	
	@GetMapping(value = "/tienda/{tiendaId}")
	public String productList(ModelMap modelMap) {
		String vista = "tiendas/tiendaDetails";
		Iterable<Producto> productos = this.tiendaService.findProductos();
		Set<Intolerancias> intolerancias = new HashSet<Intolerancias>();
		Set<Preferencias> preferencias = new HashSet<Preferencias>();
		for (Producto p:productos) {
			intolerancias.addAll(p.getIntolerancia());
			preferencias.add(p.getPreferencia());
		}
			modelMap.addAttribute("productos", productos);
			modelMap.addAttribute("intolerancias", intolerancias);
			modelMap.addAttribute("preferencias", preferencias);
			return vista;
	}
		
	@GetMapping("/tiendas/new")
	public String initCreationTiendaForm(Map<String, Object> model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User currentUser = (User) authentication.getPrincipal();
		Tienda tienda = new Tienda();
		tienda.setUser(currentUser);
		model.put("tienda", tienda);
		Boolean isNew = true;
		model.put("isNew", isNew);
		
		return VIEWS_TIENDA_CREATE_OR_UPDATE_FORM;
	}
	
	@PostMapping("/tiendas/new")
	public String processCreationTiendaForm(@Valid Tienda tienda, BindingResult result, Map<String, Object> model) {
		if(result.hasErrors()) {
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			User currentUser = (User) authentication.getPrincipal();
			Boolean isNew = true;
			tienda.setUser(currentUser);
			model.put("isNew", isNew);
			model.put("tienda", tienda);
			return VIEWS_TIENDA_CREATE_OR_UPDATE_FORM;
		}
		else {
			this.tiendaService.saveTienda(tienda);
			return "redirect:/tienda/" + tienda.getId();
		}
	}
  
  @GetMapping(value = "/tienda/{tiendaId}/edit")
	public String initUpdateTiendaForm(@PathVariable("tiendaId") int tiendaId, Model model) {
		Tienda tienda = this.tiendaService.findTiendaById(tiendaId);
		Boolean isNew=false;
		model.addAttribute(isNew);
		model.addAttribute(tienda);
		return VIEWS_TIENDA_CREATE_OR_UPDATE_FORM;
	}
	
	@PostMapping(value = "/tienda/{tiendaId}/edit")
	public String processUpdateTiendaForm(@Valid Tienda tienda, BindingResult result,
			@PathVariable("tiendaId") int tiendaId,Model model) {
		if (result.hasErrors()) {
			Boolean isNew=false;
			model.addAttribute(isNew);
			return VIEWS_TIENDA_CREATE_OR_UPDATE_FORM;
		}
		else {
			tienda.setId(tiendaId);
			this.tiendaService.saveTienda(tienda);
			return "redirect:/tienda/{tiendaId}";					
		}
	}
	
	@GetMapping(value = "/tienda/{tiendaId}/delete")
    public String deleteTienda(@PathVariable("tiendaId") int tiendaId, ModelMap model) {
		Tienda tienda = this.tiendaService.findTiendaById(tiendaId);
		this.tiendaService.deleteTienda(tienda);
        return "redirect:/";
     
    }
	
}