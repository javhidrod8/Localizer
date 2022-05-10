package org.springframework.samples.localizer.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.localizer.repository.UserRepository;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.samples.localizer.model.Intolerancias;
import org.springframework.samples.localizer.model.Preferencias;
import org.springframework.samples.localizer.model.Producto;
import org.springframework.samples.localizer.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Collection;
import java.util.List;

@Controller
public class WelcomeController {
	
	
	  @GetMapping({"/","/welcome"})
	  public String welcome(Map<String, Object> model) {	    

	    return "welcome";
	  }

	  @RequestMapping(value = "/login", method = RequestMethod.GET)
		public String login(Model model, String error, String logout) {
			if (error != null)
				model.addAttribute("errorMsg", "Tu usuario y contraseña no son válidos");

			if (logout != null)
				model.addAttribute("msg", "Te has desconectado con éxito.");

			return "login";
    }
	  
	  
		@GetMapping(value = "/terminos")
		public String terminosYCondiciones(ModelMap modelMap) {
			String vista = "terminos";
			return vista;
		}
		@GetMapping(value = "/intolerancias")
		public String alergenosEIntolerancias(ModelMap modelMap) {
			return "intolerancias";
		}
}
