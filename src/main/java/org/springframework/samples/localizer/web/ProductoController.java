package org.springframework.samples.localizer.web;

import java.util.Collection;
import java.util.HashSet;
import java.util.LinkedHashSet;

import java.util.Map;
import java.util.Set;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.localizer.model.Estado;
import org.springframework.samples.localizer.model.Intolerancias;
import org.springframework.samples.localizer.model.Preferencias;
import org.springframework.samples.localizer.model.Producto;
import org.springframework.samples.localizer.service.IntoleranciasService;
import org.springframework.samples.localizer.model.Tienda;
import org.springframework.samples.localizer.service.ProductoService;
import org.springframework.samples.localizer.service.TiendaService;
import org.springframework.samples.localizer.service.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
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
	private final TiendaService tiendaService;
	private final UserService userService;

	@Autowired
	public ProductoController(ProductoService productoService, IntoleranciasService intoleranciasService,
			TiendaService tiendaService, UserService userService) {
		this.productoService = productoService;
		this.intoleranciasService = intoleranciasService;
		this.tiendaService = tiendaService;
		this.userService = userService;
	}

	@InitBinder
	public void setAllowedFields(WebDataBinder dataBinder) {
		dataBinder.setDisallowedFields("id");
	}

	@GetMapping("producto/{productoId}")
	public ModelAndView showProduct(@PathVariable("productoId") int productoId) {
		ModelAndView mav = new ModelAndView("productos/productoDetails");
		Producto producto = this.productoService.findProductoById(productoId);
		mav.addObject(producto);
		Collection<Intolerancias> intolerancias = this.intoleranciasService.findAllIntolerancias();
		Collection<Preferencias> preferencias = this.productoService.findAllPreferencias();
		mav.addObject("intolerancias", intolerancias);
		mav.addObject("preferencias", preferencias);
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Collection<? extends GrantedAuthority> currentPrincipalName = authentication.getAuthorities();
		String auth = currentPrincipalName.iterator().next().toString().trim();
		User currentUser = (User) authentication.getPrincipal();
		String username = currentUser.getUsername();
		org.springframework.samples.localizer.model.User user = this.userService.findUser(username);
		if (auth.equals("admin")) {
			mav.addObject("miTienda", true);
		} else {
			if (auth.equals("vendedor")) {
				Tienda t = user.getTienda();
				if (t.getId() != null) {
					if (t.getId() == producto.getTienda().getId()) {
						mav.addObject("miTienda", true);
					}
					mav.addObject("miTienda", false);
				}
				mav.addObject("miTienda", false);
			} else {
				mav.addObject("miTienda", false);
			}
		}
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
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Collection<? extends GrantedAuthority> currentPrincipalName = authentication.getAuthorities();
		String auth = currentPrincipalName.iterator().next().toString().trim();
		if (auth.equals("nutricionista")) {
			String vista = "productos/productosVerificar";
			Iterable<Producto> productos = this.productoService.findProductoByEstado(Estado.PENDIENTE);
			modelMap.addAttribute("productos", productos);
			return vista;
		} else {
			return VIEWS_ERROR_AUTH;
		}
	}

	@GetMapping(value = "/tienda/{tiendaId}/productos/new")
	public String initCreationProductoForm(@PathVariable("tiendaId") Integer tiendaId, Map<String, Object> model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Collection<? extends GrantedAuthority> currentPrincipalName = authentication.getAuthorities();
		String auth = currentPrincipalName.iterator().next().toString().trim();
		model.put("auth", auth);
		Collection<Producto> productos = this.productoService.findAllProductos();
		Set<Intolerancias> intolerancias = new LinkedHashSet<Intolerancias>();
		Set<Preferencias> preferencias = new LinkedHashSet<Preferencias>();
		for (Producto p : productos) {
			intolerancias.addAll(p.getIntolerancia());
			preferencias.add(p.getPreferencia());
		}
		model.put("productos", productos);
		model.put("intolerancias", intolerancias);
		model.put("preferencias", preferencias);
		if (auth.equals("vendedor") || auth.equals("admin")) {
			model.put("tiendaId", tiendaId);
			Producto producto = new Producto();
			model.put("producto", producto);
			Boolean isNew = true;
			model.put("isNew", isNew);
			return VIEWS_PRODUCTO_CREATE_OR_UPDATE_FORM;
		} else {
			return VIEWS_ERROR_AUTH;
		}
	}

	@PostMapping(value = "/tienda/{tiendaId}/productos/new")
	public String processCreationProductoForm(@PathVariable("tiendaId") Integer tiendaId, @Valid Producto producto,
			BindingResult result, Map<String, Object> model) {
		if (result.hasErrors()) {
			model.put("tiendaId", tiendaId);
			Boolean isNew = true;
			model.put("isNew", isNew);
			model.put("producto", producto);
			return VIEWS_PRODUCTO_CREATE_OR_UPDATE_FORM;
		} else {
			Tienda t = tiendaService.findTiendaById(tiendaId);
			producto.setTienda(t);
			t.getProductos().add(producto);
			this.productoService.saveProducto(producto);
			this.tiendaService.saveTienda(t);
			return "redirect:/producto/" + producto.getId();

		}
	}

	@GetMapping(value = "/tienda/{tiendaId}/producto/{productoId}/edit")
	public String initUpdateProductoForm(@PathVariable("tiendaId") Integer tiendaId,
			@PathVariable("productoId") int productoId, ModelMap model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Collection<? extends GrantedAuthority> currentPrincipalName = authentication.getAuthorities();
		String auth = currentPrincipalName.iterator().next().toString().trim();
		model.put("auth", auth);
		Collection<Producto> productos = this.productoService.findAllProductos();
		Set<Intolerancias> intolerancias = new LinkedHashSet<Intolerancias>();
		Set<Preferencias> preferencias = new LinkedHashSet<Preferencias>();
		for (Producto p : productos) {
			intolerancias.addAll(p.getIntolerancia());
			preferencias.add(p.getPreferencia());
		}
		model.put("productos", productos);
		model.put("intolerancias", intolerancias);
		model.put("preferencias", preferencias);
		if (auth.equals("vendedor") || auth.equals("admin") || auth.equals("nutricionista")) {
			model.put("tiendaId", tiendaId);
			Producto producto = this.productoService.findProductoById(productoId);
			model.put("producto", producto);
			Boolean isNew = false;
			model.put("isNew", isNew);
			return VIEWS_PRODUCTO_CREATE_OR_UPDATE_FORM;
		} else {
			return VIEWS_ERROR_AUTH;
		}
	}

	@PostMapping(value = "/tienda/{tiendaId}/producto/{productoId}/edit")
	public String processUpdateProductoForm(@Valid Producto producto, BindingResult result,
			@PathVariable("productoId") int productoId, @PathVariable("tiendaId") int tiendaId, ModelMap model) {
		if (result.hasErrors()) {
			model.put("tiendaId", tiendaId);
			Boolean isNew = false;
			model.put("isNew", isNew);
			model.put("producto", producto);
			return VIEWS_PRODUCTO_CREATE_OR_UPDATE_FORM;
		} else {
			producto.setId(productoId);
			this.productoService.saveProducto(producto);
			return "redirect:/producto/" + producto.getId();
		}
	}

	@RequestMapping(value = "/tienda/{tiendaId}/producto/{productoId}/delete")
	public String deleteProducto(@PathVariable("productoId") final int productoId,
			@PathVariable("tiendaId") final int tiendaId, final ModelMap model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Collection<? extends GrantedAuthority> currentPrincipalName = authentication.getAuthorities();
		String auth = currentPrincipalName.iterator().next().toString().trim();
		model.put("auth", auth);
		User currentUser = (User) authentication.getPrincipal();
		String username = currentUser.getUsername();
		org.springframework.samples.localizer.model.User user = this.userService.findUser(username);
		if ((auth.equals("vendedor") && user.getTienda().getId().equals(tiendaId)) || auth.equals("admin")) {
			model.put("tiendaId", tiendaId);
			Producto producto = this.productoService.findProductoById(productoId);
			this.productoService.deleteProducto(producto);
			return "redirect:/tienda/" + tiendaId;
		} else {
			return VIEWS_ERROR_AUTH;
		}
	}

}
