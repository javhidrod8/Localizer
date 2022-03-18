<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<petclinic:layout pageName="productosList">

<h2>Productos</h2>
	<div class = "row">
	<div class = "col-md-3"> FILTRO</div>
		<div class = "col-md-9">
        <c:forEach items="${productos}" var="producto">
      
        	<div class = "col-md-5">
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
			
			<c:forEach var="item" items="${producto.intolerancia}">
  			<c:if test="${item.nombre == 'GLUTEN'}">
    		<script>
			//PENSAR ALGO PARA ETIQUETAR CADA PRODUCTO

			</script>
  			</c:if>
</c:forEach>

        </c:forEach>
	</div></div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	
	
	
</petclinic:layout>