<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<petclinic:layout pageName="reservas">
	<spring:url value="/" var="inicioUrl"></spring:url> 
	<spring:url value="/resources/images/intolerancias/" var="intolImagenUrl"></spring:url>
	<spring:url value="/resources/images/preferencias/" var="prefImagenUrl"></spring:url>
	<spring:url value="/producto/" var="productoUrl"></spring:url>
	<spring:url value="/tienda/" var="tiendaUrl"></spring:url>
	<sec:authorize access="hasAuthority('cliente')">
		<spring:url value="/users/" var="usersUrl"></spring:url>
	</sec:authorize>
<sec:authorize access="hasAuthority('vendedor')">
	<spring:url value="/tiendas/miTienda" var="miTiendaUrl"></spring:url>
</sec:authorize>
	
		<div class="container col-xxl-12 px-4 py-5">
		<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='currentColor'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item">
					<a href="${fn:escapeXml(inicioUrl)}">
						<i class="fa-solid fa-house icon-menu"> </i> Inicio
					</a>
				</li><sec:authorize access="hasAuthority('cliente')">
				<li class="breadcrumb-item">
					
							<a href="${fn:escapeXml(usersUrl)}">
								<i class="fa-solid fa-user icon-menu"></i>${username}
							</a>
					

				</li>
				<li class="breadcrumb-item active" aria-current="page">
					<i class="fa-solid fa-basket-shopping icon-menu"></i> 
						Reservas ${tiendaId}
				</li>
				</sec:authorize>
				
				<sec:authorize access="hasAuthority('vendedor')">
				<li class="breadcrumb-item">
					
							<a href="${fn:escapeXml(miTiendaUrl)}">
								<i class="fa-solid fa-store icon-menu"></i> Mi Tienda
							</a>
					

				</li>
				<li class="breadcrumb-item active" aria-current="page">
					<i class="fa-solid fa-basket-shopping icon-menu"></i> 
						Reservas
				</li>
				</sec:authorize>
				
			</ol>
		</nav>
	</div>
	<h2>
		<i class="fa-solid fa-basket-shopping icon-menu"></i> 
		Reservas
	</h2>

	
