<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>

<petclinic:layout pageName="users">
	<h2>
		<c:if test="${isNew}">Nuevo </c:if>
		Usuario
	</h2>
	<form:form modelAttribute="user" class="form-horizontal"
		id="add-user-form">
		<petclinic:inputField label="First Name" name="firstName" />
            <petclinic:inputField label="Last Name" name="lastName" />
            <c:choose>
			<c:when test="${isNew}">
            <petclinic:inputField label="Username" name="username" />
            </c:when>
            </c:choose>
            <petclinic:inputField label="Password" name="password" />
            <input type="text" id="tienda" name="tienda" class="hidden"
					value="${tiendaId}"><br>
			<c:choose>
			<c:when test="${isNew}">
				<form:form modelAttribute="authorities" class="form-horizontal"
					id="add-user-form">

					<div id="authority">
						<h3>Rol:</h3>
						<div class="radio-inline">
							<label> <input type="radio" name="authority" id="cliente"
								value="cliente" checked> CLIENTE
							</label>
						</div>
						<div class="radio-inline">
							<label> <input type="radio" name="authority"
								id="vendedor" value="vendedor"> VENDEDOR
							</label>
						</div>
					</div>
					</form:form>
			</c:when>
		</c:choose>
		<div class="form-group">
			<div class="col-sm-12" id="usuario-boton">
				<c:choose>
					<c:when test="${isNew}">
						<button class="btn btn-default" type="submit">Crear
							usuario</button>
					</c:when>
					<c:otherwise>
						<button class="btn btn-default" type="submit">Actualizar
							usuario</button>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</form:form>
</petclinic:layout>