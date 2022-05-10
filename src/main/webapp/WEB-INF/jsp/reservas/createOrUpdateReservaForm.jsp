<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<petclinic:layout pageName="reservas">
	<spring:url value="/producto/{productoId}" var="productoUrl">
		<spring:param name="productoId" value="${reserva.producto.id}" />
	</spring:url>
	<spring:url value="/tienda/{tiendaId}" var="tiendaUrl">
		<spring:param name="tiendaId" value="${reserva.producto.tienda.id}" />
	</spring:url>
	<spring:url value="/resources/images/intolerancias/" var="intolImagenUrl"></spring:url>	
	<c:if test="${not empty reserva.producto.preferencia && reserva.producto.preferencia!='TODO'}">
		<c:set var="prefTrimmed" value="${fn:replace(reserva.producto.preferencia,' ', '')}" />
		<spring:url value="/resources/images/preferencias/{pref}.png" var="prefImagenUrl">
			<spring:param name="pref" value="${prefTrimmed}" />
		</spring:url>
	</c:if>
	<c:if test="${cancelar}">
		<spring:url value="/users/{cliente}/reservas" var="reservasClienteUrl">
			<spring:param name="cliente" value="${username}" />
		</spring:url>
	</c:if>
		

		
<form:form modelAttribute="reserva" class="form-horizontal" id="add-reserva-form">
	<input type="text" id="user" name="user" class="hidden" value="${username}">
	<c:if test="${verificar}">
		<div class="hidden">
			<input type="radio" name="estado" id="aceptado" value="ACEPTADO" checked>
			<input type="radio" name="estado" id="cancelado" value="CANCELADO">
		</div>
	</c:if>	
	
	<div class="container col-xxl-12 px-4 py-5">
		<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='currentColor'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a
					href="${fn:escapeXml(inicioUrl)}"><i
						class="fa-solid fa-house icon-menu"> </i> Inicio</a></li>
				<li class="breadcrumb-item"><a
					href="${fn:escapeXml(tiendaUrl)}"><i
						class="fa-solid fa-store icon-menu"></i>
						${reserva.producto.tienda.nombre}</a></li>
				<c:if test="${reserva['new']}">
					<li class="breadcrumb-item"><a
						href="${fn:escapeXml(productoUrl)}"> <i
							class="fa-solid fa-bowl-food icon-menu"></i> <c:if
								test="${reserva['new']}">
								<c:out value="${reserva.producto.nombre}" />
							</c:if> <c:if test="${!reserva['new']}">Reservas</c:if>
					</a></li>
				</c:if>
				<li class="breadcrumb-item active" aria-current="page"><i
					class="fa-solid fa-basket-shopping icon-menu"></i> <c:if
						test="${reserva['new']}">Reservar</c:if> <c:if
						test="${!reserva['new']}">
						<c:out value="${reserva.producto.nombre}" />
					</c:if></li>

			</ol>
		</nav>
	</div>
	<c:if test="${reserva['new']}">
		<h2>
			<i class="fa-solid fa-basket-shopping icon-menu"></i> 
			Reservar
		</h2>
	</c:if>
	<div class="col-md-12 py-3">
			<div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				<div class="col-auto d-none d-lg-block">
					<img src="<c:out value="${reserva.producto.imagen}"/>" />
				</div>
				<div class="col p-4 d-flex flex-column position-static">
					<div class="row">
						<div class="col-xl-9 py-1">
							<sec:authorize access="hasAuthority('vendedor')">
								<strong class="d-inline-block mb-2 text-primary" id="nombreTiendaCliente">
								<i class="fa-solid fa-user icon-menu"></i>
								<c:out value="${reserva.user.firstName }"/>  <c:out value=" " />
								<c:out value="${ reserva.user.lastName }" /> </strong>
							</sec:authorize>
							<sec:authorize access="hasAuthority('cliente')">
								<a href="${fn:escapeXml(tiendaUrl)}"> 
									<strong class="d-inline-block mb-2 text-primary" id="nombreTiendaCliente">
										<i class="fa-solid fa-store icon-menu"></i>
										${reserva.producto.tienda.nombre}
									</strong>
								</a>
							</sec:authorize>
							<h3 class="mb-0">${reserva.producto.nombre}</h3>
						</div>
						<div class="col-xl-3 d-flex justify-content-end align-items-end">
							<h1>${reserva.producto.precio} &#8364</h1>
						</div>
				</div>
				<c:if test="${reserva.producto.preferencia!='TODO'}">
				<div class="col-xl-3 py-2">
					<h6>Preferencia:</h6>
					<ul class="list-group list-group-horizontal">
						<li class="list-group-item">
							<img src="${fn:escapeXml(prefImagenUrl)}" class="menu-pref-icon"> 
							${reserva.producto.preferencia}
						</li>
					</ul>
				</div>
				</c:if>

				
				<c:if test="${not empty reserva.producto.marca}">
						<div class="mb-1 text-muted">
							Marca: ${reserva.producto.marca}
						</div>
					</c:if>
					<c:if test="${not empty reserva.producto.descripcion}">
						<div class="h5">
							${reserva.producto.descripcion}
						</div>
					</c:if>
					<div class="row">
						<c:if test="${not empty reserva.producto.intolerancia}">
							<div class="col-xl-12 card py-2" id="intoleranciasBox">
								<h6>Intolerancias:</h6>
								<ul class="list-group list-group-horizontal-md d-flex flex-fill" id="intolerancias-producto"></ul>
							</div>
						</c:if>
					</div>
			</div>
		</div>
			<div class="row py-2">
					<div class="col-xl-12 d-flex flex-md-row gap-2 mt-auto">
						<div class="card col-xl-6 d-flex flex-md-row align-items-center">
							<div class="col-xl-4">
								<div class="row">
									<div class="col-xl-12  d-flex justify-content-center">
										<h5 >Precio:</h5>
									</div>
									<div class="col-xl-12  d-flex justify-content-center">
										<h4>${reserva.producto.precio} &#8364</h4>
									</div>
								</div>
							</div>
							<div class="col-xl-4">
								<div class="row">
									<div class="col-xl-12 d-flex justify-content-center">
										<h5 >Cantidad:</h5>
									</div>
									<div class="col-xl-12 d-flex justify-content-center">
										<c:choose>
											<c:when test="${not reserva['new']}">
												<input class="col-md-3" required type="number" placeholder="1" min=1 id="cantidad" name="cantidad" value ="${reserva.cantidad}" disabled>
											</c:when>
											<c:otherwise>
												<input class="col-md-3" required type="number" placeholder="1" min=1 id="cantidad" name="cantidad" min="1" value="1">
											</c:otherwise>
										</c:choose>	
									</div>
								</div>
							</div>
							<div class="col-xl-4">
								<div class="row">
									<div class="col-xl-12 d-flex justify-content-center">
										<h5 >Total:</h5>
									</div>
									<div class="col-xl-12 d-flex justify-content-center">
										<c:choose>
											<c:when test="${not reserva['new']}">
												<h4 id="precio-total">${reserva.precio_total} &#8364</h4>
											</c:when>
											<c:otherwise>
												<h4 id="precio-total">${reserva.producto.precio} &#8364</h4>
											</c:otherwise>
										</c:choose>	
									</div>
								</div>
							</div>
							
						</div>
						
						
						<div class="col-xl-6">
							<div id ="botones" class="d-grid gap-2">
								<c:if test="${verificar}">	
									<button type="button" class="btn btn-outline-primary btn-lg px-4 w-100" data-bs-toggle="modal" data-bs-target="#aceptadoToast" onclick="aceptar(); return false;">
  											<i class="fa-solid fa-check icon-menu"></i>
  											Aceptar Reserva
									</button>
									<button type="button" class="btn btn-outline-primary btn-lg px-4 w-100" data-bs-toggle="modal" data-bs-target="#canceladoToast" onclick="cancelar(); return false;">
  											<i class="fa-solid fa-circle-xmark icon-menu"></i>  
  											Cancelar Reserva
									</button>
									<a href="${fn:escapeXml(tiendaUrl)}/reservas/" class="btn btn-outline-primary btn-lg px-4 w-100">
										<i class="fa-solid fa-arrow-rotate-left"></i>
										Volver a reservas 
									</a>	
								</c:if>
								<c:if test="${reserva['new']}">
									<input type="radio" name="estado" id="pendiente" value="PENDIENTE" required checked class="hidden">	
									<button class="btn btn-outline-primary btn-lg px-4  w-100" type="submit">
										<i class="fa-solid fa-basket-shopping icon-menu"></i> 
										 Realizar Reserva  
									</button>
									<div class="d-grid gap-2 d-md-flex justify-content-md-end">
										<a href="${fn:escapeXml(productoUrl)}" class="btn btn-outline-primary btn-lg px-4 w-100">
											<i class="fa-solid fa-bowl-food icon-menu"></i> 
											 Ver Producto 
											
										</a>
										<a href="${fn:escapeXml(tiendaUrl)}" class="btn btn-outline-primary btn-lg px-4 w-100">
											<i class="fa-solid fa-store icon-menu"></i> 
											 Ver Tienda 
											
										</a>
									</div>		
								</c:if>
								<c:if test="${cancelar}">
									<button class="btn btn-outline-primary btn-lg px-4 w-100" type="submit">
										<i class="fa-solid fa-circle-xmark icon-menu"></i> 
										Cancelar Reserva  
										</button>
									<a href="${fn:escapeXml(reservasClienteUrl)}" class="btn btn-outline-primary btn-lg px-4">
										<i class="fa-solid fa-arrow-rotate-left"></i> 
										 Volver a Reservas
									</a>	
								</c:if>
							</div>
						</div>	
		</div>
	</div>
