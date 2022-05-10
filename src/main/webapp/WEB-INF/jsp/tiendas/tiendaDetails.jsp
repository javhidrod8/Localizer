<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<petclinic:layout pageName="tienda">
<link href="/resources/css/tiendas.css" rel="stylesheet">
<link href="/resources/css/productos.css" rel="stylesheet">
<spring:url value="/resources/images/preferencias/" var="prefImagenUrl"></spring:url>	
<spring:url value="/resources/images/intolerancias/" var="intolImagenUrl"></spring:url>			
<spring:url value="/producto/" var="productoUrl"></spring:url>
<spring:url value="/" var="inicioUrl"></spring:url>
<spring:url value="/tiendas/" var="tiendasUrl"></spring:url>
<spring:url value="/tienda/" var="tiendaUrl"></spring:url>

<sec:authorize access="hasAuthority('admin')">				
	<spring:url value="/tienda/{tiendaId}/delete" var="tiendaDeleteUrl">
		<spring:param name="tiendaId" value="${tienda.id}" />
	</spring:url>						
	<spring:url value="/tienda/{tiendaId}/reservas" var="tiendaReservasUrl">
		<spring:param name="tiendaId" value="${tienda.id}" />
	</spring:url>	
	<spring:url value="/tienda/{tiendaId}/edit" var="tiendaEditUrl">
		<spring:param name="tiendaId" value="${tienda.id}" />
	</spring:url>	
	<spring:url value="/tienda/{tiendaId}/productos/new" var="nuevoProductoUrl">
		<spring:param name="tiendaId" value="${tienda.id}" />
	</spring:url>	
</sec:authorize>
<sec:authorize access="hasAuthority('vendedor')">
	<c:if test="${miTienda}">			
		<spring:url value="/tienda/{tiendaId}/delete" var="tiendaDeleteUrl">
			<spring:param name="tiendaId" value="${tienda.id}" />
		</spring:url>	
		<spring:url value="/tienda/{tiendaId}/reservas" var="tiendaReservasUrl">
			<spring:param name="tiendaId" value="${tienda.id}" />
		</spring:url>	
		<spring:url value="/tienda/{tiendaId}/edit" var="tiendaEditUrl">
			<spring:param name="tiendaId" value="${tienda.id}" />
		</spring:url>	
		<spring:url value="/tienda/{tiendaId}/productos/new" var="nuevoProductoUrl">
			<spring:param name="tiendaId" value="${tienda.id}" />
		</spring:url>			
	</c:if>
</sec:authorize>

