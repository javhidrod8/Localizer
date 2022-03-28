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
import org.springframework.samples.localizer.service.ProductoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductoController {

	private static final String VIEWS_PRODUCTO_CREATE_OR_UPDATE_FORM = "productos/createOrUpdateProductoForm";
	private final ProductoService productoService;

	@Autowired
	public ProductoController(ProductoService productoService) {
		this.productoService = productoService;
	}
	
	@InitBinder
	public void setAllowedFields(WebDataBinder dataBinder) {
		dataBinder.setDisallowedFields("id");
	}
//
//	@ModelAttribute("producto")
//	public Producto findProducto(@PathVariable("productoId") int productoId) {
//		return this.productoService.findProductoById(productoId);
//	}

	@GetMapping("/producto/{productoId}")
	public ModelAndView showProduct(@PathVariable("productoId") int productoId) {
		ModelAndView mav = new ModelAndView("productos/productoDetails");
		mav.addObject(this.productoService.findProductoById(productoId));
		return mav;
	}

//	@GetMapping(value = "/productos/find")
//	public String initFindForm(Map<String, Object> model) {
//		model.put("producto", new Producto());
//		return "productos/findProductos";
//	}
	
//	@GetMapping(value = "/productos")
//	public String processFindForm(Producto producto, BindingResult result, Map<String, Object> model) {
//
//		// allow parameterless GET request for /tiendas to return all records
//		if (producto.getNombre() == null) {
//			producto.setNombre(""); // empty string signifies broadest possible search
//		}
//
//		// find elements by codigo postal
//		Collection<Producto> results = this.productoService.findByNombre(producto.getNombre());
//		if (results.isEmpty()) {
//			// no elements found
//			result.rejectValue("nombre", "notFound", "not found");
//			return "productos/findProductos";
//		}
//		else if (results.size() == 1) {
//			// 1 element found
//			producto = results.iterator().next();
//			return "redirect:/productos/" + producto.getId();
//		}
//		else {
//			// multiple elements found
//			model.put("selections", results);
//			return "productos/productosList";
//		}
//	}
	
	@GetMapping(value = "/productos/{name}")
	public String productListByName(@PathVariable("name") String name, ModelMap modelMap) {
		String vista = "productos/productosList";
		Iterable<Producto> productos = this.productoService.findByNombre(name);
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
	
	
	@GetMapping(value = "/productos")
	public String productList(ModelMap modelMap) {
		String vista = "productos/productosList";
		Iterable<Producto> productos = this.productoService.findAllProductos();
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
	
	@GetMapping(value = "/producto/{productoId}/edit")
	public String initUpdateProductoForm(@PathVariable("productoId") int productoId, ModelMap model) {
		Producto producto = this.productoService.findProductoById(productoId);
		model.put("producto",producto);
        Boolean isNew = false;
		model.put("isNew", isNew);
		return VIEWS_PRODUCTO_CREATE_OR_UPDATE_FORM;
	}
	
	@PostMapping(value = "/producto/{productoId}/edit")
	public String processUpdateProductoForm(@Valid Producto producto, BindingResult result,
			@PathVariable("productoId") int productoId,ModelMap model) {
		if (result.hasErrors()) {
            Boolean isNew = false;
			model.put("isNew", isNew);
			model.put("producto",producto);
			return VIEWS_PRODUCTO_CREATE_OR_UPDATE_FORM;
		}
		else {
			producto.setId(productoId);			
			this.productoService.saveProducto(producto);
			return "redirect:/producto/{productoId}";
		}
	}
}
