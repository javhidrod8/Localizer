package org.springframework.samples.localizer.web;

import java.util.Collection;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.localizer.model.Estado;
import org.springframework.samples.localizer.model.Intolerancias;
import org.springframework.samples.localizer.model.Preferencias;
import org.springframework.samples.localizer.model.Producto;
import org.springframework.samples.localizer.service.IntoleranciasService;
import org.springframework.samples.localizer.service.ProductoService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductoController {

	private static final String VIEWS_PRODUCTO_CREATE_OR_UPDATE_FORM = "productos/createOrUpdateProductoForm";
	private static final String VIEWS_ERROR_AUTH = "productos/createOrUpdateProductoForm";
	private static final String VIEWS_PRODUCTO_RECHAZAR_FORM = "productos/rechazarProductoForm";
	private final ProductoService productoService;
	private final IntoleranciasService intoleranciasService;

	@Autowired
	public ProductoController(ProductoService productoService, IntoleranciasService intoleranciasService) {
		this.productoService = productoService;
		this.intoleranciasService = intoleranciasService;
	}

	@InitBinder
	public void setAllowedFields(WebDataBinder dataBinder) {
		dataBinder.setDisallowedFields("id");
	}

	@GetMapping("/producto/{productoId}")
	public ModelAndView showProduct(@PathVariable("productoId") int productoId) {
		ModelAndView mav = new ModelAndView("productos/productoDetails");
		mav.addObject(this.productoService.findProductoById(productoId));
		return mav;
	}

	@GetMapping(value = "/productos/search")
	public String productListSearchEmpty(ModelMap modelMap) {
		String vista = "productos/productosList";
		Iterable<Producto> productos = this.productoService.findAllProductos();
		Collection<Intolerancias> intolerancias = this.intoleranciasService.findAllIntolerancias();
		Collection<Preferencias> preferencias = this.productoService.findAllPreferencias();
		modelMap.addAttribute("productos", productos);
		modelMap.addAttribute("intolerancias", intolerancias);
		modelMap.addAttribute("preferencias", preferencias);
		return vista;
	}

	@GetMapping(value = "/productos/search/{name}")
	public String productListByName(@PathVariable("name") String name, ModelMap modelMap) {
		String vista = "productos/productosList";
		Iterable<Producto> productos = this.productoService.findByNombre(name);
		Collection<Intolerancias> intolerancias = this.intoleranciasService.findAllIntolerancias();
		Collection<Preferencias> preferencias = this.productoService.findAllPreferencias();
		modelMap.addAttribute("productos", productos);
		modelMap.addAttribute("intolerancias", intolerancias);
		modelMap.addAttribute("preferencias", preferencias);
		return vista;

	}

	@GetMapping(value = "/productos")
	public String productList(ModelMap modelMap) {
		String vista = "productos/productosList";
		Iterable<Producto> productos = this.productoService.findAllProductos();
		Collection<Intolerancias> intolerancias = this.intoleranciasService.findAllIntolerancias();
		Collection<Preferencias> preferencias = this.productoService.findAllPreferencias();
		modelMap.addAttribute("productos", productos);
		modelMap.addAttribute("intolerancias", intolerancias);
		modelMap.addAttribute("preferencias", preferencias);
		return vista;
	}

	@GetMapping(value = "/productos/verificar")
	public String productListNutricionista(ModelMap modelMap) {
		String vista = "productos/productosVerificar";
		Iterable<Producto> productos = this.productoService.findProductoByEstado(Estado.PENDIENTE);
		modelMap.addAttribute("productos", productos);
		return vista;
	}

	@GetMapping(value = "/productos/new")
	public String initCreationProductoForm(Map<String, Object> model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Collection<? extends GrantedAuthority> currentPrincipalName = authentication.getAuthorities();
		String auth = currentPrincipalName.iterator().next().toString().trim();
		model.put("auth", auth);
		if (auth.equals("vendedor") || auth.equals("admin")) {
			Producto producto = new Producto();
			model.put("producto", producto);
			Boolean isNew = true;
			model.put("isNew", isNew);
			return VIEWS_PRODUCTO_CREATE_OR_UPDATE_FORM;
		} else {
			return VIEWS_ERROR_AUTH;
		}
	}

	@PostMapping(value = "/productos/new")
	public String processCreationProductoForm(@Valid Producto producto, BindingResult result,
			Map<String, Object> model) {
		if (result.hasErrors()) {
			Boolean isNew = true;
			model.put("isNew", isNew);
			model.put("producto", producto);
			return VIEWS_PRODUCTO_CREATE_OR_UPDATE_FORM;
		} else {
			this.productoService.saveProducto(producto);
			return "redirect:/producto/" + producto.getId();

		}
	}

	@GetMapping(value = "/producto/{productoId}/edit")
	public String initUpdateProductoForm(@PathVariable("productoId") int productoId, ModelMap model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Collection<? extends GrantedAuthority> currentPrincipalName = authentication.getAuthorities();
		String auth = currentPrincipalName.iterator().next().toString().trim();
		model.put("auth", auth);
		if (auth.equals("vendedor") || auth.equals("admin") || auth.equals("nutricionista")) {
			Producto producto = this.productoService.findProductoById(productoId);
			model.put("producto", producto);
			Boolean isNew = false;
			model.put("isNew", isNew);
			return VIEWS_PRODUCTO_CREATE_OR_UPDATE_FORM;
		} else {
			return VIEWS_ERROR_AUTH;
		}
	}

	@PostMapping(value = "/producto/{productoId}/edit")
	public String processUpdateProductoForm(@Valid Producto producto, BindingResult result,
			@PathVariable("productoId") int productoId, ModelMap model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Collection<? extends GrantedAuthority> currentPrincipalName = authentication.getAuthorities();
		String auth = currentPrincipalName.iterator().next().toString().trim();
		if (result.hasErrors()) {
			Boolean isNew = false;
			model.put("isNew", isNew);
			model.put("producto", producto);
			return VIEWS_PRODUCTO_CREATE_OR_UPDATE_FORM;
		} else {
			if (auth.equals("nutricionista")) {
				producto.setEstado(Estado.ACEPTADO);
			}
			producto.setId(productoId);
			this.productoService.saveProducto(producto);
			return "redirect:/producto/{productoId}";
		}
	}

	@GetMapping(value = "/producto/{productoId}/rechazar")
	public String initRechazarProductoForm(@PathVariable("productoId") int productoId, ModelMap model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Collection<? extends GrantedAuthority> currentPrincipalName = authentication.getAuthorities();
		String auth = currentPrincipalName.iterator().next().toString().trim();
		model.put("auth", auth);
		if (auth.equals("nutricionista")) {
			Producto producto = this.productoService.findProductoById(productoId);
			model.put("producto", producto);
			return VIEWS_PRODUCTO_RECHAZAR_FORM;
		} else {
			return VIEWS_ERROR_AUTH;
		}
	}

	@PostMapping(value = "/producto/{productoId}/rechazar")
	public String processRechazarProductoForm(@Valid Producto producto, BindingResult result,
			@PathVariable("productoId") int productoId, ModelMap model) {
		if (result.hasErrors()) {
			model.put("producto", producto);
			return VIEWS_PRODUCTO_RECHAZAR_FORM;
		} else {
			producto.setId(productoId);
			this.productoService.saveProducto(producto);
			return "redirect:/producto/{productoId}";
		}
	}

	@RequestMapping(value = "/producto/{productoId}/delete")
	public String deleteProducto(@PathVariable("productoId") final int productoId, final ModelMap model) {
		Producto producto = this.productoService.findProductoById(productoId);
		Integer id = producto.getTienda().getId();
		this.productoService.deleteProducto(producto);
		return "redirect:/tienda/" + id;
	}

}