<c:if test="${tienda.id != null || tienda.id == '' }">
	<div class="container col-xxl-12 px-4 py-5">
		<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='currentColor'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
  			<ol class="breadcrumb">
    			<li class="breadcrumb-item"><a href="${fn:escapeXml(inicioUrl)}"><i class="fa-solid fa-house icon-menu"> </i> Inicio</a></li>
    			<c:if test="${!miTienda}">
    			    <li class="breadcrumb-item"><a href="${fn:escapeXml(tiendasUrl)}"><i class="fa-solid fa-store icon-menu"></i> Tiendas</a></li>
    				<li class="breadcrumb-item active" aria-current="page"><c:out value="${tienda.nombre}" /></li>
    			</c:if>
    			<c:if test="${miTienda}">
    				<li class="breadcrumb-item active" aria-current="page"><i class="fa-solid fa-store icon-menu"></i> Mi Tienda</a></li>
    			</c:if>

  			</ol>
		</nav>
		<div class="col-md-12 py-1">
			<div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				<div class="col-auto d-none d-lg-block">
					<img src="<c:out value="${tienda.imagen}"/>" />
				</div>
				<div class="col p-4 d-flex flex-column position-static">
					<strong class="d-inline-block mb-2 text-primary" id="direccionTienda">
						<i class="fa-solid fa-location-dot"></i>
							<c:out value="${tienda.calle}" /> (<c:out value="${tienda.provincia}" />) CP: <c:out value="${tienda.codigoPostal}" />
					</strong>
					<h3 class="mb-0">${tienda.nombre}</h3>
					<c:if test="${not empty tienda.telefono}"><div class="mb-1 text-muted"><b>Teléfono:</b> ${tienda.telefono}</div></c:if>
					<c:if test="${not empty tienda.horario}"><div class="mb-1 text-muted"><b>Horario:</b> ${tienda.horario}</div></c:if>
					<c:if test="${not empty tienda.descripcion}"><div class="h5">${tienda.descripcion}</div></c:if>
				</div>
				</div>
				<div class="container col-xxl-12 px-4 py-2">
					<div class="row">
							<sec:authorize access="hasAuthority('admin')">
								<div id ="botones" class="d-grid gap-2">
									<a href="${fn:escapeXml(tiendaEditUrl)}" class="btn btn-outline-primary btn-lg px-4">
										Editar Tienda <i class="fa-solid fa-pen-to-square"></i>
									</a>
									<a href="${fn:escapeXml(tiendaDeleteUrl)}" class = "btn btn-outline-primary btn-lg px-4">
										Eliminar Tienda <i class="fa-solid fa-trash-can"></i>
									</a>
								</div>		
							</sec:authorize>
							<sec:authorize access="hasAuthority('vendedor')">
								<c:if test="${miTienda}">	
									<div id ="botones" class="d-grid gap-2 col-xl-6">		
										<a href="${fn:escapeXml(tiendaEditUrl)}" class="btn btn-outline-primary btn-lg px-4">
											Editar Tienda <i class="fa-solid fa-pen-to-square"></i>
										</a>	
										<a href="${fn:escapeXml(tiendaReservasUrl)}" class="btn btn-outline-primary btn-lg px-4">
											Ver Reservas <i class="fa-solid fa-basket-shopping"></i>
										</a>
									</div>		
									<div id ="botones2" class="d-grid gap-2 col-xl-6">
										<a href="${fn:escapeXml(tiendaDeleteUrl)}" class = "btn btn-outline-primary btn-lg px-4">
											Eliminar Tienda <i class="fa-solid fa-trash-can"></i>
										</a>
										<a href="${fn:escapeXml(nuevoProductoUrl)}" class="btn btn-outline-primary btn-lg px-4">
											Nuevo Producto <i class="fa-solid fa-plus"></i>
										</a>	
									</div>		
								</c:if>
							</sec:authorize>
						</div>
						
			</div>
		</div>
	</div>
		
	<h2>Productos de esta tienda:</h2>
	<br>

	<div class="row" style="margin-top: 2%">
		<div class="col-md-2 col-sm-12 col" id="intolerancias-preferencias">
			<div id="intolerancias" class="form-check">
				<h3>Intolerancias</h3>
			</div>
							<br>
							
							<div id="preferencias" class="form-check">
				<h3>Preferencias</h3>
				<input class="form-check-input" type="radio" name="preferencia" checked> NINGUNA <br>
			</div>
			
			<div id="boton-filtrar" class="d-grid gap-2"">
			</div>
		</div>
		<div class="col-md-10 col-sm-12 col-12">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3"
				id="productos"></div>
			<br>
			<div
				class="row row-cols-1 row-cols-sm-2 row-cols-md-2 g-3 d-md-flex justify-content-md-center"
				id="paginacionBox">
				<nav aria-label="Paginación productos">
					<ul id="paginacion"
						class="pagination d-md-flex justify-content-md-center">
						<li class="page-item disabled hidden" id="botonIzquierdaLi">
							<button class="page-link" id="botonIzquierda">
								<i class="fa fa-arrow-left"></i> Anterior
							</button>
						</li>
						<li class="page-item disabled hidden" id="botonDerechaLi">
							<button class="page-link" id="botonDerecha">
								Siguiente <i class="fa fa-arrow-right"></i>
							</button>
						</li>
					</ul>
				</nav>
			</div>
			<div
				class="row row-cols-1 row-cols-sm-2 row-cols-md-2 g-3 d-md-flex justify-content-md-center"
				id="leyendaPaginacion">
				<p class="leyenda d-md-flex justify-content-md-center" id="leyenda">
				</p>
			</div>
		</div>
	</div>

	<script type="text/javascript">
				var intols = new Array();
				<c:forEach items="${intolerancias}" var="intolerancia">
						intol = "${intolerancia}";
				 		if (!intols.includes(intol)){
					    	intols.push(intol);
				    		}
				</c:forEach>
				intols.forEach(intol=>createIntolsInputs(intol));
				function createIntolsInputs(intol){
					
					var input = document.createElement('input');
					input.className ="form-check-input";
					input.type ="checkbox";
					input.id = intol;
					input.value = intol;
					div = document.createElement('div');
					div.appendChild(input);
					div.className="mt-auto";
					var img = document.createElement('img');
					img.src = "${fn:escapeXml(intolImagenUrl)}"+intol.trim()+".png";
					img.className ="menu-pref-icon h-100";
					div.appendChild(img);
					div.innerHTML += " "+intol;
					intolerancias = document.getElementById("intolerancias");
					intolerancias.appendChild(div);						

				}
