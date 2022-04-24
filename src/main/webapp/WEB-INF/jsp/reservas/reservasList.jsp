<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<petclinic:layout pageName="reservas">

	<h2>Historial de reservas</h2>

	<table id="reservaTable" class="table table-striped">
		<thead>
		</thead>
		<tbody>
			<c:forEach items="${reservas}" var="reserva">
				<tr>
					<td>
						<div class="row">
							<br>
							<div class="col-md-4">
								<spring:url value="/producto/{productoId}" var="productoUrl">
									<spring:param name="productoId" value="${reserva.producto.id}" />
								</spring:url>
								<div class="imagen-prod-reserva">
									<a href="${fn:escapeXml(productoUrl)}"> <img height="200px"
										width=auto src="<c:out value="${reserva.producto.imagen}"/>"
										style="margin: 0px 50px" />
									</a>
								</div>


							</div>
							<div class="col-md-4">
															<h2>
									Estado:

									<c:if test="${reserva.estado=='ACEPTADO'}">
										<i class="fa fa-check" style="margin-left: 2%"></i>
									</c:if>
									<c:if test="${reserva.estado=='CANCELADO'}">
										<i class="fa fa-times" style="margin-left: 2%"></i>
									</c:if>
									<c:if test="${reserva.estado=='PENDIENTE'}">
										<i class="fa fa-clock-o" style="margin-left: 2%"></i>
									</c:if>
									<c:out value="${reserva.estado}">
									</c:out>

								</h2>
															<sec:authorize access="hasAuthority('cliente')">
									<h4>
										Tienda:
										<c:out value="${reserva.producto.tienda.nombre}">
										</c:out>
									</h4>
								</sec:authorize>

								<h2><c:out value="${reserva.cantidad}">
									</c:out> x
									<c:out value="${reserva.producto.nombre}" />
								</h2>
								<h4>
									<c:out value="${reserva.cantidad}">
									</c:out> x <c:out value="${reserva.producto.precio}" /> 
									&#8364

								</h4>
								<h2>
									Total:
								<c:out value="${reserva.precio_total}" /> 
									&#8364

								</h2>
								<div class="botones-producto">

									<spring:url value="/producto/{productoId}" var="productoUrl">
										<spring:param name="productoId" value="${reserva.producto.id}" />
									</spring:url>
									<spring:url value="/tienda/{tiendaId}" var="tiendaUrl">
										<spring:param name="tiendaId" value="${reserva.tienda.id}" />
									</spring:url>
									<a href="${fn:escapeXml(productoUrl)}">
										<button class='btn btn-default btn-sm'>Ver producto</button>
									</a>
									<a href="${fn:escapeXml(tiendaUrl)}">
										<button class='btn btn-default btn-sm'>Ver tienda</button>
									</a>
								</div>

							</div>

							<div class="col-md-4">

								<div class="botones-reserva">
									<sec:authorize access="hasAuthority('cliente')">
										<c:if test="${reserva.estado=='PENDIENTE'}">
											<spring:url
												value="/users/{username}/reservas/{reservaId}/cancelar"
												var="cancelarUrl">
												<spring:param name="username"
													value="${reserva.user.username}" />
												<spring:param name="reservaId" value="${reserva.id}" />
											</spring:url>
											<a href="${fn:escapeXml(cancelarUrl)}">
												<button class='btn btn-default btn-sm'>Cancelar
													Reserva</button>
											</a>
										</c:if>
									</sec:authorize>

									<sec:authorize access="hasAuthority('vendedor')">
										<c:if test="${mitienda}">
											<c:if test="${reserva.estado=='PENDIENTE'}">
												<spring:url
													value="/tienda/{tiendaId}/reservas/{reservaId}/verificar/"
													var="verificarUrl">
													<spring:param name="tiendaId" value="${reserva.tienda.id}" />
													<spring:param name="reservaId" value="${reserva.id}" />
												</spring:url>
												<a href="${fn:escapeXml(verificarUrl)}">
													<button class='btn btn-default btn-sm'>Gestionar
														Reserva</button>
												</a>

											</c:if>
										</c:if>
									</sec:authorize>

								</div>
								<c:if test="${not empty reserva.comentario}">								
									<h2>Comentario 
									<sec:authorize access="hasAuthority('cliente')"> del vendedor</sec:authorize>
									:</h2>
									<h4>
									<c:out value="${reserva.comentario}">
									</c:out>
								</h4></c:if>	

							</div>

						</div> <br>
					</td>


				</tr>
			</c:forEach>
		</tbody>
	</table>
</petclinic:layout>