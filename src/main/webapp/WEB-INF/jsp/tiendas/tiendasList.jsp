<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<petclinic:layout pageName="tiendasList">

	<h2>Tiendas</h2>
	<div class="row">
			<div class="col-sm-11">
				<input id="busqueda" type="text" class="form-control"
					placeholder="Busqueda de tiendas por Código postal...">
			</div>
			<div class="col-sm-1">
				<button class="btn btn-default" onClick="Buscar()">Buscar</button>
			</div>

	</div></br>

	<script>
		function Buscar(){
		  var text = $("#busquedaCP").val();
		  location.href = "/tiendas/"+text;
		}
</script>

	<div class="row">
		<c:forEach items="${tiendas}" var="tienda">
		<div class="col-md-3">
			<div >
				<spring:url value="/tienda/{tiendaId}" var="tiendaUrl">
				<spring:param name="tiendaId" value="${tienda.id}" />
				</spring:url>
				<a href="${fn:escapeXml(tiendaUrl)}">
				<img src="<c:out value="${tienda.imagen}"/>" class="img-responsive" alt="Responsive image"/></a>
				<a href="${fn:escapeXml(tiendaUrl)}"><c:out value="${tienda.nombre}"/></a>
				
			</div>

		</div></c:forEach>
	</div>
	
</petclinic:layout>
