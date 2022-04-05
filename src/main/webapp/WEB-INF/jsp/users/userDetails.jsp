<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:layout pageName="users">

    <h2>Informacion del usuario</h2>

	<table class="table table-striped">
        <tr>
            <th>Name</th>
            <td><b><c:out value="${user.firstName} ${user.lastName}"/></b></td>
        </tr>
        <tr>
            <th>Username</th>
            <td><c:out value="${user.username}"/></td>
        </tr>
        <tr>
            <th>Password</th>
            <td><c:out value="${user.password}"/></td>
        </tr>
    </table>

    <spring:url value="/users/{username}/edit" var="editUrl">
        <spring:param name="username" value="${user.username}"/>
    </spring:url>
    <a href="${fn:escapeXml(editUrl)}" class="btn btn-default">Editar usuario</a>
</petclinic:layout>