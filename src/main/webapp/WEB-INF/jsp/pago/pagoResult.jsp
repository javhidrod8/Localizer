<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<meta charset="ISO-8859-1">
<petclinic:layout pageName="pago-tarjeta">
<h3>Resultado</h3>

<c:if test="${error}"> <h3 style="color: red;">${error}</h3></c:if>
    <c:if test="${!error}">
        <div>
        <h3 style='color: green;'>Pago realizado con exito</h3>
    </c:if>
    <a href='/tiendas/new'><button id="pago" class="btn-default btn btn-md">Crear mi tienda</button></a>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>$("#pago").click()</script>
</petclinic:layout>