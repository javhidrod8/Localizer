<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>

<petclinic:layout pageName="reservas">

	<h2>Historial de reservas</h2>
	
	<table id="reservaTable" class="table table-striped">
        <thead>
        </thead>
        <tbody>
        <c:forEach items="${reservas}" var="reserva">
            <tr>
                <td>
        <div class="row">
		<div class="col-md-4">
		<spring:url value="/producto/{productoId}" var="productoUrl">
      			<spring:param name="productoId" value="${reserva.producto.id}"/>
  		</spring:url>
    	<a href="${fn:escapeXml(productoUrl)}">
			<img height="200px" width=auto src="<c:out value="${reserva.producto.imagen}"/>" style="margin: 0px 50px" />
		</a>
		</div>
		<div class="col-md-4">
			<b><c:out value="${reserva.producto.nombre}" /></b><br> <br>
			<h2>
				<c:out value="${reserva.producto.precio}" />
				&#8364
				<c:if test="${reserva.producto.estado=='ACEPTADO'}">
					<i class="fa fa-check" style="margin-left: 2%"></i>
				</c:if>
				<c:if test="${reserva.producto.estado=='RECHAZADO'}">
					<i class="fa-solid fa-x" style="margin-left: 2%"></i>
				</c:if>
			</h2>
			<c:if test="${not empty reserva.producto.intolerancia  }">
			Intolerancias: <c:forEach items="${reserva.producto.intolerancia}" var="intolerancia">
			<c:out	value="${intolerancia.nombre} " />
			</c:forEach>
			</c:if>
			<c:if test="${not empty reserva.producto.preferencia}">
			</br></br>Preferencias: <c:out	value="${reserva.producto.preferencia} " />
			</c:if></br></br>
			<spring:url value="/tienda/{tiendaId}" var="tiendaUrl">
				<spring:param name="tiendaId" value="${reserva.producto.tienda.id}" />
			</spring:url>
			<a href="${fn:escapeXml(tiendaUrl)}">
				<button class='btn btn-default btn-sm'>Ver tienda</button>
			</a>
		</div>
		
       	<div class="col-md-4">
       		<h2>Datos de la Reserva:</h1>
       		<p>Cantidad Reservada: <c:out value="${reserva.cantidad}"> </c:out></h2>
       		<p>Precio Total: <c:out value="${reserva.precio_total}"> </c:out></h2>
       		<p>Comentario: <c:out value="${reserva.comentario}"> </c:out></h2>
       		<p>Estado de la reserva: <c:out value="${reserva.estado}"> </c:out></h2>
            <sec:authorize access="hasAuthority('cliente')"> 
            	<c:if test="${reserva.estado=='PENDIENTE'}">
         		<br>
				<spring:url value="/users/{username}/reservas/{reservaId}/cancelar" var="cancelarUrl">
					<spring:param name="username" value="${reserva.user.username}" />
					<spring:param name="reservaId" value="${reserva.id}" />
					</spring:url>
				<a href="${fn:escapeXml(cancelarUrl)}">
					<button class='btn btn-default btn-sm'>Cancelar Reserva</button>
				</a>
				</c:if>
			</sec:authorize>
			
			 <sec:authorize access="hasAuthority('vendedor')">
			 <c:if test="${mitienda}"> 
			 	<c:if test="${reserva.estado=='PENDIENTE'}">
			 	<br>
				<spring:url value="/tienda/{tiendaId}/reservas/{reservaId}/verificar/" var="verificarUrl">
					<spring:param name="tiendaId" value="${reserva.tienda.id}" />
					<spring:param name="reservaId" value="${reserva.id}" />
				</spring:url>
				<a href="${fn:escapeXml(verificarUrl)}">
					<button class='btn btn-default btn-sm'>Verificar Reserva</button>
				</a>
<%-- 				<spring:url value="/tienda/{tiendaId}/reservas/{reservaId}/verificar/1" var="aceptarUrl"> --%>
<%-- 					<spring:param name="tiendaId" value="${reserva.tienda.id}" /> --%>
<%-- 					<spring:param name="reservaId" value="${reserva.id}" /> --%>
<%-- 				</spring:url> --%>
<%-- 				<a href="${fn:escapeXml(aceptarUrl)}"> --%>
<!-- 					<button class='btn btn-default btn-sm'>Aceptar Reserva</button> -->
<!-- 				</a> -->
<%-- 				<spring:url value="/tienda/{tiendaId}/reservas/{reservaId}/verificar/2" var="cancelarUrl"> --%>
<%-- 					<spring:param name="tiendaId" value="${reserva.tienda.id}" /> --%>
<%-- 					<spring:param name="reservaId" value="${reserva.id}" /> --%>
<%-- 				</spring:url> --%>
<%-- 				<a href="${fn:escapeXml(cancelarUrl)}"> --%>
<!-- 					<button class='btn btn-default btn-sm'>Rechazar Reserva</button> -->
<!-- 				</a> -->
				</c:if>
				</c:if>
			</sec:authorize>
					</div>
					
						</div></br></br>
                </td>
                
                
            </tr>
        </c:forEach>
        </tbody>
    </table>
</petclinic:layout>