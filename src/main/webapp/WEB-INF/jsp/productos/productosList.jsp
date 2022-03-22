<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<petclinic:layout pageName="productosList">


<div class = "row">
<div class = "col-md-2">
<h2>Productos</h2> </div>
<div class = "col-md-7">
<input id="busqueda" type="text" class="form-control" placeholder="Busqueda de productos..."> </div>
<div class = "col-md-1"><button onClick="Buscar()">Buscar</button>
</div></div>
<script>
		function Buscar(){
		  var text = $("#busqueda").val();
		  location.href = 'http://localhost:8080/productos/'+text;
		}

</script>


	<div class = "row">
        <c:forEach items="${productos}" var="producto">
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
                    <c:out value="${producto.precio}"/>
                    &#8364, marca 
                </font>
                <font size="+1">
                    <c:out value="${producto.marca}"/>
                </font>
			</div>
        </c:forEach>
	</div>
	
</petclinic:layout>