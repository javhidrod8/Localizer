<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:layout pageName="tiendas">
	<style>
	.image {
	float: left;
	}
	</style>
	<img height="400px" width=auto
		src="<c:out value="${tienda.imagen}"/>" style="margin: 0px 50px" class="image" />
	<h1><c:out value="${tienda.nombre}"/></h1>
	<br>
	<p><b>Localizaci&oacuten: </b></p>
	<p><c:out value="${tienda.calle}"/></p>
	<br>
	<br>
	<p><b>Horarios: </b></p>
	<p><c:out value="${tienda.horario}"/></p>


    <table class="table table-striped">
    </table>
    
    <h2>Productos:</h2>
	<div class = "row">
        <c:forEach items="${tienda.productos}" var="producto">
        	<div class = "col-md-3">
        		<br><br>
        		<spring:url value="/producto/{productoId}" var="productoUrl">
        			<spring:param name="productoId" value="${producto.id}"/>
        		</spring:url>
        		<a href="${fn:escapeXml(productoUrl)}">
        			<img height="200px" width="auto" src="<c:out value="${producto.imagen}"/>" style="margin:0px 50px"/>
        		</a>
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
                    <input type="button" value="Reservar">
                </font>
			</div>
        </c:forEach>
	</div>

</petclinic:layout>
