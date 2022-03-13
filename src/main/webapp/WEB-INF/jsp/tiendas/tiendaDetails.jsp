<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:layout pageName="tiendas">

    <h2>Información de tienda</h2>


    <table class="table table-striped">
        <tr>
            <th>Nombre</th>
            <td><b><c:out value="${tienda.nombre}"/></b></td>
        </tr>
    </table>

    <table class="table table-striped">
        <c:forEach var="producto" items="${tienda.productos}">

            <tr>
                <td valign="top">
                    <dl class="dl-horizontal">
                        <dt>Name</dt>
                        <dd><c:out value="${producto.nombre}"/></dd>
                    </dl>
                </td>
              </tr>

        </c:forEach>
    </table>

</petclinic:layout>