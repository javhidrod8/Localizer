<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<petclinic:layout pageName="productosList">
	<link href="/resources/css/productos.css" rel="stylesheet">
	<link href="/resources/css/sidebars.css" rel="stylesheet">
	<spring:url value="/resources/images/preferencias/" var="prefImagenUrl"></spring:url>	
	<spring:url value="/resources/images/intolerancias/" var="intolImagenUrl"></spring:url>	
	
	<spring:url value="/productos/" var="productosUrl"></spring:url>
	<spring:url value="/producto/" var="productoUrl"></spring:url>
	<spring:url value="/productos/search/" var="searchUrl"></spring:url>
	<spring:url value="/tienda/" var="tiendaUrl"></spring:url> 
	<spring:url value="/" var="inicioUrl"></spring:url> 
	
		<sec:authorize access="hasAuthority('admin')">
			<spring:url value="/tienda/{tiendaId}/producto/{productoId}/edit"
				var="editarMiProductoUrl">
				<spring:param name="tiendaId" value="${producto.tienda.id}" />
				<spring:param name="productoId" value="${producto.id}" />
			</spring:url>
			<spring:url value="/tienda/{tiendaId}/producto/{productoId}/delete"
				var="borrarMiProductoUrl">
				<spring:param name="tiendaId" value="${producto.tienda.id}" />
				<spring:param name="productoId" value="${producto.id}" />
			</spring:url>
	</sec:authorize>
	
<div class="container col-xxl-12 px-4 py-5">

		<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='currentColor'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
  			<ol class="breadcrumb">
    			<li class="breadcrumb-item"><a href="${fn:escapeXml(inicioUrl)}"><i class="fa-solid fa-house icon-menu"> </i> Inicio</a></li>
    			<li class="breadcrumb-item active" aria-current="page"><i class="fa-solid fa-bowl-food icon-menu"> </i> Productos</li>
  			</ol>
		</nav>

	<h2>
		<i class="fa-solid fa-bowl-food icon-menu"></i> Productos
	</h2>


	<div class="row barra-busqueda">
		<div class="col-sm-12">
			<div class="input-group mb-3">

				<input id="busqueda" type="text" class="form-control"
					<c:if test="${name!=null}"> value="${name}"</c:if>
					placeholder="Busqueda de productos..."
					aria-label="Busqueda de productos..."
					aria-describedby="button-busqueda">
				<button class="btn btn-md btn-outline-secondary btn-primary"
					type="button" id="button-busqueda" onClick="Buscar()">Buscar</button>
			</div>
		</div>

	</div>

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
			<div id="boton-filtrar" class="d-grid gap-2">
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
							<button class="btn page-link" id="botonIzquierda">
								<i class="fa fa-arrow-left"></i> Anterior
							</button>
						</li>
						<li class="page-item disabled hidden" id="botonDerechaLi">
							<button class="btn page-link" id="botonDerecha">
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

</div>
	<script>
	const node = document.getElementById("busqueda");
	node.addEventListener("keyup", ({key}) => {
	    if (key === "Enter") {
	        Buscar();
	    }
	})
	function Buscar(){
		  var text = $("#busqueda").val();
		  location.href = "${fn:escapeXml(searchUrl)}"+text;
		}
</script>
	<script type="text/javascript">
				var intols = new Array();
				<c:forEach items="${intolerancias}" var="intolerancia">
						intol = "${intolerancia}";
				 		if (!intols.includes(intol)){
					    	intols.push(intol);
				    		}
				</c:forEach>
				intols.sort().forEach(intol=>createIntolsInputs(intol));
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
		var numProductosPorPagina = 9;
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
	  	button.innerHTML = "<i class='fa-solid fa-filter'></i> Filtrar";
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
					botonNumeroPagina.className ="btn page-link";	
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
			
			
			producto.intolerancias.sort().forEach(intol => appendImgIntol(intol));
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
			button.innerHTML = "<i class='fa-solid fa-eye'></i> Ver Producto";
	 		urlVer.href="${fn:escapeXml(productoUrl)}"+producto.id;
	 		urlVer.appendChild(button);
	 		prodButtonGroup.appendChild(urlVer);
	 		
	 		<sec:authorize access="hasAuthority('admin')">
		 		var urlBorrar = document.createElement("a");
				var buttonBorrar= document.createElement("button");
				buttonBorrar.className="w-100 btn btn-outline-primary btn-lg px-4";
				buttonBorrar.innerHTML = "<i class='fa-solid fa-trash-can'></i>  Borrar Producto ";
				urlBorrar.href="${fn:escapeXml(tiendaUrl)}"+ producto.tienda + "/producto/" + producto.id + "/delete";
				urlBorrar.appendChild(buttonBorrar);
		 		prodButtonGroup.appendChild(urlBorrar);
	 		</sec:authorize>
	 		
	 		<sec:authorize access="hasAuthority('nutricionista')">
		 		var urlEditar = document.createElement("a");
				var buttonEditar= document.createElement("button");
				buttonEditar.className="w-100 btn btn-outline-primary btn-lg px-4";
				buttonEditar.innerHTML = "<i class='fa-solid fa-pen-to-square'></i> Editar Producto ";
				urlEditar.href="${fn:escapeXml(tiendaUrl)}"+ producto.tienda + "/producto/" + producto.id + "/edit";
				urlEditar.appendChild(buttonEditar);
		 		prodButtonGroup.appendChild(urlEditar);
	 		</sec:authorize>
	 		
	 		<sec:authorize access="hasAuthority('cliente')">
		 		var urlReservar = document.createElement("a");
				var buttonReservar = document.createElement("button");
				buttonReservar.className="w-100 btn btn-outline-primary btn-lg px-4";
				buttonReservar.innerHTML = "<i class='fa-solid fa-basket-shopping'></i> Reservar Producto";
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
</petclinic:layout>
