<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<petclinic:layout pageName="reservas">

	<h2>Reserva</h2>
	
	<c:if test="${reserva['new']}">
	
		<form:form modelAttribute="reserva" class="form-horizontal"
			id="add-reserva-form">
			<div class="container">
				<div class="form-group has-feedback">
					
					 <petclinic:inputField label="Cantidad" name="cantidad" />
					
					 <petclinic:inputField label="Comentario" name="comentario" />
					
					    <input type="text" id="tienda" name="tienda" class="hidden"
						value="${tiendaId}">
						<input type="text" id="user" name="user" class="hidden"
						value="${username}">
						<input type="text" id="producto" name="producto" class="hidden"
						value="${productoId}">
						<input type="text" id="reserva" name="estado" class="hidden"
						value="${estado}">
					<button class="btn btn-default" type="submit">Realizar Reserva</button>
					
				</div>
			</div>
		</form:form>
	
	</c:if>
	
	<c:if test="${verificar}">
	
		<form:form modelAttribute="reserva" class="form-horizontal"
			id="add-reserva-form">
			<div class="container">
				<div class="form-group has-feedback">
					
					<input type="text" id="cantidad" name="cantidad" readonly
						value="${cantidad}">
					 <petclinic:inputField label="Comentario" name="comentario" />
					
					    <input type="text" id="tienda" name="tienda" class="hidden"
						value="${tiendaId}">
						<input type="text" id="user" name="user" class="hidden"
						value="${username}">
						<input type="text" id="producto" name="producto" class="hidden"
						value="${productoId}">
						<input type="text" id="reserva" name="estado" class="hidden"
						value="${estado}">
					<button class="btn btn-default" type="submit">Verificar Reserva</button>
					
				</div>
			</div>
		</form:form>
	
	</c:if>
	
	<c:if test="${cancelar}">
	
		<form:form modelAttribute="reserva" class="form-horizontal"
			id="add-reserva-form">
			<div class="container">
				<div class="form-group has-feedback">
					
					 <petclinic:inputField label="Comentario" name="comentario" />
					
					    <input type="text" id="tienda" name="tienda" class="hidden"
						value="${tiendaId}">
						<input type="text" id="user" name="user" class="hidden"
						value="${username}">
						<input type="text" id="producto" name="producto" class="hidden"
						value="${productoId}">
						<input type="text" id="reserva" name="estado" class="hidden"
						value="${estado}">
					<button class="btn btn-default" type="submit">Cancelar Reserva</button>
					
				</div>
			</div>
		</form:form>
	
	</c:if>
	
</petclinic:layout>

