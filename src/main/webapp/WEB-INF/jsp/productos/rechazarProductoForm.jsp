<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<petclinic:layout pageName="productos">

	
    <form:form modelAttribute="producto" class="form-horizontal" id="edit-producto-form">
	
	<div class="row">
	<div class="col-sm-2">
		</div>
		<div class="col-sm-3">
			<img height="200px" width=auto
				src="<c:out value="${producto.imagen}"/>" style="margin: 0px 50px" />
		</div>
		<div class="col-sm-4" style="margin-left: 2%">
			<b><c:out value="${producto.nombre}" /></b><br> <br>
			<h2>
				<c:out value="${producto.precio}" />
				&#8364
			</h2>
			<c:if test="${not empty producto.intolerancia  }">
			Intolerancias: <c:forEach items="${producto.intolerancia}" var="intolerancia">
			<c:out	value="${intolerancia.nombre} " />
			</c:forEach>
			</c:if>
			<c:if test="${not empty producto.preferencia}">
			</br></br>Preferencias: <c:out	value="${producto.preferencia} " />
			</c:if>
			<spring:url value="/productos/verificar" var="productoUrl">
			</spring:url>
			
				<button type="submit">Rechazar Producto</button>

			

		</div>
		
	</div>
</form:form>



</petclinic:layout>