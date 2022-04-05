<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<petclinic:layout pageName="reservas">

	<h2>Reserva</h2>
	<script>
	reserva = "${reserva}";
	productoId="${productoId}";
	auth="${auth}";
	console.log(reserva);
	console.log(productoId);
	console.log(auth);
	</script>
	<form:form modelAttribute="reserva" class="form-horizontal"
		id="add-reserva-form">
		<div class="container">
			<div class="form-group has-feedback">
				
				<div id="cantidad-reserva col-md-12">
					<label id="cantidad2" for="cantidad">
						<h3>Cantidad:</h3>
					</label> <input required type="text" id="cantidad" name="cantidad" class="form-control" value="${reserva.cantidad}"><br>
				</div>
				
				<div id="comentario-reserva col-md-12">
					<label id="comentario2" for="comentario">
						<h3>Comentario:</h3>
					</label> <input required type="text" id="comentario" name="comentario" class="form-control" value="${reserva.comentario}"><br>
				</div>
				
				<div id="tienda-reserva col-md-12">
					<label id="tienda2" for="tienda">
						<h3>Tienda:</h3>
					</label> <input required type="text" id="tienda" name="tienda" class="form-control" value="${tiendaId}"><br>
				</div>
				
				<div id="user-reserva col-md-12">
					<label id="user2" for="user">
						<h3>User:</h3>
					</label> <input required type="text" id="user" name="user" class="form-control" value="${reserva.user}"><br>
				</div>
				
				<div id="producto-reserva col-md-12">
					<label id="producto2" for="producto">
						<h3>Producto:</h3>
					</label> <input required type="text" id="producto" name="producto" class="form-control" value="${productoId}"><br>
				</div>
				<button class="btn btn-default" type="submit">Realizar Reserva</button>
				
			</div>
		</div>
	</form:form>
	
</petclinic:layout>

