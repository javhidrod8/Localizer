<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<petclinic:layout pageName="tiendas">
	<link href="/resources/css/tiendas.css" rel="stylesheet">
	
	<spring:url value="/resources/images/localizer-logo.png" htmlEscape="true"
		var="tiendasImagen" />
	<spring:url value="/tiendas/" var="tiendasUrl"></spring:url>
	<spring:url value="/tiendas/miTienda/" var="miTiendaUrl"></spring:url>
	<c:if test="${!tienda['new']}">
		<spring:url value="/tienda/{tiendaId}/delete" var="tiendaDeleteUrl">
			<spring:param name="tiendaId" value="${tienda.id}" />
		</spring:url>	
		<spring:url value="/tienda/{tiendaId}/reservas" var="tiendaReservasUrl">
			<spring:param name="tiendaId" value="${tienda.id}" />
		</spring:url>	
		<spring:url value="/tienda/{tiendaId}/edit" var="tiendaEditUrl">
			<spring:param name="tiendaId" value="${tienda.id}" />
		</spring:url>	
		<spring:url value="/tienda/{tiendaId}/productos/new" var="tiendaUrl">
			<spring:param name="tiendaId" value="${tienda.id}" />
		</spring:url>	
	</c:if>
	<form:form modelAttribute="tienda" class="form-horizontal"
		id="add-tienda-form">	
	<div class="container col-xxl-12 px-4 py-4">
		<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='currentColor'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
  			<ol class="breadcrumb">
    			<li class="breadcrumb-item"><a href="${fn:escapeXml(inicioUrl)}"><i class="fa-solid fa-house icon-menu"> </i> Inicio</a></li>
    			<li class="breadcrumb-item"><a href="${fn:escapeXml(tiendasUrl)}"><i class="fa-solid fa-store icon-menu"></i> Tiendas</a></li>
    			<li class="breadcrumb-item active" aria-current="page" id="nombreTiendaBC"><c:out value="${tienda.nombre}" /></li>
  			</ol>
		</nav>
		<div class="col-md-12 py-1">
			<div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				<div class="col-auto d-none d-lg-block">
				
					<c:if test="${tienda['new']}">	<img id="imagenTiendaPreview" src="${fn:escapeXml(tiendasImagen)}" /></c:if>
					<c:if test="${!tienda['new']}">	<img id="imagenTiendaPreview" src="<c:out value="${tienda.imagen}"/>" /></c:if>
				</div>
				<div class="col p-4 d-flex flex-column position-static">
					<strong class="d-inline-block mb-2 text-primary" id="direccionTiendaPreview">
						<i class="fa-solid fa-location-dot"></i>
						<c:if test="${tienda['new']}">	Calle (Provincia) CP</c:if>
						<c:if test="${!tienda['new']}">	<c:out value="${tienda.calle}" /> (<c:out value="${tienda.provincia}" />) CP: <c:out value="${tienda.codigoPostal}" /></c:if>
						
					</strong>
					<h4 class="mb-0" id="nombreTiendaPreview">
						<c:if test="${tienda['new']}">Nombre de la tienda</c:if>
						<c:if test="${!tienda['new']}">${tienda.nombre}</c:if>
						
					</h4>
					<div class="mb-1 text-muted" id="telefonoTiendaPreview">
						<b>Teléfono:</b> 
						<c:if test="${tienda['new']}">XXXXXXXXX</c:if>
						<c:if test="${!tienda['new']}">${tienda.telefono}</c:if>
					</div>
					<div class="mb-1 text-muted" id="horarioTiendaPreview">
						<b>Horario:</b> 
						<c:if test="${tienda['new']}">Horario de la tienda</c:if>
						<c:if test="${!tienda['new']}">	${tienda.horario}</c:if>
					</div>
					<div class="h5" id="descripcionTiendaPreview">
						<c:if test="${tienda['new']}">Descripción de la tienda</c:if>
						<c:if test="${!tienda['new']}">${tienda.descripcion}</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<h2>
	<i class="fa-solid fa-store icon-menu"></i>
		<c:if test="${tienda['new']}">Crear </c:if>
		<c:if test="${!tienda['new']}">Editar </c:if>
		Tienda
	</h2>

		<div class="form-group has-feedback">
			<div class="row g-1">
				<div class="col-sm-8">
					<label for="nombre" class="form-label" style="pointer-events: none">
		            	<h4>Nombre</h4></label>
		            	<input type="text" class="form-control" id="nombre" name="nombre" placeholder="" value="${tienda.nombre}" required>
		            	<div class="invalid-feedback">
		                	Nombre necesario para el registro.
		              	</div>
				</div>
				<div class="col-sm-4">
              		<label for="telefono" class="form-label" style="pointer-events: none">
              			<h4>Teléfono</h4>
              		</label>
              		<input type="text" class="form-control" id="telefono" name="telefono" placeholder="" value="${tienda.telefono}" pattern="^(?:(?:\\+?[0-9]{2,4})?[ ]?[6789][0-9 ]{8,13})$" title="Ej: 612345678" required>
              		<div class="invalid-feedback">
                		Teléfono necesario para el registro.
              		</div>
				</div>
				<div class="col-sm-12">
					<label for="descripcion" style="pointer-events: none">
						<h4>Descripci&oacuten</h4>
					</label>
					<textarea required class="form-control" id="descripcion" name="descripcion" rows="3" required>${tienda.descripcion}</textarea>
				</div>

				<div class="col-sm-6">              
					<label for="calle" class="form-label" style="pointer-events: none">
              			<h4>Calle</h4>
              		</label>
              		<input type="text" class="form-control" id="calle" name="calle" placeholder="" value="${tienda.calle}" required>
              		<div class="invalid-feedback">
                		Calle necesaria para el registro.
              		</div>		
				</div>
				<div class="col-sm-4">
              		<label for="provincia" class="form-label" style="pointer-events: none">
              			<h4>Provincia</h4>
              		</label>
              		<input type="text" class="form-control" id="provincia" name="provincia" value="${tienda.provincia}" required>
              		<div class="invalid-feedback">
               			Provincia necesaria para el registro.
              		</div>			
				</div>
				<div class="col-sm-2">
					<label for="codigoPostal" class="form-label" style="pointer-events: none">
              			<h4>Código Postal</h4>
              		</label>
              		<input type="text" class="form-control" id="codigoPostal" name="codigoPostal"  title="Debe contener 5 dígitos" pattern="^([1-9]{2}|[0-9][1-9]|[1-9][0-9])[0-9]{3}$" placeholder="" value="${tienda.codigoPostal}" required>
              		<div class="invalid-feedback">
               			CP necesario para el registro.
              		</div>
				</div>
				<div class="col-sm-12">
			   		<label for="horario" class="form-label" style="pointer-events: none">
              			<h4>Horario</h4>
              		</label>
              		<input type="text" class="form-control" id="horario" name="horario" value="${tienda.horario}" required>
              		<div class="invalid-feedback">
               			Horario necesario para el registro.
              		</div>
				</div>
				<div class="col-sm-12">
			  		<label for="imagenPrueba" class="form-label" style="pointer-events: none">
              			<h4>Imagen</h4>
              		</label>
              		<input type="text" class="form-control" id="imagenPrueba"  title="Debe empezar por https y terminar por formato gráfico (png,jpg,jpeg,gif,png,svg)" pattern="(https:\/\/.+\.(?:png|jpg|jpeg|gif|png|svg))$"  placeholder="" value="${tienda.imagen}">
              		<div class="invalid-feedback">
               			Imagen necesaria para el registro.
              		</div>
				</div>
				<div class="col-sm-12 hidden">
			  		<label for="imagen" class="form-label" style="pointer-events: none">
              			<h4>Imagen</h4>
              		</label>
              		<input type="text" class="form-control" id="imagen" name="imagen" pattern="(https:\/\/.+\.(?:png|jpg|jpeg|gif|png|svg))$"  placeholder="" value="${tienda.imagen}" required>
              		<div class="invalid-feedback">
               			Imagen necesaria para el registro.
              		</div>
				</div>
            </div>
			<c:if test="${patternImagen}">
				<p class="red text-center">La URL de la imagen no es válida.</p>
			</c:if>
		</div>
		<div class="form-group py-2">
							<div class="col-xl-12 py-2">
						<div id ="botones" class="d-grid gap-2 d-md-flex justify-content-md-end py-2">	
							<sec:authorize access="hasAuthority('vendedor')">
									<c:choose>
										<c:when test="${tienda['new']}">
											<button class="w-100 btn btn-outline-primary btn-lg px-4" type="submit"><i class="fa-solid fa-floppy-disk"></i> A&ntildeadir Tienda</button>
											<a href="${fn:escapeXml(tiendaEditUrl)}" class="w-50 btn btn-outline-primary btn-lg px-4" disabled><i class="fa-solid fa-arrow-rotate-left"></i> Empezar de nuevo</a>
										</c:when>
										<c:otherwise>
											<button class="w-100 btn btn-outline-primary btn-lg px-4" type="submit"><i class="fa-solid fa-floppy-disk"></i> Guardar cambios</button>
											<a href="${fn:escapeXml(miTiendaUrl)}" class="w-50 btn btn-outline-primary btn-lg px-4"><i class="fa-solid fa-arrow-rotate-left"></i> Cancelar cambios</a>
											<a href="${fn:escapeXml(tiendaDeleteUrl)}" class = "w-50 btn btn-outline-primary btn-lg px-4"><i class="fa-solid fa-trash-can"></i> Eliminar tienda</a>
										</c:otherwise>
									</c:choose>
							</sec:authorize>
						</div>
					
					</div>	
		
			<div class="col-md-12 py-3">

			</div>
		</div>
	</form:form>
		<script>
		const imagenOriginal = document.getElementById('imagenTiendaPreview').src;
		const nombre = document.getElementById('nombre');
		const nombreTiendaBC = document.getElementById('nombreTiendaBC');
		const descripcion = document.getElementById('descripcion');
		const telefono = document.getElementById('telefono');
		const calle = document.getElementById('calle');
		const provincia = document.getElementById('provincia');
		const codigoPostal = document.getElementById('codigoPostal');
		const horario = document.getElementById('horario');
		const imagen = document.getElementById('imagen');
		const imagenPrueba = document.getElementById('imagenPrueba');
		const resultDescripcion = document.getElementById('descripcionTiendaPreview');
		const resultNombre = document.getElementById('nombreTiendaPreview');
		const resultTelefono = document.getElementById('telefonoTiendaPreview');
		const resultDireccion = document.getElementById('direccionTiendaPreview');
		const resultHorario = document.getElementById('horarioTiendaPreview');
		const resultImagen = document.getElementById('imagenTiendaPreview');
		const inputHandlerNombre = function(e) {
			nombreTiendaBC.innerHTML = e.target.value;
		  	resultNombre.innerHTML = e.target.value;
		}
		nombre.addEventListener('input', inputHandlerNombre);
		const inputHandlerDescripcion = function(e) {
			resultDescripcion.innerHTML = e.target.value;
		}
		descripcion.addEventListener('input', inputHandlerDescripcion);
		
		const inputHandlerTelefono = function(e) {
			resultTelefono.innerHTML = "<b>Teléfono: </b>"+e.target.value;
		}
		telefono.addEventListener('input', inputHandlerTelefono);
		
		function printDireccion(calleValue,provinciaValue,codigoPostalValue){
			if(calleValue!=''&&provinciaValue!=''&&codigoPostalValue!=''){
				resultDireccion.innerHTML = "<i class='fa-solid fa-location-dot'></i> "+calleValue;
				resultDireccion.innerHTML+=" ("+provinciaValue+")";
				resultDireccion.innerHTML+=" CP: "+codigoPostalValue;
			}
		}
		
		const inputHandlerCalle = function(e) {
			var calleValue = e.target.value;
			var provinciaValue = provincia.value;
			var codigoPostalValue = codigoPostal.value;
			printDireccion(calleValue,provinciaValue,codigoPostalValue);
		}
		calle.addEventListener('input', inputHandlerCalle);
		
		const inputHandlerProvincia = function(e) {
			var calleValue = calle.value;
			var provinciaValue = e.target.value;
			var codigoPostalValue = codigoPostal.value;
			printDireccion(calleValue,provinciaValue,codigoPostalValue);
		}
		provincia.addEventListener('input', inputHandlerProvincia);
		
		const inputHandlerCP = function(e) {
			var calleValue = calle.value;
			var provinciaValue = provincia.value;
			var codigoPostalValue = e.target.value;
			printDireccion(calleValue,provinciaValue,codigoPostalValue);
		}
		codigoPostal.addEventListener('input', inputHandlerCP);
		
		const inputHandlerHorario = function(e) {
			resultHorario.innerHTML = "<b>Horario:</b> "+e.target.value;
		}
		horario.addEventListener('input', inputHandlerHorario);
		
		const inputHandlerImagen = function(e) {
			const strImagen = e.target.value;
			const n = 4; 
			const extension = strImagen.substring(strImagen.length - n)
			if(extension=='.png'||extension=='.jpg'||extension=='.gif'||extension=='jpeg'||extension=='.svg'){
				   checkIfImageExists(strImagen, (exists) => {
					      if (exists) {
					    	  resultImagen.src = e.target.value;
					    	  imagen.value = e.target.value;	  
					    }});
			}
		}
		imagenPrueba.addEventListener('input', inputHandlerImagen);

		 function checkIfImageExists(url, callback) {
			    const img = new Image();
			    img.src = url;

			    if (img.complete) {
			      callback(true);
			    } else {
			      img.onload = () => {
			        callback(true);
			      };
			      
			      img.onerror = () => {
			        callback(false);
			      };
			    }
			  }
		
	</script>

	
</petclinic:layout>
