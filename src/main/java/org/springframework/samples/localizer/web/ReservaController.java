package org.springframework.samples.localizer.web;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.localizer.model.Estado;
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

	private static final String VIEWS_ERROR_TIENDAID = "";
	private static final String VIEWS_FORM_RESERVAS = "reservas/createOrUpdateReservaForm";
	private static final String VIEWS_LIST_RESERVAS = "reservas/reservasList";
	// TODO: Crear vistas de error
	private static final String VIEWS_ERROR_AUTH = "reservas/createOrUpdateReservaForm";
	private static final String VIEWS_CANCELAR_RESERVA = "reservas/createOrUpdateReservaForm";
	private static final String VIEWS_ERROR_ESTADO_PRODUCTO = "reservas/createOrUpdateReservaForm";
	private static final String VIEWS_VERIFICAR_RESERVA = "reservas/createOrUpdateReservaForm";
	private final ReservaService reservaService;
	private final ProductoService productoService;
	private final UserService userService;

	@Autowired
	public ReservaController(ReservaService reservaService, ProductoService productoService, UserService userService) {
		this.reservaService = reservaService;
		this.productoService = productoService;
		this.userService = userService;
	}

	/*@InitBinder
	public void setAllowedFields(WebDataBinder dataBinder) {
		dataBinder.setAllowedFields("id");
	}*/

	@GetMapping("/tienda/{tiendaId}/producto/{productoId}/reservar")
	public String initCreationReservaForm(@PathVariable("productoId") int productoId,
			@PathVariable("tiendaId") int tiendaId, Map<String, Object> model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Collection<? extends GrantedAuthority> currentPrincipalName = authentication.getAuthorities();
		String auth = currentPrincipalName.iterator().next().toString().trim();
		model.put("auth", auth);
		if (auth.equals("cliente")) {
			Producto producto = this.productoService.findProductoById(productoId);
			Tienda tienda = producto.getTienda();
			if (tienda.getId().equals(tiendaId)) {
				Reserva reserva = new Reserva();
				reserva.setProducto(producto);
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
	public String processCreationReservaForm(@PathVariable("productoId") int productoId,
			@PathVariable("tiendaId") int tiendaId, @Valid Reserva reserva, BindingResult result,
			Map<String, Object> model) {
		if (result.hasErrors()) {
			model.put("reserva", reserva);
			return VIEWS_FORM_RESERVAS;
		} else {
			Producto producto = this.productoService.findProductoById(productoId);
			Tienda tienda = producto.getTienda();
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			User userSession = (User) authentication.getPrincipal();
			String username = userSession.getUsername();
			org.springframework.samples.localizer.model.User user = this.userService.findUser(username);
			reserva.setUser(user);
			reserva.setProducto(producto);
			reserva.setTienda(tienda);
			reserva.setEstado(Estado.PENDIENTE);
			reserva.setPrecio_total(reserva.getCantidad()*producto.getPrecio());
			this.reservaService.saveReserva(reserva);
			return "redirect:/tienda/" + tienda.getId();
		}
	}

	@GetMapping(value = "tienda/{tiendaId}/reservas/{reservaId}/verificar")
	public String initVerificarReserva(@PathVariable("tiendaId") int tiendaId, @PathVariable("reservaId") int reservaId,
			ModelMap model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Collection<? extends GrantedAuthority> currentPrincipalName = authentication.getAuthorities();
		String auth = currentPrincipalName.iterator().next().toString().trim();
		model.put("auth", auth);
		User currentUser = (User) authentication.getPrincipal();
		String username = currentUser.getUsername();
		org.springframework.samples.localizer.model.User user = this.userService.findUser(username);
		Reserva reserva = this.reservaService.findReservaById(reservaId);
		if ((auth.equals("vendedor") && user.getTienda().getId().equals(tiendaId)) || auth.equals("admin")) {
			if (reserva.getEstado() == Estado.PENDIENTE) {
				model.addAttribute("reserva", reserva);
				model.put("verificar", true);
				return VIEWS_VERIFICAR_RESERVA;
			} else {
				return VIEWS_ERROR_ESTADO_PRODUCTO;
			}
		} else {
			return VIEWS_ERROR_AUTH;
		}
	}

	@GetMapping(value = "users/{username}/reservas/{reservaId}/cancelar")
    public String initCancelarReservaCliente(@PathVariable("username") String username,@PathVariable("reservaId") int reservaId, ModelMap model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Collection<? extends GrantedAuthority> currentPrincipalName = authentication.getAuthorities();
		String auth = currentPrincipalName.iterator().next().toString().trim();
		model.put("auth", auth);
		User currentUser = (User) authentication.getPrincipal();
		String currentUsername = currentUser.getUsername();
		org.springframework.samples.localizer.model.User user = this.userService.findUser(currentUsername);
		Reserva reserva = this.reservaService.findReservaById(reservaId);
		if (((auth.equals("vendedor") || auth.equals("cliente")) && user.getUsername().equals(username)) || auth.equals("admin")) {
			if (reserva.getEstado() == Estado.PENDIENTE) {
				model.addAttribute("reserva", reserva);
				model.put("cancelar", true);
				return VIEWS_CANCELAR_RESERVA;
			} else {
				return VIEWS_ERROR_ESTADO_PRODUCTO;
			}
		}else {
			return VIEWS_ERROR_AUTH;
		}
    }
	
	@PostMapping(value = "tienda/{tiendaId}/reservas/{reservaId}/verificar")
	public String processVerificarReserva(@PathVariable("tiendaId") int tiendaId, @PathVariable("reservaId") int reservaId, @Valid Reserva reserva, BindingResult result,
			ModelMap model) {
		if (result.hasErrors()) {
			model.addAttribute("reserva", reserva);
			return VIEWS_VERIFICAR_RESERVA;
		} else {
			Reserva r = reservaService.findReservaById(reservaId);
			r.setEstado(reserva.getEstado());
			r.setComentario(reserva.getComentario());
			this.reservaService.saveReserva(r);
			return "redirect:/tienda/" + tiendaId + "/reservas";

		}
	}
	
	@PostMapping(value = "users/{username}/reservas/{reservaId}/cancelar")
	public String processCancelarReservaCliente(@PathVariable("username") String username, @PathVariable("reservaId") int reservaId, @Valid Reserva reserva, BindingResult result,
			ModelMap model) {
		if (result.hasErrors()) {
			model.addAttribute("reserva", reserva);
			return VIEWS_CANCELAR_RESERVA;
		} else {
			Reserva r = reservaService.findReservaById(reservaId);
			r.setComentario(reserva.getComentario());
			r.setEstado(Estado.RECHAZADO);
			this.reservaService.saveReserva(r);
			return "redirect:/users/" + username + "/reservas";

		}
	}

	@GetMapping(value = "/tienda/{tiendaId}/reservas")
	public String reservaList(@PathVariable("tiendaId") Integer tiendaId, Map<String, Object> model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Collection<? extends GrantedAuthority> currentPrincipalName = authentication.getAuthorities();
		String auth = currentPrincipalName.iterator().next().toString().trim();
		model.put("auth", auth);
		User currentUser = (User) authentication.getPrincipal();
		String username = currentUser.getUsername();
		org.springframework.samples.localizer.model.User user = this.userService.findUser(username);
		Boolean cond = (auth.equals("vendedor") && user.getTienda().getId().equals(tiendaId)) || auth.equals("admin");
		if (cond) {
			List<Reserva> reservas = this.reservaService.findReservaByTienda(tiendaId);
			model.put("reservas", reservas);
			model.put("mitienda", true);
			return VIEWS_LIST_RESERVAS;
		} else {
			return VIEWS_ERROR_AUTH;
		}
	}

	@GetMapping(value = "/users/{username}/reservas")
	public String reservaListUsername(@PathVariable("username") String username, Map<String, Object> model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Collection<? extends GrantedAuthority> currentPrincipalName = authentication.getAuthorities();
		String auth = currentPrincipalName.iterator().next().toString().trim();
		model.put("auth", auth);
		User currentUser = (User) authentication.getPrincipal();
		String currentUsername = currentUser.getUsername();
		org.springframework.samples.localizer.model.User user = this.userService.findUser(currentUsername);
		Boolean cond = (((auth.equals("vendedor") || auth.equals("cliente")) && user.getUsername().equals(username))
				|| auth.equals("admin"));
		if (cond) {
			List<Reserva> reservas = this.reservaService.findReservaByUser(username);
			model.put("reservas", reservas);
			return VIEWS_LIST_RESERVAS;
		} else {
			return VIEWS_ERROR_AUTH;
		}
	}

}