</div>	


		<div class="modal fade" id="aceptadoToast" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
		    <div class="modal-content rounded-6 shadow">
		      <div class="modal-header border-bottom-0">
		        <h5 class="modal-title">Aceptar</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="aceptar(); return false;"></button>
		      </div>
		      <div class="modal-body py-0">Puede añadir un comentario o aceptar directamente</div>
		      <div class="modal-body py-0 hidden" id="comentarioToastAceptar">
				<textarea class="form-control" rows="3" name="comentario" id="textComentarioToastAceptar" minlength="3" disabled>${reserva.comentario}</textarea>
		      </div>
		      <div class="modal-footer flex-column border-top-0">
		        <button class="btn btn-outline-primary btn-lg px-4 w-100" id="botonComentar" value="Comentar"  onclick="comentar(); return false;"><i class="fa-solid fa-comment"></i> Añadir comentario</button>
		        <button class="btn btn-outline-primary btn-lg px-4 w-100"><i class="fa-solid fa-check icon-menu"></i> Aceptar Reserva</button>
		      </div>
		    </div>
		  </div>
		 </div>
		<div class="modal fade" id="canceladoToast" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
		    <div class="modal-content rounded-6 shadow">
		      <div class="modal-header border-bottom-0">
		        <h5 class="modal-title">Cancelar</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body py-0">
		       	<label for="comentarioToastCancelar"> Deje un comentario para cancelar</label>
				<textarea class="form-control" rows="3" name="comentario" id="comentarioToastCancelar" minlength="3" disabled>${reserva.comentario}
				</textarea>
		      </div>
		      <div class="modal-footer flex-column border-top-0">
					<button class="btn btn-outline-primary btn-lg px-4 w-100">Cancelar Reserva</button>
		      </div>
		    </div>
		  </div>
		 </div>


