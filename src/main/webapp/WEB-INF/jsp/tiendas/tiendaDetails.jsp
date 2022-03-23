<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:layout pageName="tiendas">

	<div class="row">
		<div class="col-md-6">
			<img src="<c:out value="${tienda.imagen}"/>" class="img-responsive" alt="Responsive image"/>
		</div>
		<div class="col-md-6">
			<h1><strong><c:out value="${tienda.nombre}"/></strong></h1>
			<br>
			<br>
			<dl>
				<dt>Localizaci&oacuten: </dt>
				<dd><c:out value="${tienda.calle}"/></dd>
				<br>
				<br>
				<dt>Horarios: </dt>
				<dd><c:out value="${tienda.horario}"/></dd>
			</dl>
		</div>
	</div>

    
    <h2>Productos:</h2>
	<div class = "row">
        <c:forEach items="${tienda.productos}" var="producto">
        	<div class = "col-md-3">
        		<br><br>
        		<spring:url value="/producto/{productoId}" var="productoUrl">
        			<spring:param name="productoId" value="${producto.id}"/>
        		</spring:url>
        		<div href="${fn:escapeXml(productoUrl)}">
        			<img height="200px" width="auto" src="<c:out value="${producto.imagen}"/>" style="margin:0px 50px"/>
        		</div>
        		<br><br>
                <font size="+1">
                    <spring:url value="/producto/{productoId}" var="productoUrl">
                        <spring:param name="productoId" value="${producto.id}"/>
                    </spring:url>
                    <a href="${fn:escapeXml(productoUrl)}">
                    	<c:out value="${producto.nombre}"/>
					</a>
                </font>
                <br>
                <font size="+1">
                    <c:out value="${producto.precio}"/>&#8364
                </font>
                <font size="+1">
                    <button type="button" class="btn btn-default btn-sm">Reservar</button>
                </font>
			</div>
        </c:forEach>
	</div>

</petclinic:layout>
