<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:layout pageName="reservas">

	<h2>Historial de reservas</h2>
	
	<table id="reservaTable" class="table table-striped">
        <thead>
        <tr>
            <th>Imagen</th>
            <th>Producto</th>
            <th>Precio</th>
            <th>Marca</th>
            <th>Cantidad</th>
            <th>Tienda</th>
            <th>Comentario</th>
            <th>Acción</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach items="${reservas}" var="reserva">
            <tr>
          	<td>

		        		<spring:url value="/productos/{productoId}" var="productoUrl">
		        			<spring:param name="productoId" value="${reserva.producto.id}"/>
		        		</spring:url>
		        		<a href="${fn:escapeXml(productoUrl)}">
		        			<img height="30px" width="auto" src="<c:out value="${reserva.producto.imagen}"/>" style="margin:0px 50px"/>
		        		</a>
</td>
		   <td>

		                    <spring:url value="/productos/{productoId}" var="productoUrl">
		                        <spring:param name="productoId" value="${reserva.producto.id}"/>
		                    </spring:url>
		                    <a href="${fn:escapeXml(productoUrl)}">
		                    	<c:out value="${reserva.producto.nombre}"/>
							</a>
		                

                </td>
                
           <td>

		                    <c:out value="${reserva.producto.precio}"/>&#8364


                </td>
                
           <td>

		                    <c:out value="${reserva.producto.marca}"/>


                </td>
                
                
                
                <td>
                    <c:out value="${reserva.cantidad}"/>
                </td>
               <td>
                    <c:out value="${reserva.tienda.nombre}"/>
                </td>
               <td>
                    <c:out value="${reserva.comentario}"/>
                </td>

                
                
                
                <td>
                	<spring:url value="/reserva/{reservaId}/delete" var="deleteUrl">
		            	<spring:param name="reservaId" value="${reserva.id}"/>
		            </spring:url>
		            <a href="${fn:escapeXml(deleteUrl)}">
		            	<button class="btn btn-default" type="submit">Eliminar</button>
					</a>
                </td>
                
                
            </tr>
            
        </c:forEach>
        </tbody>
    </table>

</petclinic:layout>