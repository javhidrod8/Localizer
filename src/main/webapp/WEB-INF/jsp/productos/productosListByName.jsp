<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<petclinic:layout pageName="productosList">
 <h2>Productos</h2>

    <table id="productosTable" class="table table-striped">
        <thead>
        <tr>
            <th style="width: 150px;">Nombre</th>
            <th style="width: 150px;">Imagen</th>
            <th style="width: 200px;">Precio</th>
            <th style="width: 120px">Marca</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${productos}" var="producto">
            <tr>
                <td>
                    <spring:url value="/productos/{productoId}" var="productoUrl">
                        <spring:param name="productoId" value="${producto.id}"/>
                    </spring:url>
                    <a href="${fn:escapeXml(productoUrl)}"><c:out value="${producto.nombre}"/></a>
                </td>
                <td>
                    <c:out value="${producto.imagen}"/>
                </td>
                <td>
                    <c:out value="${producto.precio}"/>
                </td>
                <td>
                    <c:out value="${producto.marca}"/>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</petclinic:layout>