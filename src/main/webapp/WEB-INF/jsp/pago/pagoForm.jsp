<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<meta charset="ISO-8859-1">
<petclinic:layout pageName="pago-tarjeta">
<spring:url value="/resources/images/localizer-logo.png" htmlEscape="true" var="tiendasImagen"></spring:url>
<spring:url value="/resources/images/localizer-logo.png" var="imgLogoUrl"></spring:url>
<form action='/charge' method='POST' id='checkout-form'>
	<input type='hidden' value='${amount * 100}' name='amount' />
    <div class="row d-flex justify-content-center py-5">
      <div class="col col-xl-10">
        <div class="card" style="border-radius: 1rem;">
          <div class="row g-0">
            <div class="col-md-12 col-lg-12 d-flex align-items-center">
              <div class="card-body p-4 p-lg-5 text-black">

		<div class="d-flex align-items-center justify-content-center">
					<img class="mb-4" src="${fn:escapeXml(imgLogoUrl)}" alt=""
				width="100" height="90">
		</div>
				<div class="d-flex align-items-center justify-content-center">

                   <h1 class="h3 mb-3 fw-normal">Realizar pago</h1>
                </div>
                <div class="row d-flex align-items-center justify-content-center">
					<div class="my-2">
						<h4>Precio por suscripción mensual para Tienda:</h4>
						<h3>${amount} euros</h3>
					</div>
					<div id="botones" class="d-flex gap-2 my-2"> 
						<a href="/test" class="btn btn-lg btn-primary w-100"><i class="fa-brands fa-cc-paypal"></i> Pago con Paypal</a>    
						<script src="https://checkout.stripe.com/checkout.js" class="stripe-button" data-key="${stripePublicKey}"
							    data-name="Localizer" data-description="Suscripción mensual a Localizer" data-image="${tiendasImagen}"
							    data-locale="auto" data-currency="eur">
						</script>
					</div>
                  </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
</form>
<script type="text/javascript">
	var botonStripe = document.getElementsByClassName('stripe-button-el')[0];
	botonStripe.innerHTML = "<i class='fa-solid fa-credit-card'></i> Pago con Tarjeta";
	botonStripe.className ="btn btn-lg btn-primary w-100";
</script>
</petclinic:layout>