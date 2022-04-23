package org.springframework.samples.localizer.web;

import java.util.Map;
import java.util.Set;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.localizer.model.Authorities;
import org.springframework.samples.localizer.model.Tienda;
import org.springframework.samples.localizer.model.User;
import org.springframework.samples.localizer.service.AuthoritiesService;
import org.springframework.samples.localizer.service.TiendaService;
import org.springframework.samples.localizer.service.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
class UserController {

	private static final String VIEWS_USER_CREATE_OR_UPDATE_FORM = "users/createOrUpdateUserForm";

	private final UserService userService;
	private final AuthoritiesService authoritiesService;
	private final TiendaService tiendaService;

	@Autowired
	public UserController(UserService userService, AuthoritiesService authoritiesService, TiendaService tiendaService) {
		this.userService = userService;
		this.authoritiesService = authoritiesService;
		this.tiendaService = tiendaService;
	}

	@InitBinder
	public void setAllowedFields(WebDataBinder dataBinder) {
		dataBinder.setDisallowedFields("id");
	}

	@GetMapping("/users/new")
	public String initCreationForm(Map<String, Object> model) {
		User user = new User();
		Authorities auth = new Authorities();
		model.put("user", user);
		model.put("authorities", auth);
		Boolean isNew = true;
		model.put("isNew", isNew);
		model.put("tiendaId", 0);
		return VIEWS_USER_CREATE_OR_UPDATE_FORM;
	}

	@PostMapping("/users/new")
	public String processCreationForm(@Valid User user,@Valid Authorities auth, BindingResult result, Map<String, Object> model) {
		
		if (result.hasErrors()) {
			model.put("user",user);
			model.put("authorities", auth);
			return VIEWS_USER_CREATE_OR_UPDATE_FORM;
		}
		else {
			String username = user.getUsername();
			String auth1 = auth.getAuthority();
			this.userService.saveUser(user);
			this.authoritiesService.saveAuthorities(username, auth1);
			return "redirect:/users/" + user.getUsername();
		}
	}

/*  @GetMapping("/users/find")
	public String initFindForm(Map<String, Object> model) {
		model.put("owner", new User());
		return "owners/findUsers";
	}
	


	@GetMapping("/owners")
	public String processFindForm(@RequestParam(defaultValue = "1") int page, User owner, BindingResult result,
			Model model) {

		// allow parameterless GET request for /owners to return all records
		if (owner.getLastName() == null) {
			owner.setLastName(""); // empty string signifies broadest possible search
		}

		// find owners by last name
		String lastName = owner.getLastName();
		Page<User> ownersResults = findPaginatedForOwnersLastName(page, lastName);
		if (ownersResults.isEmpty()) {
			// no owners found
			result.rejectValue("lastName", "notFound", "not found");
			return "owners/findOwners";
		}
		else if (ownersResults.getTotalElements() == 1) {
			// 1 owner found
			owner = ownersResults.iterator().next();
			return "redirect:/owners/" + owner.getId();
		}
		else {
			// multiple owners found
			lastName = owner.getLastName();
			return addPaginationModel(page, model, lastName, ownersResults);
		}
	}
	


	private String addPaginationModel(int page, Model model, String lastName, Page<Owner> paginated) {
		model.addAttribute("listOwners", paginated);
		List<Owner> listOwners = paginated.getContent();
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", paginated.getTotalPages());
		model.addAttribute("totalItems", paginated.getTotalElements());
		model.addAttribute("listOwners", listOwners);
		return "owners/ownersList";
	}
	

	private Page<Owner> findPaginatedForOwnersLastName(int page, String lastname) {

		int pageSize = 5;
		Pageable pageable = PageRequest.of(page - 1, pageSize);
		return owners.findByLastName(lastname, pageable);

	}
*/

	@GetMapping("/users/{username}/edit")
	public String initUpdateUserForm(Map<String, Object> model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		org.springframework.security.core.userdetails.User userSession = (org.springframework.security.core.userdetails.User) authentication.getPrincipal();
		String username = userSession.getUsername();
		User user = this.userService.findUser(username);
		Set<Authorities> a = user.getAuthorities();
		Boolean isNew = false;
		model.put("user", user);
		model.put("authorities", a);
		model.put("isNew", isNew);
		if(user.getTienda()!=null) {
			Integer tiendaId = user.getTienda().getId();
			model.put("tiendaId", tiendaId);
			}else {
				model.put("tiendaId", 0);
			}
		return VIEWS_USER_CREATE_OR_UPDATE_FORM;
		
	}

	@PostMapping("/users/{username}/edit")
	public String processUpdateUserForm(@PathVariable("username") String username,@Valid Authorities authorities,@Valid Integer tiendaId, @Valid User user,BindingResult result,  Map<String, Object> model) {
		if (result.hasErrors()) {
			model.put("user", user);
			Boolean isNew = false;
			model.put("isNew", isNew);	
			model.put("authorities", authorities);
			model.put("tiendaId", tiendaId);
			return VIEWS_USER_CREATE_OR_UPDATE_FORM;
		}
		else {
			Tienda t = this.tiendaService.findTiendaById(tiendaId);
			user.setTienda(t);
			user.setUsername(username);
			this.userService.saveUser(user);
			return "redirect:/users/" + user.getUsername();
		}
	}

	
	@GetMapping("/users/{username}")
	public ModelAndView showUser(@PathVariable("username") String username) {
		ModelAndView mav = new ModelAndView("users/userDetails");
		User user = this.userService.findUser(username);
		mav.addObject(user);
		return mav;
	}

}
