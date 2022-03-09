package org.springframework.samples.petclinic.web;

import java.util.Collection;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.model.Producto;
import org.springframework.samples.petclinic.model.Tienda;
import org.springframework.samples.petclinic.service.ProductoService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductoController {

	private final ProductoService productoService;

	@Autowired
	public ProductoController(ProductoService productoService) {
		this.productoService = productoService;
	}

	@ModelAttribute("producto")
	public Producto findProducto(@PathVariable("productoId") int productoId) {
		return this.productoService.findProductoById(productoId);
	}

	@GetMapping("/producto/{productoId}")
	public ModelAndView showProduct(@PathVariable("productoId") int productoId) {
		ModelAndView mav = new ModelAndView("productos/productoDetails");
		mav.addObject(this.productoService.findProductoById(productoId));
		return mav;
	}

	@GetMapping(value = "/productos/find")
	public String initFindForm(Map<String, Object> model) {
		model.put("producto", new Producto());
		return "productos/findProductos";
	}
	
	@GetMapping(value = "/productos")
	public String processFindForm(Producto producto, BindingResult result, Map<String, Object> model) {

		// allow parameterless GET request for /tiendas to return all records
		if (producto.getNombre() == null) {
			producto.setNombre(""); // empty string signifies broadest possible search
		}

		// find elements by codigo postal
		Collection<Producto> results = this.productoService.findByNombre(producto.getNombre());
		if (results.isEmpty()) {
			// no elements found
			result.rejectValue("nombre", "notFound", "not found");
			return "productos/findProductos";
		}
		else if (results.size() == 1) {
			// 1 element found
			producto = results.iterator().next();
			return "redirect:/productos/" + producto.getId();
		}
		else {
			// multiple elements found
			model.put("selections", results);
			return "productos/productosList";
		}
	}

	@GetMapping("/")
	public ModelAndView showProduct() {
		ModelAndView mav = new ModelAndView("/welcome");
		mav.addObject(this.productoService.findAllProductos());
		return mav;
	}

}