</script>
	<script type="text/javascript">
				var prefs = new Array();
				<c:forEach items="${preferencias}" var="preferencia">
				pref = "${preferencia}";
				 if (!prefs.includes(pref)){
					    prefs.push(pref);
				    }
				</c:forEach>
				if(prefs.length==1&&prefs.includes("TODO")){
					var preferencias = document.getElementById("preferencias");
					preferencias.className="hidden";
				}
				prefs.forEach(prefe=>createPrefsInputs(prefe));
				function createPrefsInputs(prefe){
					if(prefe!="TODO"){
						var input = document.createElement('input');
						input.className ="form-check-input";
						input.type ="radio";
						input.name = "preferencia";
						input.id = prefe;
						input.value = prefe;
						div = document.createElement('div');
						div.appendChild(input);
						div.className="mt-auto";
						var img = document.createElement('img');
						img.src = "${fn:escapeXml(prefImagenUrl)}"+prefe+".png";
						img.className ="menu-pref-icon h-100";
						div.appendChild(img);
						div.innerHTML += " "+prefe;
						
						preferencias = document.getElementById("preferencias");
						preferencias.appendChild(div);
						
					}

				}
</script>
	<script type="text/javascript">
		var numPagina = 1;
		var numProductosPorPagina = 6;
    	var productos = new Array();
    	var intolerancias = new Array();
        var preferencias = new Array();
		<c:forEach items="${productos}" var="producto">
			<c:if test="${producto.estado == 'ACEPTADO' || miTienda}">
		    productoDetails = new Object();
		    productoDetails.id =  "${producto.id}"; 
		    productoDetails.nombre = "${producto.nombre}";
		    productoDetails.precio = "${producto.precio}";
		    productoDetails.marca = "${producto.marca}";
		    productoDetails.imagen = "${producto.imagen}";
		    productoDetails.estado = "${producto.estado}";
		    productoDetails.tienda = "${producto.tienda.id}";
		    productoDetails.intolerancias = new Array();
		    <c:forEach items="${producto.intolerancia}" var="intolerancia">
		    	productoDetails.intolerancias.push("${intolerancia}");
		    	intolerancias.push("${intolerancia}");
		    </c:forEach>
		    productoDetails.preferencia = "${producto.preferencia}";
		    if (!preferencias.includes(productoDetails.preferencia)){
			    preferencias.push(productoDetails.preferencia);
		    }
		    productos.push(productoDetails);
		    </c:if>
		</c:forEach> 
		var numeroProductos = productos.length;
		var numeroPaginas = Math.ceil(numeroProductos/numProductosPorPagina);
		var botonesPaginas = new Array();
		var button = document.createElement('button');
		var productosFiltrados = [...productos];
		
		button.className="w-100 btn btn-outline-primary btn-lg px-4";
	  	prodHtml = "";
	  	button.innerHTML = "Filtrar";
	  	button.onclick = function(){
	  		productosFiltrados = [...productos];
	  		if(productosFiltrados.length>0){
	  			botonesPaginas.forEach(boton=> boton.remove());
		  		var selectedPreferencia = new Array();
				var selectedIntolerancias = new Array();
				document.getElementById('productos').innerHTML= prodHtml;
				
				preferencias.forEach(p => {
		  			if(document.getElementById(p) != null){
					 	if(document.getElementById(p).checked && !selectedPreferencia.includes(p)){
	 					  selectedPreferencia.push(p);
					 	}
		  			}
				  })
				if(selectedPreferencia.includes("VEGETARIANO")){
					selectedPreferencia.push("VEGANO");	
				}
		  		
		  		intolerancias.forEach(i => {
		  			if(document.getElementById(i) != null){
	  					if(document.getElementById(i).checked && !selectedIntolerancias.includes(i)){
						 	selectedIntolerancias.push(i);
						 }
		  			} 
				  })	
				  			  
				  if(selectedPreferencia.length > 0 || selectedIntolerancias.length > 0){
					  var indexListPreferencias = [];
					  var indexListIntolerancias = [];
					  if(selectedPreferencia.length > 0 ) {
						  productosFiltrados.forEach(e => {
								if(!(selectedPreferencia.includes(e.preferencia))){
								  var index = productosFiltrados.indexOf(e);
								  if(!(indexListPreferencias.includes(index))){
									  indexListPreferencias.push(index);
								  }
							  }
						  })
					  }
					  if(indexListPreferencias.length > 0){
						  indexListPreferencias = indexListPreferencias.reverse();
						  indexListPreferencias.forEach(i => {
							  productosFiltrados.splice(i, 1);
						  })
					  }
					  if(selectedIntolerancias.length > 0) {
						  productosFiltrados.forEach(e => {
							  selectedIntolerancias.forEach(i => {
								  if(e.intolerancias.includes(i)){
									  var index = productosFiltrados.indexOf(e);
									  if(!(indexListIntolerancias.includes(index))){
										  indexListIntolerancias.push(index);
									  }
								  }
							  })
						  }) 
					  }
					  if(indexListIntolerancias.length > 0){
						  indexListIntolerancias = indexListIntolerancias.reverse();
						  indexListIntolerancias.forEach(i => {
							  productosFiltrados.splice(i, 1);
						  })
					  }
				  } else {
					  productosFiltrados = [...productos];
				  }

		  		loadPages(productosFiltrados);
	  		}
	  		else{
	  			location.href = "${fn:escapeXml(productosUrl)}";
	  		}
	  		
		  };
		  
		  document.getElementById('boton-filtrar').appendChild(button);
		  loadPages(productosFiltrados);
		
		
		function loadPages(productos){
			numeroProductos = productos.length;
			numeroPaginas = Math.ceil(numeroProductos/numProductosPorPagina);
			var botonIzquierdaLi = document.getElementById("botonIzquierdaLi");
			var botonIzquierda = document.getElementById("botonIzquierda");
			var botonDerechaLi = document.getElementById("botonDerechaLi");
			var botonDerecha = document.getElementById("botonDerecha");
			var leyenda = document.getElementById("leyenda");
			botonesPaginas = new Array();
	
			if(numeroProductos==0){
				tituloError = document.createElement("h4");
				tituloError.innerHTML ="No hay productos registrados para esa busqueda";
				tituloError.className = "d-md-flex justify-content-md-center";
				var productosDiv = document.getElementById("productos");
				productosDiv.appendChild(tituloError);
				productosDiv.className = "row g-3 d-md-flex justify-content-md-center";
				leyenda.innerHTML ="";
				var intolpref = document.getElementById("intolerancias-preferencias");
				intolpref.remove();
				productosDiv.parentNode.className = "col";
				
			}else if(numeroProductos<=numProductosPorPagina){
				productos.forEach(producto => printProducto(producto));
				botonDerechaLi.className ="page-item disabled hidden";
				botonIzquierdaLi.className ="page-item disabled hidden";
				actualizaLeyendaPaginacion(1);
			}else{
				var primeraPaginaProductos = new Array();
				var botonesNumeroPagina = new Array();
				botonIzquierdaLi.className ="page-item disabled";
				botonDerechaLi.className ="page-item";
				
				for (var i=0;i<numeroPaginas;i++){
					var botonNumeroPaginaLi = document.createElement("li");
					botonNumeroPaginaLi.className="page-item";
					var botonNumeroPagina = document.createElement("button");
					botonNumeroPagina.innerHTML = i+1;
					botonNumeroPagina.id = "productos"+i;
					botonNumeroPagina.className ="page-link";	
					botonNumeroPaginaLi.appendChild(botonNumeroPagina);
					botonesPaginas[i] = botonNumeroPaginaLi;
				}	
				printPagina(1);
				actualizaLeyendaPaginacion(numPagina);
				botonesPaginas.forEach(crearBotonesPaginas);
	
			}
	}
		
		botonIzquierda.onclick = function(){
			if(numPagina>1){
				numPagina--;
				printPagina(numPagina);
			}
		}
		
		botonDerecha.onclick = function(){
			if(numPagina<numeroPaginas){
				numPagina++;
				botonIzquierdaLi.className="page-item";
				printPagina(numPagina);
			}
		}
		
		function crearBotonesPaginas(element,index,array){
			array[0].className = "page-item disabled";
			element.onclick = function(){
				numPagina = index+1;
				printPagina(numPagina);
			}
			var parentUl = botonDerechaLi.parentNode;
			parentUl.insertBefore(element,botonDerechaLi);
		}
		
		function actualizaLeyendaPaginacion(numPagina){
			var inicio = ((numPagina-1) * numProductosPorPagina)+1;
			var fin = Math.min(inicio+numProductosPorPagina-1,numeroProductos);
			leyenda.innerHTML = "Mostrando productos número " +inicio+" a "+ fin +" de "+numeroProductos;	
			
		}
		
		function actualizaBotonesNumeros(numPagina){
			botonesPaginas.forEach(boton => boton.className = "page-item");
			botonesPaginas[numPagina-1].className="page-item disabled";
		}
	
		function actualizaBotonesIzqDer(numPagina){
			if(numPagina==1){
				botonIzquierdaLi.className="page-item disabled";
			}else{
				botonIzquierdaLi.className="page-item";
			}	
			if(numPagina<numeroPaginas){
				botonDerechaLi.className="page-item";
			}else{
				botonDerechaLi.className="page-item disabled";
			}
		}
		
		function printPagina(numeroPagina){
			numPagina = numeroPagina;
			var primerProducto = (numeroPagina-1)*numProductosPorPagina;
			var ultimoProducto = Math.min(primerProducto+numProductosPorPagina,numeroProductos);
			document.getElementById("productos").innerHTML ="";
			for(var i=primerProducto;i<ultimoProducto;i++){
				printProducto(productosFiltrados[i]);
			}
			actualizaBotonesNumeros(numeroPagina);
			actualizaBotonesIzqDer(numeroPagina);
			actualizaLeyendaPaginacion(numeroPagina);	
		}
		
	