</form:form>
		<script>
	var intolerancias = new Array();
	const ulIntolerancias = document.getElementById("intolerancias-producto");
	const numIntolsPorUl = 6;
	<c:forEach items="${reserva.producto.intolerancia}" var="intol">
		var intolName = "${intol}";
		var intolTrimmed = intolName.trim();
		intolerancias.push(intolTrimmed);
	</c:forEach>
	intolerancias = intolerancias.sort();
	
	if(intolerancias.length<numIntolsPorUl){
		intolerancias.forEach(intol => printIntol(intol,ulIntolerancias));
	}else{
		for(var i=0;i<numIntolsPorUl;i++){
			printIntol(intolerancias[i],ulIntolerancias);
	}
	var numUls = Math.floor(intolerancias.length/numIntolsPorUl);
	for (var i=0;i<numUls;i++){
		var ulIntol = document.createElement("ul");
		var intoleranciasBox = document.getElementById("intoleranciasBox");
		ulIntol.className = "list-group list-group-horizontal-md d-flex flex-fill";
		ulIntol.id = "intolerancias-producto";
		for(var j=0;j<numIntolsPorUl;j++){
			var index = ((i+1)*numIntolsPorUl)+j;
			if(index<intolerancias.length){
				printIntol(intolerancias[index],ulIntol);	
			}
		}
			intoleranciasBox.appendChild(ulIntol);
		}
	}
	function printIntol(intol,ul){
		var liIntol = document.createElement("li");
		liIntol.className = "list-group-item";
		var imgIntol = document.createElement("img");
		imgIntol.src = "${fn:escapeXml(intolImagenUrl)}"+intol+".png";
		imgIntol.className ="menu-pref-icon";
		liIntol.innerHTML = " "+intol;
		liIntol.prepend(imgIntol);
		ul.append(liIntol);
	}
