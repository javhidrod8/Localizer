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
		<div class="form-group has-feedback">
			<div id="nombre-usuario" class="col-md-12">
				<label for="nombre">
					<h3>Nombre:</h3>
				</label> <input required type="text" id="nombre" name="firstName"
					class="form-control" value="${user.firstName }"><br>
			</div>
			<div id="apellidos-usuario" class="col-md-12">
				<label for="apellidos">
					<h3>Apellidos:</h3>
				</label> <input required type="text" id="apellidos" name="lastName"
					class="form-control" value="${user.lastName }"><br>
			</div>
				<label for="username">
				</label> <input required type="text" id="user" name="username" class="hidden" 
					value="${user.username}"><br>
			<div id="password-usuario" class="col-md-12">
				<label for="password">
					<h3>Contraseña:</h3>
				</label> <input required type="password" id="password" name="password"
					class="form-control" value="${user.password}"><br>
				<c:if test="${!isNew}">
					<input type="text" id="tiendaId" name="tiendaId"
					class="hidden" value="${tiendaId}" readonly>
				</c:if>
			</div>
			<input type="text" id="pagado" name="pagado"
					class="hidden" value="${user.pagado}" readonly>
		</div>

		<form:form modelAttribute="authorities" class="form-horizontal"
			id="add-user-form">
			<c:choose>
				<c:when test="${isNew}">
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
				</c:when>
				<c:otherwise>
					<div id="authority">
						<c:if test="${auth == 'cliente'}">
						<h3>Rol:</h3>
							<div class="radio-inline">
								<label> <input type="radio" name="authority"
									id="cliente" value="cliente" checked> CLIENTE
								</label>
							</div>
						</c:if>
						<c:if test="${auth == 'vendedor'}">
							<div class="radio-inline">
								<label> <input type="radio" name="authority"
									id="vendedor" value="vendedor" checked> VENDEDOR
								</label>
							</div>
						</c:if>
					</div>
				</c:otherwise>
			</c:choose>
			<c:if test="${isNew}">
			</br>
			<div>
			<a href="/terminos"><b>Aquí</b></a> encontrará toda la información relativa a los términos y condiciones de uso, deberá aceptarlos para poder registrarse.
			</br>
			<input required type="checkbox" id="terminos" value="Acepto">
			<label>Acepto los términos y condiciones de uso</label> 
			</div></br>
			</c:if>
			<div class="form-group">
				<div class="col-sm-12" id="usuario-boton">
					<c:choose>
						<c:when test="${isNew}">
							<button class="btn btn-default" type="submit">Añadir
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
	</form:form>
</petclinic:layout>