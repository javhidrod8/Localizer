<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<petclinic:layout pageName="reservas">

	<h1>Reserva</h1><br>
	<!-- Datos del producto -->
		<div class="row">
				<div class="col-md-4">
					<spring:url value="/producto/{productoId}" var="productoUrl">
      					<spring:param name="productoId" value="${reserva.producto.id}"/>
  					</spring:url>
    				<a href="${fn:escapeXml(productoUrl)}">
						<img height="200px" width=auto src="<c:out value="${reserva.producto.imagen}"/>" style="margin: 0px 50px" />
					</a>
				</div>
				<div class="col-md-4">
					<h2><c:out value="${reserva.producto.nombre}" /></h2>
					<h2>
						<c:out value="${reserva.producto.precio}" />
						&#8364
					<c:if test="${reserva.producto.estado=='ACEPTADO'}">
					<i class="fa fa-check" style="margin-left: 2%"></i>
				</c:if>
				<c:if test="${reserva.producto.estado=='RECHAZADO'}">
					<i class="fa-solid fa-x" style="margin-left: 2%"></i>
				</c:if>
				<c:if test="${not empty reserva.producto.descripcion}">
				<h4>Descripción: ${reserva.producto.descripcion }</h4>
				</c:if>
				<c:if test="${not empty reserva.producto.marca}">
				<h4>Marca: ${reserva.producto.marca }</h4>
				</c:if>
			</h2>
			<c:if test="${not empty reserva.producto.intolerancia  }">
			<h4>Intolerancias: </h4> <c:forEach items="${reserva.producto.intolerancia}" var="intolerancia"> 
			<h5><li><c:out	value="${intolerancia.nombre} " /></li></h5>
			</c:forEach>
			</c:if>
			<c:if test="${not empty reserva.producto.preferencia}">
			<h4>Preferencias:</h4> <h5><li><c:out	value="${reserva.producto.preferencia} "/></li></h5>
			</c:if>
					<spring:url value="/tienda/{tiendaId}" var="tiendaUrl">
						<spring:param name="tiendaId" value="${reserva.producto.tienda.id}" />
					</spring:url>
					<a href="${fn:escapeXml(tiendaUrl)}">
						<button class='btn btn-default btn-sm'>Ver tienda</button>
					</a>
				</div>
				</div>
	<br><br>
	<c:if test="${reserva['new']}">
	
		<form:form modelAttribute="reserva" class="form-horizontal"
			id="add-reserva-form">
			<div class="container">
				<div class="form-group has-feedback">
		
		 <div id="motivo-new" class="col-md-12">
					<h3>Cantidad:&nbsp&nbsp <input type = "number" id="cantidad" name="cantidad" min="1" value="1"></h3>
					</div>
					 <div id="motivo-new" class="col-md-12">
								<h3><label for="motivo">
									Comentario:
								</label></h3>
								<textarea class="form-control" rows="3" name="comentario">${reserva.comentario}</textarea>
								<br>
							</div>
					
						<input type="text" id="user" name="user" class="hidden"
						value="${username}">
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
					
       		<h2>Datos de la Reserva:</h2>
       		<h5>Cantidad Reservada: <c:out value="${reserva.cantidad}"> </c:out></h5>
       		<h5>Precio Total: <c:out value="${reserva.precio_total}"> </c:out> &#8364</h5>
						
					<br>
								<h2><label for="motivo">
									Motivo:
								</label></h2>
								<textarea class="form-control" rows="3" name="comentario">${reserva.comentario}</textarea>
								<br>
					
						<input type="text" id="user" name="user" class="hidden"
						value="${username}">
						<div class="radio-inline">
								<label class="hidden"> <input type="radio" name="estado"
									id="pendiente" value="PENDIENTE"
									<c:if test="${reserva.estado=='PENDIENTE'}">checked</c:if>>
									<h3>PENDIENTE</h3>
								</label>
							</div>
							<div class="radio-inline">
								<label> <input type="radio" name="estado" id="aceptado"
									value="ACEPTADO"
									<c:if test="${reserva.estado=='ACEPTADO'}"></c:if>>
									<h3>ACEPTAR</h3>
								</label>
							</div>
							<div class="radio-inline">
								<label> <input type="radio" name="estado" id="rechazado"
									value="RECHAZADO"
									<c:if test="${reserva.estado=='RECHAZADO'}"></c:if>>
									<h3>RECHAZAR</h3>
								</label>
							</div>
							<br><br>
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
					
       		<h2>Datos de la Reserva:</h2>
       		<h5>Cantidad Reservada: <c:out value="${reserva.cantidad}"> </c:out></h5>
       		<h5>Precio Total: <c:out value="${reserva.precio_total}"> </c:out> &#8364</h5>
						
					 <br>
								<h2><label for="motivo">
									Motivo:
								</label></h2>
								<textarea class="form-control" rows="3" name="comentario">${reserva.comentario}</textarea>
								<br>
					
					
						<input type="text" id="user" name="user" class="hidden"
						value="${username}">
						<input type="text" id="reserva" name="estado" class="hidden"
						value="${estado}">
						<br>
					<button class="btn btn-default" type="submit">Cancelar Reserva</button>
					
			</div>
			</div>
		</form:form>
	
	</c:if>
	
</petclinic:layout>

