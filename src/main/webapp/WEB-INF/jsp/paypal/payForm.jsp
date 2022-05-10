<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<petclinic:layout pageName="pago-tarjeta">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<spring:url value="/resources/images/localizer-logo.png" var="imgLogoUrl"></spring:url>

<form method="post" action="/pay">
	<input type="number" id="price" name="price" value="12" readonly class="hidden">
	<input type="text" id="currency" name="currency" value="EUR" readonly class="hidden">
	<input type="text" id="method" name="method"  value="Paypal" readonly class="hidden">
	<input type="text" id="intent"  name="intent" value="sale" readonly class="hidden">
	<input type="text" id="description" name="description" value="Pago por suscripción" readonly class="hidden">

	<div class="row d-flex justify-content-center py-5">
      <div class="col col-xl-10">
        <div class="card" style="border-radius: 1rem;">
          <div class="row g-0">
            <div class="col-md-12 col-lg-12 d-flex align-items-center">
              <div class="card-body p-4 p-lg-5 text-black">
					<div class="d-flex align-items-center justify-content-center">
						<img class="mb-4" src="${fn:escapeXml(imgLogoUrl)}" width="100" height="90">
					</div>
					<div class="d-flex align-items-center justify-content-center">
	                   <h1 class="h3 mb-3 fw-normal">Pago con PayPal</h1>
	                </div>
                	<div class="row d-flex align-items-center justify-content-center">
						<div class="my-2">
					        <h4>Pulse el siguiente boton si no carga automaticamente Paypal.</h4>
						</div>
						<div id="botones" class="d-flex gap-2 my-2">     
							<button type="submit" value="Pagar con Paypal" class="btn btn-lg btn-primary w-100" id="pago-paypal">
							<i class="fa-brands fa-cc-paypal"></i> Pagar con Paypal</button>
						</div>
                  	</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
</form> 
<script>$("#pago-paypal").click()</script>
</petclinic:layout>