<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<petclinic:layout pageName="productos">

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
				<%-- <c:if test="${producto.verificado==true}">
					<i class="fa fa-check" style="margin-left: 2%"></i>
				</c:if> --%>
			</h2>
			<c:if test="${not empty producto.intolerancia  }">
			Intolerancias: <c:forEach items="${producto.intolerancia}" var="intolerancia">
			<c:out	value="${intolerancia.nombre} " />
			</c:forEach>
			</c:if>
			<c:if test="${not empty producto.preferencia}">
			</br></br>Preferencias: <c:out	value="${producto.preferencia} " />
			</c:if></br></br>
			<spring:url value="/tienda/{tiendaId}" var="tiendaUrl">
				<spring:param name="tiendaId" value="${producto.tienda.id}" />
			</spring:url>
			<a href="${fn:escapeXml(tiendaUrl)}">
				<button>Ver tienda</button>
			</a>
			<button>Reservar</button> </br></br>
			
			<c:if test="${producto.estado != 'RECHAZADO'}">
			<c:if test="${producto.estado != 'ACEPTADO' }">
			<sec:authorize access="hasAuthority('nutricionista')">
			<spring:url value="/producto/{productoId}/edit" var="productoUrl">
					<spring:param name="productoId" value="${producto.id}" />
			</spring:url>
			<a href="${fn:escapeXml(productoUrl)}">
				<button>Validar producto</button>
			</a>
			<spring:url value="/producto/{productoId}/rechazar" var="productoUrl">
					<spring:param name="productoId" value="${producto.id}" />
			</spring:url>
			<a href="${fn:escapeXml(productoUrl)}">
				<button>Rechazar producto</button>
			</a>
			</sec:authorize>
			</c:if></c:if>
		</div>
		
	</div></br></br>
<div class="row">
<div class="col-md-12">

			<h3>Productos de esta tienda:</h3>
			<br> <br>
			<c:forEach items="${producto.tienda.productos}" var="productos">
				<div class="col-md-3"><img height="100px" width=auto
					src="<c:out value="${productos.imagen}"/>" style="margin: 0px 50px" />
				</br>
				</br>
				<c:out value="${productos.nombre}" /> marca <c:out
					value="${producto.marca}" /></br> 
     				<c:out value="${productos.precio}" /> &#8364<%-- <c:if
					test="${productos.verificado==true}">
					<i class="fa fa-check" style="margin-left: 2%"></i>
				</c:if> --%>
				</h2>
				</br>
				<button>Reservar</button>
				
				</br>
				</br>
				
					
				</div>
			</c:forEach>
		</div></div>



</petclinic:layout>