<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:layout pageName="productos">

    <h2>Información de producto</h2>


    <table class="table table-striped">
        <tr>
            <th>Nombre</th>
            <td><b><c:out value="${producto.nombre}"/></b></td>
        </tr>
        <tr>
            <th>Marca</th>
            <td><c:out value="${producto.marca}"/></td>
        </tr>
        <tr>
            <th>Descripción</th>
            <td><c:out value="${producto.descripcion}"/></td>
        </tr>
    </table>

<%--     <table class="table table-striped">
        <c:forEach var="intolerancia" items="${producto.intolerancia}">

            <tr>
                <td valign="top">
                    <dl class="dl-horizontal">
                        <dt>Name</dt>
                        <dd><c:out value="${intolerancia.nombre}"/></dd>
                    </dl>
                </td>
              </tr>

        </c:forEach>
    </table> --%>

</petclinic:layout>