function printProducto(producto){
			
			var prodColumn = document.createElement('div');
			prodColumn.className = "col";
			

			var prodCard = document.createElement('div');
			prodCard.className = "card py-2 h-100 shadow-sm d-flex align-items-center justify-content-center";
			
			
			prodCard.id = "producto"+producto.id; 
	    
	    	var prodImagen = document.createElement('div');
	    	prodImagen.className = "h-100";
	    	prodImagen.id ="productThumbnail";
	    	prodImagen.title= producto.nombre;
			
			var img = document.createElement('img');
			img.src = producto.imagen;
			img.alt = producto.nombre;
			img.id = "productoImg";
	    
	 		var url = document.createElement("a");
	 		url.className="producto-img";
	 		url.href="${fn:escapeXml(productoUrl)}"+producto.id;
	 		url.appendChild(img);
	 		prodImagen.appendChild(url);

	    
	    	prodCard.appendChild(prodImagen);

	    	var prodCardBody = document.createElement('div');
	    	prodCardBody.className="card-body d-flex flex-column";
	    	
			var prodIntols = document.createElement('div');
			prodIntols.className="col-xl-12 mt-auto d-flex align-items-center justify-content-center intolsProd";
			
			if(producto.preferencia!='TODO'&&producto.preferencia!=null){
				var imgPref = document.createElement("img");
				imgPref.title = producto.preferencia.trim();
				imgPref.src = "${fn:escapeXml(prefImagenUrl)}"+producto.preferencia.trim()+".png";
				imgPref.className ="card prod-pref-icon shadow-sm";
				prodIntols.appendChild(imgPref);
			}
			
			
			producto.intolerancias.forEach(intol => appendImgIntol(intol));
			function appendImgIntol(intol){
				var imgIntol = document.createElement("img");
				imgIntol.title = intol.trim();
				imgIntol.src = "${fn:escapeXml(intolImagenUrl)}"+intol.trim()+".png";
				imgIntol.className ="card prod-intol-icon shadow-sm";
				prodIntols.appendChild(imgIntol);
			}
			
			prodCardBody.appendChild(prodIntols);

	    	var prodCardText = document.createElement('div');
	    	prodCardText.className="";
	    	prodCardText.title= producto.nombre;
	    	prodCardText.id = "productoInfo";
			prodCardText.innerHTML+="<h3 class='cortaTexto'>"+producto.nombre+"</h3>";

			var prodMarcaBox = document.createElement('div');
			prodMarcaBox.className="";
			var prodMarcaText = document.createElement('p');
			prodMarcaText.innerHTML+="Marca: "+producto.marca;
			
			prodMarcaBox.appendChild(prodMarcaText);
			prodCardText.appendChild(prodMarcaBox);
		
			
			prodCardBody.appendChild(prodCardText);

			var prodFooter = document.createElement('div');
			prodFooter.className="row d-flex justify-content-between mt-auto";
			
			var prodPrecioBox = document.createElement('div');
			prodPrecioBox.className="col-xl-12 d-flex align-items-center justify-content-end";
			prodPrecioBox.innerHTML+="<h3>"+producto.precio+"<span class='glyphicon glyphicon-euro' aria-hidden='true'></span>&#8364</h3>";
			
			prodFooter.appendChild(prodPrecioBox);
			
			
			
			var prodButtonGroup = document.createElement('div');
			prodButtonGroup.className = "d-grid gap-2";
			
			var urlVer = document.createElement("a");
			var button= document.createElement("button");
			button.className="w-100 btn btn-outline-primary btn-lg px-4";
			button.innerHTML = "Ver Producto <i class='fa-solid fa-eye'></i>";
	 		urlVer.href="${fn:escapeXml(productoUrl)}"+producto.id;
	 		urlVer.appendChild(button);
	 		prodButtonGroup.appendChild(urlVer);
			
	 		<c:if test="${miTienda}">	
		 		var urlEditar = document.createElement("a");
				var buttonEditar = document.createElement("button");
				buttonEditar.className="w-100 btn btn-outline-primary btn-lg px-4";
				buttonEditar.innerHTML = "Editar Producto <i class='fa-solid fa-pen-to-square'></i>";
				urlEditar.href="${fn:escapeXml(tiendaUrl)}"+producto.tienda+"/producto/" + producto.id + "/edit";
				urlEditar.appendChild(buttonEditar);
		 		prodButtonGroup.appendChild(urlEditar);
		 		var urlBorrar = document.createElement("a");
				var buttonBorrar= document.createElement("button");
				buttonBorrar.className="w-100 btn btn-outline-primary btn-lg px-4";
				buttonBorrar.innerHTML = "Borrar Producto <i class='fa-solid fa-trash-can'></i>";
				urlBorrar.href="${fn:escapeXml(tiendaUrl)}"+ producto.tienda + "/producto/" + producto.id + "/delete";
				urlBorrar.appendChild(buttonBorrar);
		 		prodButtonGroup.appendChild(urlBorrar); 	
		 		
		 		var estadoProducto = document.createElement("div");
		 		estadoProducto.className = "w-100 d-flex justify-content-center";
		 		
		 		if(producto.estado=="RECHAZADO"){
		 			estadoProducto.innerHTML = "<h4><i class='fa-solid fa-circle-xmark icon-menu'></i> "+producto.estado+"</h4>";
		 		}
		 		if(producto.estado=="ACEPTADO"){
		 			estadoProducto.innerHTML = "<h4><i class='fa-solid fa-check icon-menu'></i> "+producto.estado+"</h4>";
		 		}
		 		if(producto.estado=="PENDIENTE"){
		 			estadoProducto.innerHTML = "<h4><i class='fa-solid fa fa-clock-o icon-menu'></i> "+producto.estado+"</h4>";
		 		}

		 		prodButtonGroup.appendChild(estadoProducto);
		 		
 			</c:if>


	 		
	 		<sec:authorize access="hasAnyAuthority('admin','nutricionista')">
		 		var urlEditar = document.createElement("a");
				var buttonEditar= document.createElement("button");
				buttonEditar.className="w-100 btn btn-outline-primary btn-lg px-4";
				buttonEditar.innerHTML = "Editar Producto <i class='fa-solid fa-pen-to-square'></i>";
				urlEditar.href="${fn:escapeXml(tiendaUrl)}"+ producto.tienda + "/producto/" + producto.id + "/edit";
				urlEditar.appendChild(buttonEditar);
		 		prodButtonGroup.appendChild(urlEditar);
		 	</sec:authorize>
		 	<sec:authorize access="hasAuthority('admin')">
		 		var urlBorrar = document.createElement("a");
				var buttonBorrar= document.createElement("button");
				buttonBorrar.className="w-100 btn btn-outline-primary btn-lg px-4";
				buttonBorrar.innerHTML = "Borrar Producto <i class='fa-solid fa-trash-can'></i>";
				urlBorrar.href="${fn:escapeXml(tiendaUrl)}"+ producto.tienda + "/producto/" + producto.id + "/delete";
				urlBorrar.appendChild(buttonBorrar);
		 		prodButtonGroup.appendChild(urlBorrar); 		
		 	</sec:authorize>
		 	<sec:authorize access="hasAuthority('cliente')">
		 		var urlReservar = document.createElement("a");
				var buttonReservar = document.createElement("button");
				buttonReservar.className="w-100 btn btn-outline-primary btn-lg px-4";
				buttonReservar.innerHTML = "Reservar Producto <i class='fa-solid fa-basket-shopping'></i>";
				urlReservar.href="${fn:escapeXml(tiendaUrl)}"+ producto.tienda + "/producto/" + producto.id + "/reservar";
				urlReservar.appendChild(buttonReservar);
		 		prodButtonGroup.appendChild(urlReservar);
	 		</sec:authorize>
	 			 		
	 		
	 		prodFooter.appendChild(prodButtonGroup);
	 		prodCardBody.appendChild(prodFooter);
	 		prodCard.appendChild(prodCardBody);

	 		
	 		prodColumn.appendChild(prodCard);
			document.getElementById("productos").appendChild(prodColumn);
	};


	function onlyUnique(value, index, self) {
		  return self.indexOf(value) === index;
		};

</script>
</c:if>
<c:if test="${tienda.id == null}">
<div class="col-md-12">
<h3>No tienes todavÃ­a ninguna tienda</h3>
<p>Puedes crear una haciendo click en:</p> 
<br>
</div>

<div class="col-md-12">
<spring:url value="/tiendas/new" var="tiendaNew">
</spring:url>	
<a href="${fn:escapeXml(tiendaNew)}">
	<button class='btn btn-default btn-sm'>Crear tienda</button>
</a>
</div>
</c:if>
</petclinic:layout>
