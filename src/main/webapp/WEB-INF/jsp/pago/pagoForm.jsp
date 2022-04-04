<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Formulario de pago</title>
</head>
<body>
	<form action='/charge' method='POST' id='checkout-form'>
		<input type='hidden' value='${amount}' name='amount' /> 
		<span>Precio: ${amount} euros.</span>

		<script src="https://checkout.stripe.com/checkout.js"
			class="stripe-button" data-key="${stripePublicKey}"
			data-name="The NosoSailing"
			data-description="Online course about integrating Stripe"
			data-image="https://stripe.com/img/documentation/checkout/marketplace.png"
			data-locale="auto" data-currency="eur"></script>
	</form>
</body>
</html>