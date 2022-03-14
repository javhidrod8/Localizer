<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:layout pageName="tiendas">

	<style>
	.image {
	float: left;
	margin: 0 150px 15px 0;
	max-width: 400px;
	height: auto;
	}
	</style>

	<img src="https://economipedia.com/wp-content/uploads/test-de-estr%C3%A9s.png" class="image">
	<h1><c:out value="${tienda.nombre}"/></h1>
	<br>
	<p><b>Localización : </b></p>
	<p><c:out value="${tienda.calle}"/></p>
	<br>
	<br>
	<p><b>Horarios : </b></p>
	<p>Horarios</p>




    <table class="table table-striped">
    </table>
    
    <h2>Productos :</h2>
	<div class = "row">
        <c:forEach items="${tienda.productos}" var="producto">
        	<div class = "col-md-3">
        		<br><br>
        		<spring:url value="/productos/{productoId}" var="productoUrl">
        			<spring:param name="productoId" value="${producto.id}"/>
        		</spring:url>
        		<a href="${fn:escapeXml(productoUrl)}">
        			<img height="200px" width="auto" src="<c:out value="${producto.imagen}"/>" style="margin:0px 50px"/>
        		</a>
        		<br><br>
                <font size="+1">
                    <spring:url value="/productos/{productoId}" var="productoUrl">
                        <spring:param name="productoId" value="${producto.id}"/>
                    </spring:url>
                    <a href="${fn:escapeXml(productoUrl)}">
                    	<c:out value="${producto.nombre}"/>
					</a>
                </font>
                <br>
                <font size="+1">
                    <c:out value="${producto.precio}"/>€
                </font>
                <font size="+1">
                    <input type="button" value="Reservar">
                </font>
			</div>
        </c:forEach>
	</div>

</petclinic:layout>
