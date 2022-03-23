<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>

<petclinic:layout pageName="error">

	<h2>Su petici�n no pudo ser encontrada</h2>
	<spring:url value="/resources/images/tiendas.png" htmlEscape="true"
		var="tiendasImagen" />
	<img class="tiendas img-responsive" src="${tiendasImagen}" />

</petclinic:layout>