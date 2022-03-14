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
            <th style="width: 100px;">Nombre</th>
            <th style="width: 150px;">Imagen</th>
            <th style="width: 100px;">Precio (en euros)</th>
            <th style="width: 50px">Marca</th>
            <th style="width: 200px">Descripción</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${productos}" var="producto">
            <tr>
                <td>
                <font size="+1">
                    <spring:url value="/productos/{productoId}" var="productoUrl">
                        <spring:param name="productoId" value="${producto.id}"/>
                    </spring:url>
                    <a href="${fn:escapeXml(productoUrl)}"><c:out value="${producto.nombre}"/></a>
                </font>
                </td>
                <td>
                    <img height="200px" width="auto" src="<c:out value="${producto.imagen}"/>"/>
                </td>
                <td>
                <font size="+1">
                    <c:out value="${producto.precio}"/>
                </font>
                </td>
                <td>
                <font size="+1">
                    <c:out value="${producto.marca}"/>
                </font>
                </td>
                <td>
                    <c:out value="${producto.descripcion}"/>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</petclinic:layout>