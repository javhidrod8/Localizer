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
import org.springframework.security.core.GrantedAuthority;
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
	private static final String VIEWS_ERROR_AUTH = "productos/createOrUpdateProductoForm";
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
		Collection<? extends GrantedAuthority> currentPrincipalName = authentication.getAuthorities();
		String auth = currentPrincipalName.iterator().next().toString().trim();
		model.put("auth", auth);
		if (auth.equals("vendedor") || auth.equals("admin")) {
			Tienda tienda = new Tienda();
			model.put("tienda", tienda);
			Boolean isNew = true;
			model.put("isNew", isNew);
			return VIEWS_TIENDA_CREATE_OR_UPDATE_FORM;
		}else {
			return VIEWS_ERROR_AUTH;
		}
		
	}
	

	@GetMapping(value = "/tiendas/{codigoPostal}")
	public String productListByName(@PathVariable("codigoPostal") Integer codigoPostal, ModelMap modelMap) {
		String vista = "tiendas/tiendasList";
		Iterable<Tienda> tiendas = this.tiendaService.findByCodigoPostal(codigoPostal);
		modelMap.addAttribute("tiendas", tiendas);
		return vista;
	}
	

	@PostMapping("/tiendas/new")
	public String processCreationTiendaForm(@Valid Tienda tienda, BindingResult result, Map<String, Object> model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User currentUser = (User) authentication.getPrincipal();
		if(result.hasErrors()) {
			Boolean isNew = true;
			tienda.setUser(currentUser);
			model.put("isNew", isNew);
			model.put("tienda", tienda);
			return VIEWS_TIENDA_CREATE_OR_UPDATE_FORM;
		}
		else {
			tienda.setUser(currentUser);
			this.tiendaService.saveTienda(tienda);
			return "redirect:/tienda/" + tienda.getId();
		}
	}
  
  @GetMapping(value = "/tienda/{tiendaId}/edit")
	public String initUpdateTiendaForm(@PathVariable("tiendaId") int tiendaId, Map<String, Object> model) {
	  Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Collection<? extends GrantedAuthority> currentPrincipalName = authentication.getAuthorities();
		String auth = currentPrincipalName.iterator().next().toString().trim();
		model.put("auth", auth);
		if (auth.equals("vendedor") || auth.equals("admin")) {
			 Tienda tienda = this.tiendaService.findTiendaById(tiendaId);
				Boolean isNew=false;
				model.put("isNew", isNew);
				model.put("tienda", tienda);
				return VIEWS_TIENDA_CREATE_OR_UPDATE_FORM;
		}else {
			return VIEWS_ERROR_AUTH;
		}
	}
	
	@PostMapping(value = "/tienda/{tiendaId}/edit")
	public String processUpdateTiendaForm(@Valid Tienda tienda, BindingResult result,
			@PathVariable("tiendaId") int tiendaId,Map<String, Object> model) {
		if (result.hasErrors()) {
			Boolean isNew=false;
			model.put("isNew", isNew);
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
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Collection<? extends GrantedAuthority> currentPrincipalName = authentication.getAuthorities();
		String auth = currentPrincipalName.iterator().next().toString().trim();
		model.put("auth", auth);
		User currentUser = (User) authentication.getPrincipal();
		if ((auth.equals("vendedor") && currentUser.getTienda().getId().equals(tiendaId)) || auth.equals("admin")) {
			Tienda tienda = this.tiendaService.findTiendaById(tiendaId);
			this.tiendaService.deleteTienda(tienda);
			return "redirect:/";
		}else {
			return VIEWS_ERROR_AUTH;
		}
		
		
    }
	
}