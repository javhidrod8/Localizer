<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>

<petclinic:layout pageName="cancel">

	<h2>Pago no realizado</h2>
	<spring:url value="/resources/images/tiendas.png" htmlEscape="true"
		var="tiendasImagen" />
	<img class="tiendas img-responsive" src="${tiendasImagen}" />

</petclinic:layout>