<div class="container col-xxl-12 px-4 py-4">

    <div class="row row-cols-12 g-3 py-3">
        <div class="accordion accordion-flush" id="reservasAcordeon">
            <div class="accordion-item">
                <h2 class="" id="reservasPendientesBoxHeader">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#reservasPendientesBoxCollapse" aria-expanded="false" aria-controls="reservasPendientesBoxCollapse">
                        <div class="mx-1">
                        	<i class="fa-solid fa fa-clock-o icon-menu"></i> 
                        </div> 
                        <div id="pendientesHeader">Pendientes</div>    
                    </button>
                </h2>
                <div id="reservasPendientesBoxCollapse" class="accordion-collapse collapse" aria-labelledby="reservasPendientesBoxHeader"
                    data-bs-parent="#reservasAcordeon">
                    <div class="accordion-body">
                        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3 py-2" id="reservasPendientes"></div>
                    </div>
                </div>
            </div>
            <div class="accordion-item">
                <h2 class="" id="reservasAceptadasBoxHeader">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#reservasAceptadasBoxCollapse" aria-expanded="false" aria-controls="reservasAceptadasBoxCollapse">
                        <div class="mx-1">
                        	<i class="fa-solid fa-check icon-menu"></i>
                        </div> 
                        <div id="aceptadasHeader">Aceptadas</div> 
                    </button>
                </h2>
                <div id="reservasAceptadasBoxCollapse" class="accordion-collapse collapse" aria-labelledby="reservasAceptadasBoxHeader"
                    data-bs-parent="#reservasAcordeon">
                    <div class="accordion-body">
                        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3 py-2" id="reservasAceptadas"></div>
                    </div>
                </div>
            </div>
            <div class="accordion-item">
                <h2 class="" id="reservasCanceladasBoxHeader">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#reservasCanceladasBoxCollapse" aria-expanded="false" aria-controls="reservasCanceladasBoxCollapse">
                       <div class="mx-1">
                       		<i class="fa-solid fa-circle-xmark icon-menu"></i>
                       	</div>
                       	<div id="canceladasHeader">Canceladas </div>
                    </button>
                </h2>
                <div id="reservasCanceladasBoxCollapse" class="accordion-collapse collapse" aria-labelledby="reservasCanceladasBoxHeader"
                    data-bs-parent="#reservasAcordeon">
                    <div class="accordion-body">
                        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3 py-2" id="reservasCanceladas"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    var reservas = new Array();
    var reservasAceptadas = new Array();
    var reservasCanceladas = new Array();
    var reservasPendientes = new Array();
    <c:forEach items="${reservas}" var="reserva">
        var reservaDetails = new Object();
        reservaDetails.id = "${reserva.id}";
        reservaDetails.imagenProducto = "${reserva.producto.imagen}";
        reservaDetails.idProducto = ${reserva.producto.id};
        reservaDetails.estado = "${reserva.estado}";
        reservaDetails.cantidad = ${reserva.cantidad};
        reservaDetails.precioProducto = "${reserva.producto.precio}";
        reservaDetails.nombreProducto = "${reserva.producto.nombre}";
        reservaDetails.precioTotal = ${reserva.precio_total};
        reservaDetails.nombreTienda = "${reserva.producto.tienda.nombre}";
        reservaDetails.comentario = "${reserva.comentario}";
        reservaDetails.idTienda = ${reserva.producto.tienda.id};
        reservaDetails.marca = "${reserva.producto.marca}";
        reservaDetails.descripcion = "${reserva.producto.descripcion}";
        var intoleranciasProducto = new Array();
        <c:forEach items="${reserva.producto.intolerancia}" var="intol">
            var intolProd = "${intol}";
            intoleranciasProducto.push(intolProd.trim());
        </c:forEach>
        reservaDetails.intolerancias = intoleranciasProducto;
        var preferencia = "${reserva.producto.preferencia}";
        reservaDetails.preferencia = preferencia.trim();
        var usuario = new Object();
        usuario.userName = "${reserva.user.username}";
        usuario.nombreCompleto = "${reserva.user.firstName}"+" "+"${reserva.user.lastName}";
        reservaDetails.usuario = usuario;
        reservas.push(reservaDetails);
        if(reservaDetails.estado=='ACEPTADO'){
            reservasAceptadas.push(reservaDetails);
        }else if(reservaDetails.estado=='CANCELADO'){
            reservasCanceladas.push(reservaDetails);
        }else if(reservaDetails.estado=='PENDIENTE'){
            reservasPendientes.push(reservaDetails);
        }
    </c:forEach>
    var numReservasAceptadas = reservasAceptadas.length;
    var numReservasCanceladas = reservasCanceladas.length;
    var numReservasPendientes = reservasPendientes.length;
    var canceladasHeader = document.getElementById('canceladasHeader');
    var aceptadasHeader = document.getElementById('aceptadasHeader');
    var pendientesHeader = document.getElementById('pendientesHeader');
    
    
    
    if(numReservasAceptadas>0){
    	aceptadasHeader.innerHTML += " ("+numReservasAceptadas+")";
    	reservasAceptadas.forEach(reserva => printReserva(reserva, "reservasAceptadas"));
    }else{
        var sinReservasAceptadas = document.createElement("p");
        sinReservasAceptadas.className ="lead";
        sinReservasAceptadas.innerHTML = "No tienes reservas aceptadas";
        document.getElementById("reservasAceptadas").appendChild(sinReservasAceptadas); 
    } 
    if(numReservasCanceladas>0){
    	canceladasHeader.innerHTML += " ("+numReservasCanceladas+")";
        reservasCanceladas.forEach(reserva => printReserva(reserva, "reservasCanceladas"));
    }else{
        var sinReservasCanceladas = document.createElement("p");
        sinReservasCanceladas.className ="lead";
        sinReservasCanceladas.innerHTML = "No tienes reservas canceladas";
        document.getElementById("reservasCanceladas").appendChild(sinReservasCanceladas);     
    }   
    if(numReservasPendientes>0){
    	pendientesHeader.innerHTML += " ("+numReservasPendientes+")";
        reservasPendientes.forEach(reserva => printReserva(reserva, "reservasPendientes"));
     }else{
        var sinReservasPendientes = document.createElement("p");
        sinReservasPendientes.className ="lead";
        sinReservasPendientes.innerHTML = "No tienes reservas pendientes";
        document.getElementById("reservasPendientes").appendChild(sinReservasPendientes);     
     }

    function printReserva(reserva,div){
    	const numIntolsPorUl = 6;
        var colReserva = document.createElement("div");
        colReserva.className = "col-md-12";
        var rowReserva = document.createElement("div");
        rowReserva.className ="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative";
        var imagenProductoDiv = document.createElement("div");
        imagenProductoDiv.className = "col-auto d-none d-lg-block";
        var imagenProducto = document.createElement("img");
        imagenProducto.src = reserva.imagenProducto;
        imagenProductoDiv.appendChild(imagenProducto);
        rowReserva.appendChild(imagenProductoDiv);
        var reservaBody = document.createElement("div");
        reservaBody.className = "col p-4 d-flex flex-column position-static";
        <sec:authorize access="hasAuthority('vendedor')">
            var strongVendedor = document.createElement("strong");
            strongVendedor.className = "d-inline-block mb-2 text-primary";
            var iconoCliente = document.createElement("i");
            iconoCliente.className = "fa-solid fa-user icon-menu";
            strongVendedor.innerHTML =  " "+reserva.usuario.nombreCompleto;
            strongVendedor.prepend(iconoCliente);
            reservaBody.appendChild(strongVendedor);
        </sec:authorize>
        <sec:authorize access="hasAuthority('cliente')">
            var enlaceTienda =  document.createElement("a");
            enlaceTienda.href = "${fn:escapeXml(tiendaUrl)}";
            var strongCliente = document.createElement("strong");
            strongCliente.className = "d-inline-block mb-2 text-primary";
            var iconoVendedor = document.createElement("i");
            iconoVendedor.className = "fa-solid fa-store icon-menu";
            strongCliente.innerHTML =  " "+reserva.nombreTienda;
            strongCliente.prepend(iconoVendedor);
            enlaceTienda.appendChild(strongCliente);
            reservaBody.appendChild(enlaceTienda);
        </sec:authorize>
        var h3NombreProducto = document.createElement("h3");
        h3NombreProducto.className = "mb-0";
        h3NombreProducto.innerHTML = reserva.nombreProducto;
        reservaBody.appendChild(h3NombreProducto);
        
        if(reserva.preferencia!="TODO" && reserva.preferencia!=null){
            var colPref = document.createElement("div");
            colPref.className = "col-xl-3 py-2";
            var h6Pref = document.createElement("h6");
            h6Pref.innerHTML = "Preferencia:"
            colPref.appendChild(h6Pref);
            var ulPref = document.createElement("ul");
            ulPref.className = "list-group list-group-horizontal";
            printLiPreferencia(reserva.preferencia,ulPref);
            colPref.appendChild(ulPref);
            reservaBody.appendChild(colPref);    
        }
        
        
        var divMarca = document.createElement("div");
        divMarca.className = "mb-1 text-muted";
        divMarca.innerHTML = "Marca: "+reserva.marca;
        reservaBody.appendChild(divMarca);
        var h5Descripcion = document.createElement("div");
        h5Descripcion.className = "h5";
        h5Descripcion.innerHTML = reserva.descripcion;
        reservaBody.appendChild(h5Descripcion);
        var rowIntolePrefe = document.createElement("div");
        rowIntolePrefe.className = "row";  
        if(reserva.intolerancias.length>0){
            var colIntols = document.createElement("div");
            colIntols.className = "col-xl-12 card py-2";
            colIntols.id ="intoleranciasBox";
            var h6Intols = document.createElement("h6");
            h6Intols.innerHTML = "Intolerancias:"
            colIntols.appendChild(h6Intols);
            var ulIntols = document.createElement("ul");
            ulIntols.className = "list-group list-group-horizontal-md d-flex flex-fill";
            ulIntols.id = "intolerancias-producto";
            if(reserva.intolerancias.length<numIntolsPorUl){
                reserva.intolerancias.forEach(intol => printLiIntol(intol, ulIntols));
                colIntols.appendChild(ulIntols);
            }else{
                var numUls = Math.floor(reserva.intolerancias.length/numIntolsPorUl);
                for(var i=0;i<numIntolsPorUl;i++){
                    printLiIntol(reserva.intolerancias[i], ulIntols);
                }
                colIntols.appendChild(ulIntols);
                for (var i=0;i<numUls;i++){
                    var ulIntol = document.createElement("ul");
                    ulIntol.className = "list-group list-group-horizontal-md d-flex flex-fill";
                    ulIntol.id = "intolerancias-producto";
                    for(var j=0;j<numIntolsPorUl;j++){
                        var index = ((i+1)*numIntolsPorUl)+j;
                        if(index<reserva.intolerancias.length){
                            printLiIntol(reserva.intolerancias[index], ulIntol);	
                        }	
                    }
                    colIntols.appendChild(ulIntol);
                }
            }
            rowIntolePrefe.appendChild(colIntols);
        }

        reservaBody.appendChild(rowIntolePrefe);
        if(reserva.comentario!=""){
            var rowComentario = document.createElement("div");
            rowComentario.className = "row py-1";
            var colComentario = document.createElement("div");
            colComentario.className = "col-xl-12 card py-2";
            var h6Comentario = document.createElement("h6");
            h6Comentario.innerHTML = "Comentario:"
            <sec:authorize access="hasAuthority('cliente')">
                h6Comentario.innerHTML = "Comentario del vededor:";
            </sec:authorize>
            colComentario.appendChild(h6Comentario);
            var textComentario = document.createElement("p");
            textComentario.className ="lead";
            textComentario.innerHTML = reserva.comentario;
            colComentario.appendChild(textComentario);
            rowComentario.appendChild(colComentario);
            reservaBody.appendChild(rowComentario);
        }
        var rowPrecioCantidad = document.createElement("div");
        rowPrecioCantidad.className = "row py-2";
        var colPrecioUnitario = document.createElement("div");
        colPrecioUnitario.className = "col-xl-3";
        var h5TituloPrecioUnitario = document.createElement("h5");
        h5TituloPrecioUnitario.innerHTML ="Precio Unitario:";
        colPrecioUnitario.appendChild(h5TituloPrecioUnitario);
        var h4PrecioUnitario = document.createElement("h4");
        h4PrecioUnitario.innerHTML = reserva.precioProducto+" &#8364";
        colPrecioUnitario.appendChild(h4PrecioUnitario);
        rowPrecioCantidad.appendChild(colPrecioUnitario);
        var colCantidadReservada = document.createElement("div");
        colCantidadReservada.className = "col-xl-3";
        h5TituloCantidad = document.createElement("h5");
        h5TituloCantidad.innerHTML ="Cantidad:";
        var inputCantidad = document.createElement("input");
        inputCantidad.className = "cantidad";
        inputCantidad.type = "number";
        inputCantidad.disabled = true;
        inputCantidad.id = "cantidad";
        inputCantidad.value = reserva.cantidad;
        colCantidadReservada.appendChild(h5TituloCantidad);
        colCantidadReservada.appendChild(inputCantidad);
        rowPrecioCantidad.appendChild(colCantidadReservada);
        var colPrecioTotal = document.createElement("div");
        colPrecioTotal.className = "col-xl-6";
        var h5TituloPrecioTotal = document.createElement("h5");
        h5TituloPrecioTotal.innerHTML ="Precio Total:";
        colPrecioTotal.appendChild(h5TituloPrecioTotal);
        var h4PrecioTotal = document.createElement("h4");
        h4PrecioTotal.innerHTML = reserva.precioProducto*reserva.cantidad +" &#8364";
        colPrecioTotal.appendChild(h4PrecioTotal);
        rowPrecioCantidad.appendChild(colPrecioTotal);
        reservaBody.appendChild(rowPrecioCantidad);
        rowReserva.appendChild(reservaBody);
        colReserva.appendChild(rowReserva);
        
        var divBotonesReserva = document.createElement("div");
        divBotonesReserva.className ="row g-0 overflow-hidden flex-md-row mb-4 h-md-250 position-relative";
        divBotonesReserva.id = "botonesReserva";
        var divBotonesReserva1 = document.createElement("div");
        divBotonesReserva1.className ="d-grid gap-2 d-md-flex justify-content-md-end py-2";
        divBotonesReserva1.id = "botonesReserva1";
        var divBotonesReserva2 = document.createElement("div");
        divBotonesReserva2.className ="d-grid gap-2 d-md-flex justify-content-md-end py-2";
        divBotonesReserva2.id = "botonesReserva1";
        var enlaceVerProducto = document.createElement("a");
        enlaceVerProducto.href = "${fn:escapeXml(productoUrl)}"+reserva.idProducto;
        enlaceVerProducto.className ="px-2 w-50 btn btn-outline-primary btn-lg px-4";
        enlaceVerProducto.innerHTML = "<i class='fa-solid fa-eye icon-menu'></i> Ver Producto";
        divBotonesReserva1.appendChild(enlaceVerProducto);
        <sec:authorize access="!hasAuthority('vendedor')">
            var enlaceVerTienda = document.createElement("a");
            enlaceVerTienda.href = "${fn:escapeXml(tiendaUrl)}"+reserva.idTienda;
            enlaceVerTienda.className ="px-2 w-50 btn btn-outline-primary btn-lg px-4";
            enlaceVerTienda.innerHTML = "<i class='fa-solid fa-store icon-menu'></i> Ver Tienda";
            divBotonesReserva1.appendChild(enlaceVerTienda);
        </sec:authorize>
        <sec:authorize access="hasAuthority('cliente')">
            if(reserva.estado=='PENDIENTE'){
                        var enlaceCancelar = document.createElement("a");
            enlaceCancelar.href = "${fn:escapeXml(usersUrl)}"+reserva.usuario.userName+"/reservas/"+reserva.id+"/cancelar";
            enlaceCancelar.className ="px-2 w-100 btn btn-outline-primary btn-lg px-4";
            enlaceCancelar.innerHTML = "<i class='fa-solid fa-circle-xmark icon-menu'></i> Cancelar Reserva ";
            divBotonesReserva2.appendChild(enlaceCancelar);
            }
        </sec:authorize>
        <sec:authorize access="hasAuthority('vendedor')">
            <c:if test="${mitienda}">
	            var enlaceVerTienda = document.createElement("a");
	            enlaceVerTienda.href = "${fn:escapeXml(tiendaUrl)}"+reserva.idTienda;
	            enlaceVerTienda.className ="px-2 w-50 btn btn-outline-primary btn-lg px-4";
	            enlaceVerTienda.innerHTML = "<i class='fa-solid fa-store icon-menu'></i> Ver Tienda";
	            divBotonesReserva1.appendChild(enlaceVerTienda);
                if(reserva.estado=='PENDIENTE'){
                    var enlaceGestionar = document.createElement("a");
                    enlaceGestionar.href = "${fn:escapeXml(tiendaUrl)}"+reserva.idTienda+"/reservas/"+reserva.id+"/verificar";
                    var botonGestionar = document.createElement("button");
                    botonGestionar.className = "w-100 btn btn-outline-primary btn-lg px-4";
                    botonGestionar.innerHTML = "<i class='fa-solid fa-pen-to-square'></i> Gestionar Reserva";
                    enlaceGestionar.appendChild(botonGestionar);
                    enlaceGestionar.className ="px-2 w-100";
                    divBotonesReserva2.appendChild(enlaceGestionar);
                }
            </c:if>
        </sec:authorize>
        divBotonesReserva.appendChild(divBotonesReserva2);
        divBotonesReserva.appendChild(divBotonesReserva1);
        colReserva.appendChild(divBotonesReserva);
        
        var hrEspacio = document.createElement("hr");
        hrEspacio.className ="w-100";
        var divTotal = document.getElementById(div);
        divTotal.appendChild(colReserva);	
        divTotal.appendChild(hrEspacio);
    }
    function printLiIntol(intol,ul){
        var liIntol = document.createElement("li");
        liIntol.className = "list-group-item";
        var imgIntol = document.createElement("img");
        imgIntol.src = "${fn:escapeXml(intolImagenUrl)}"+intol+".png";
        imgIntol.className ="menu-pref-icon";
        liIntol.innerHTML = " "+intol;
        liIntol.prepend(imgIntol);
        ul.append(liIntol);
    }

    function printLiPreferencia(pref,ul){
        var liPref = document.createElement("li");
        liPref.className = "list-group-item";
        var imgPref = document.createElement("img");
        imgPref.src = "${fn:escapeXml(prefImagenUrl)}"+pref+".png";
        imgPref.className ="menu-pref-icon";
        liPref.innerHTML = " "+pref;
        liPref.prepend(imgPref);
        ul.append(liPref);
    }
</script>


</petclinic:layout>