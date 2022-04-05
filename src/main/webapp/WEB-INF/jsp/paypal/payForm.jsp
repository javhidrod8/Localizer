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
	<div class="row">
		<div class="col-75">
			<div class="container">
				<form method="post" action="/pay">
					<div class="col-md-12">
						<h3>Pago por paypal</h3>
						<div class="col-md-12">
							<label for="price" class="hidden">Total</label> <input type="text" id="price"
								name="price" value="12" readonly class="hidden">
						</div>
						<div class="col-md-12">
							<label for="currency" class="hidden">Currency</label> <input type="text"
								id="currency" name="currency" placeholder="Enter Currency" value="EUR" readonly class="hidden">
						</div>
						<div class="col-md-12">
							<label for="method" class="hidden">Payment Method</label> <input type="text"
								id="method" name="method" placeholder="Paypal" value="Paypal" readonly class="hidden">
						</div>
						<div class="col-md-12">
							<label for="intent" class="hidden"> Intent</label> <input type="text" id="intent"
								name="intent" value="sale" readonly class="hidden">
						</div>
						<div class="col-md-12">
							<label for="description" class="hidden">Payment Description</label> <input
								type="text" id="description" name="description"
								placeholder="Pago por suscripción" value="Pago por suscripción" readonly class="hidden">
						</div>

					</div>
					<p>
					Pulse el siguiente boton si no carga automaticamente Paypal.
					</p>
					<input type="submit" value="Pagar con Paypal" class="btn btn-default btn-md" id="pago-paypal">
				</form>
			</div>
		</div>
	</div>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>$("#pago-paypal").click()</script>
</petclinic:layout>