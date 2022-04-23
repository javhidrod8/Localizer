package org.springframework.samples.localizer.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.localizer.model.ChargeRequest;
import org.springframework.samples.localizer.model.ChargeRequest.Currency;
import org.springframework.samples.localizer.service.StripeService;
import org.springframework.samples.localizer.service.TiendaService;
import org.springframework.samples.localizer.service.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PostMapping;

import com.stripe.exception.StripeException;
import com.stripe.model.Charge;

@Controller
public class ChargeController {

    @Autowired
    private StripeService paymentsService;
	private final UserService userService;
	
	@Autowired
	public ChargeController(StripeService paymentsService, UserService userService) {
		this.paymentsService = paymentsService;
		this.userService = userService;
	}

    @PostMapping("/charge")
    public String charge(ChargeRequest chargeRequest, Model model)
      throws StripeException {
    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User userSession = (User) authentication.getPrincipal();
		String username = userSession.getUsername();
		org.springframework.samples.localizer.model.User user = this.userService.findUser(username);
		user.setPagado(true);
		this.userService.saveUser(user);
        chargeRequest.setDescription("Example charge");
        chargeRequest.setCurrency(Currency.EUR);
        Charge charge = paymentsService.charge(chargeRequest);
        model.addAttribute("id", charge.getId());
        model.addAttribute("status", charge.getStatus());
        model.addAttribute("chargeId", charge.getId());
        model.addAttribute("balance_transaction", charge.getBalanceTransaction());
        return "pago/pagoResult";
    }

    @ExceptionHandler(StripeException.class)
    public String handleError(Model model, StripeException ex) {
        model.addAttribute("error", ex.getMessage());
        return "pago/pagoResult";
    }
}
