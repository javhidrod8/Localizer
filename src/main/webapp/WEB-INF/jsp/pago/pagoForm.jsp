<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<meta charset="ISO-8859-1">
<petclinic:layout pageName="pago-tarjeta">
<h2>Realizar pago</h2>
<div class="row">
	<div class="col-md-4 col-md-offset-4 ">
	<form action='/charge' method='POST' id='checkout-form'>
	<div>
		<input type='hidden' value='${amount}' name='amount' /> 
		<span>Precio: ${amount} euros.</span>
	</div>
	<br>
	<div>
			<script src="https://checkout.stripe.com/checkout.js"
			class="stripe-button" data-key="${stripePublicKey}"
			data-name="The NosoSailing"
			data-description="Online course about integrating Stripe"
			data-image="https://stripe.com/img/documentation/checkout/marketplace.png"
			data-locale="auto" data-currency="eur">
			
			</script>
			<script type="text/javascript">document.querySelector("#checkout-form > div:nth-child(3) > button > span").innerHTML="Pagar con tarjeta";</script>
	</div>
	<br>

	</form>
		<div>
	<a href="/test"><button class="btn btn-md btn-default">Pagar con Paypal</button></a>
	</div>
	
	</div>
</div>
	
	
</petclinic:layout>