package org.springframework.samples.localizer.web;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.samples.localizer.model.ChargeRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CheckoutController {

    private String stripePublicKey = "pk_test_51KkvL9KG3oK2b1ZAasFMo9nrVyrDrbXWHLQxvLqpT5R2gGHmzjPFeWCpXWFzQYDL7s0SZrRpQDiI6qBcauRQ8ytz00LoahPg22";

    @RequestMapping("/checkout")
    public String checkout(Model model) {
        model.addAttribute("amount", 50); // in cents
        model.addAttribute("stripePublicKey", stripePublicKey);
        model.addAttribute("currency", ChargeRequest.Currency.EUR);
        return "pago/pagoForm";
    }
}
