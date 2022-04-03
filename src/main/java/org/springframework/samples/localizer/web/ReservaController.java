package org.springframework.samples.localizer.web;

import java.util.Collection;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.localizer.model.Producto;
import org.springframework.samples.localizer.model.Reserva;
import org.springframework.samples.localizer.model.Tienda;
import org.springframework.samples.localizer.service.ProductoService;
import org.springframework.samples.localizer.service.ReservaService;
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

@Controller
public class ReservaController {
	
	private static final String VIEWS_ERROR_TIENDAID = "reservas/createOrUpdateReservaForm";
	private static final String VIEWS_FORM_RESERVAS = "reservas/createOrUpdateReservaForm";
	private static final String VIEWS_LIST_RESERVAS = "reservas/reservasList";
	private static final String VIEWS_ERROR_AUTH = "productos/createOrUpdateProductoForm";
	private final ReservaService reservaService;
	private final ProductoService productoService;
	private final UserService userService;
	
	@Autowired
	public ReservaController(ReservaService reservaService, ProductoService productoService,
			UserService userService) {
		this.reservaService = reservaService;
		this.productoService = productoService;
		this.userService = userService;
	}
	
	@InitBinder
	public void setAllowedFields(WebDataBinder dataBinder) {
		dataBinder.setAllowedFields("id");
	}
	
	@GetMapping("/tienda/{tiendaId}/producto/{productoId}/reservar")
	public String initCreationReservaForm(@PathVariable("productoId") int productoId, @PathVariable("tiendaId") int tiendaId, ModelMap model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Collection<? extends GrantedAuthority> currentPrincipalName = authentication.getAuthorities();
		String auth = currentPrincipalName.iterator().next().toString().trim();
		model.put("auth", auth);
		if(auth.equals("cliente")) {
			Producto producto = this.productoService.findProductoById(productoId);
			Tienda tienda = producto.getTienda();
			if(tienda.getId().equals(tiendaId)) {
				User userSession = (User) authentication.getPrincipal();
				String username = userSession.getUsername();
				org.springframework.samples.localizer.model.User user = this.userService.findUser(username);
				Reserva reserva = new Reserva();
				reserva.setUser(user);
				model.put("reserva", reserva);
				return VIEWS_FORM_RESERVAS;
			} else {
				return VIEWS_ERROR_TIENDAID;
			}
			
		} else {
			return VIEWS_ERROR_AUTH;
		}
	}
	
	@PostMapping("/tienda/{tiendaId}/producto/{productoId}/reservar")
	public String processCreationReservaForm(@PathVariable("productoId") int productoId, @PathVariable("tiendaId") int tiendaId, @Valid Reserva reserva, BindingResult result,
			Map<String, Object> model) {
		if(result.hasErrors()) {
			model.put("reserva", reserva);
			return VIEWS_FORM_RESERVAS;
		} else {
			Producto producto = this.productoService.findProductoById(productoId);
			Tienda tienda = producto.getTienda();
			reserva.setProducto(producto);
			reserva.setTienda(tienda);
			this.reservaService.saveReserva(reserva);
			return "redirect:/tienda/" + tienda.getId();
		}
	}
	
	@GetMapping(value = "/reserva/{reservaId}/delete")
    public String deleteReserva(@PathVariable("reservaId") int reservaId, ModelMap model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Collection<? extends GrantedAuthority> currentPrincipalName = authentication.getAuthorities();
		String auth = currentPrincipalName.iterator().next().toString().trim();
		model.put("auth", auth);
		User currentUser = (User) authentication.getPrincipal();
		String username = currentUser.getUsername();
		Reserva reserva = this.reservaService.findReservaById(reservaId);
		Integer tiendaId = reserva.getTienda().getId();
		org.springframework.samples.localizer.model.User user = this.userService.findUser(username);
		if ((auth.equals("vendedor") && user.getTienda().getId().equals(tiendaId)) || auth.equals("admin")) {
			this.reservaService.deleteReserva(reserva);
			return VIEWS_LIST_RESERVAS;
		}else {
			return VIEWS_ERROR_AUTH;
		}
    }

}