</script>
		
		
		<script>
		<c:if test='${reserva["new"]}'>
		const selectElement = document.getElementById('cantidad');

	    selectElement.addEventListener('change', (event) => {
	        const resultado = document.getElementById('precio-total');
			resultado.innerHTML = Math.round(event.target.value*${reserva.producto.precio}*100)/100 + "&#8364";
	        });
	    </c:if>
	    <c:if test="${verificar}">
	    
	    var comentarioInput = document.getElementById('comentario');
		var aceptadoTrigger = document.getElementById('botonAceptar');
	    var canceladoTrigger = document.getElementById('botonCancelar');
	    var aceptadoToast = document.getElementById('aceptadoToast');
	    var canceladoToast = document.getElementById('canceladoToast');
	    var comentarioToastAceptar = document.getElementById('comentarioToastAceptar');
	    var comentarioToastCancelar = document.getElementById('comentarioToastCancelar');
	    var textComentarioToastAceptar  = document.getElementById('textComentarioToastAceptar');
	    var botonComentar = document.getElementById('botonComentar');
	    var labelToastAceptar = document.getElementById('labelToastAceptar');
	    
	    function comentar(){
	    	comentarioToastAceptar.className = "modal-body py-0"; 
	    	botonComentar.className ="hidden";
	    }
	    
		function aceptar(){
			botonComentar.className ="btn btn-outline-primary btn-lg px-4 w-100";
			comentarioToastAceptar.className = "form-control hidden"; 
			const aceptado = document.getElementById("aceptado");
			aceptado.checked = true;
			comentarioToastCancelar.disabled = true;
			textComentarioToastAceptar.disabled = false;
		}
		function cancelar(){
			const cancelado = document.getElementById("cancelado");
			textComentarioToastAceptar.disabled = true;
			comentarioToastCancelar.disabled = false;
			cancelado.checked = true;
		}
		
	    if (aceptadoTrigger) {
	    	aceptadoTrigger.addEventListener('click', function () {
	        var toast = new bootstrap.Toast(aceptadoToast);
	        aceptado.checked = true;
	        toast.show();
	      })
	    }
	    if (canceladoTrigger) {
	    	canceladoTrigger.addEventListener('click', function () {
	        var toast = new bootstrap.Toast(canceladoToast);
	        cancelado.checked = true;
	        toast.show();
	      })
	    }
	    </c:if>
	    
		</script>
		





</petclinic:layout>

