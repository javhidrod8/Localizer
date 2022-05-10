<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<petclinic:layout pageName="tiendasList">
	<spring:url value="/tienda/" var="tiendaUrl"></spring:url>
	<link href="/resources/css/tiendas.css" rel="stylesheet">

<div class="container col-xxl-12 px-4 py-5">
		<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='currentColor'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
  			<ol class="breadcrumb">
    			<li class="breadcrumb-item"><a href="${fn:escapeXml(inicioUrl)}"><i class="fa-solid fa-house icon-menu"> </i> Inicio</a></li>
    			<li class="breadcrumb-item active" aria-current="page"><i class="fa-solid fa-store icon-menu"> </i> Tiendas</li>
  			</ol>
		</nav>
	<h2>
		<i class="fa-solid fa-store icon-menu"></i> Tiendas
	</h2>
	<div class="row barra-busqueda">
		<div class="col-sm-12">
			<div class="input-group mb-3">

				<input id="busqueda" type="text" class="form-control"
					placeholder="Busqueda por CP..."
					<c:if test="${codigoPostal!=null}"> value="${codigoPostal}"</c:if>
					aria-label="Busqueda por CP..." aria-describedby="button-busqueda">
				<button class="btn btn-md btn-outline-secondary btn-primary"
					type="button" id="button-busqueda" onClick="Buscar()">Buscar</button>
			</div>
		</div>

	</div>

	<div class="container">
		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-2 g-3"
			id="tiendas"></div>
		<br>
		<div
			class="row row-cols-1 row-cols-sm-2 row-cols-md-2 g-3 d-md-flex justify-content-md-center"
			id="paginacionBox">
			<nav aria-label="Paginación tiendas">
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
			id="leyendaPaginacion"><p class="leyenda d-md-flex justify-content-md-center" id="leyenda"></p></div>
	</div>
</div>
	<script>
	const node = document.getElementById("busqueda");
	node.addEventListener("keyup", ({key}) => {
	    if (key === "Enter") {
	        Buscar();
	    }
	})
	
	
	
		function Buscar() {
			var text = $("#busqueda").val();
			location.href = "/tiendas/search/" + text;
		}
	</script>

	<script>
		var numPagina = 1;
		var numTiendasPorPagina = 4;
		var tiendas = new Array();
		<c:forEach items="${tiendas}" var="tienda">
		var tiendaDetails = new Object();
		tiendaDetails.numProducts = 0;
		tiendaDetails.id = ${tienda.id};
		tiendaDetails.nombre = "${tienda.nombre}";
		tiendaDetails.descripcion = "${tienda.descripcion}";
		tiendaDetails.imagen = "${tienda.imagen}";
		tiendaDetails.direccion = "${tienda.calle}" + " "
				+ "${tienda.provincia}" + " " + "${tienda.codigoPostal}";
		<c:forEach items="${tienda.productos}" var="productos">
		tiendaDetails.numProducts++;
		</c:forEach>
		tiendas.push(tiendaDetails);
		</c:forEach>
		var numeroTiendas = tiendas.length;
		var numeroPaginas = Math.ceil(numeroTiendas/numTiendasPorPagina );
		var botonIzquierdaLi = document.getElementById("botonIzquierdaLi");
		var botonIzquierda = document.getElementById("botonIzquierda");
		var botonDerechaLi = document.getElementById("botonDerechaLi");
		var botonDerecha = document.getElementById("botonDerecha");
		var leyenda = document.getElementById("leyenda");
		var botonesPaginas = new Array();

		if(numeroTiendas==0){
			tituloError = document.createElement("h4");
			tituloError.innerHTML ="No hay tiendas registradas con ese Codigo Postal";
			document.getElementById("tiendas").appendChild(tituloError);
		}
		
		if(numeroTiendas<=numTiendasPorPagina){
			tiendas.forEach(tienda => printTienda(tienda));
			botonDerechaLi.className ="page-item disabled hidden";
			botonIzquierdaLi.className ="page-item disabled hidden";
			actualizaLeyendaPaginacion(1);
		}else{
			var primeraPaginaTiendas = new Array();

			var botonesNumeroPagina = new Array();
			botonIzquierdaLi.className ="page-item disabled";
			botonDerechaLi.className ="page-item";
			
			for (var i=0; i<numTiendasPorPagina;i++){
				primeraPaginaTiendas.push(tiendas[i]);
				
			}
			primeraPaginaTiendas.forEach(tienda=>printTienda(tienda));
			for (var i=0;i<numeroPaginas;i++){
				var botonNumeroPaginaLi = document.createElement("li");
				botonNumeroPaginaLi.className="page-item";
				var botonNumeroPagina = document.createElement("button");
				botonNumeroPagina.innerHTML = i+1;
				botonNumeroPagina.id = "tiendas"+i;
				botonNumeroPagina.className ="btn page-link";	
				botonNumeroPaginaLi.appendChild(botonNumeroPagina);
				botonesPaginas[i] = botonNumeroPaginaLi;
			}	
			actualizaLeyendaPaginacion(numPagina);
			botonesPaginas.forEach(crearBotonesPaginas);
			
			function crearBotonesPaginas(element,index,array){
				array[0].className = "page-item disabled";
				element.onclick = function(){
					numPagina = index+1;
					printPagina(numPagina);
				}
				var parentUl = botonDerechaLi.parentNode;
				parentUl.insertBefore(element,botonDerechaLi);
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
			
			function actualizaLeyendaPaginacion(numPagina){
				var inicio = ((numPagina-1) * numTiendasPorPagina)+1;
				var fin = Math.min(inicio+numTiendasPorPagina-1,numeroTiendas);
				leyenda.innerHTML = "Mostrando tiendas número " +inicio+" a "+ fin +" de "+numeroTiendas;	
				
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
			var primeraTienda = (numeroPagina-1)*numTiendasPorPagina;
			var ultimaTienda = Math.min(primeraTienda+numTiendasPorPagina,numeroTiendas);
			document.getElementById("tiendas").innerHTML ="";
			for(var i=primeraTienda;i<ultimaTienda;i++){
				printTienda(tiendas[i]);
			}
			actualizaBotonesNumeros(numeroPagina);
			actualizaBotonesIzqDer(numeroPagina);
			actualizaLeyendaPaginacion(numeroPagina);	
		}
		
		function printTienda(tienda){
			var tiendaCol = document.createElement("div");
			tiendaCol.className = "col";
			
			var tiendaCard = document.createElement("div");
			tiendaCard.className = "card shadow-sm rounded d-flex flex-column";
			var tiendaLink = document.createElement("a");
			tiendaLink.href = "${fn:escapeXml(tiendaUrl)}"+tienda.id;
			tiendaLink.className ="card-img-top rounded d-flex justify-content-between mt-auto";
			var tiendaImagen = document.createElement("img");
			tiendaImagen.src = tienda.imagen;
			tiendaImagen.className = "img-fluid";
			tiendaImagen.alt = tienda.nombre;
			
			tiendaLink.appendChild(tiendaImagen);
			tiendaCard.appendChild(tiendaLink);
			
			var tiendaBody = document.createElement("div");
			tiendaBody.className = "card-body mt-auto";
			
			var tiendaNombre = document.createElement("h2");
			tiendaNombre.innerHTML = tienda.nombre;
			tiendaNombre.className = "card-text";
			
			tiendaBody.appendChild(tiendaNombre);
			var tiendaDescripcion = document.createElement("p");
			tiendaDescripcion.className ="lead";
			tiendaDescripcion.innerHTML = tienda.descripcion;
			
			tiendaBody.appendChild(tiendaDescripcion);
			

			var tiendaBotonesBox = document.createElement("div");
			tiendaBotonesBox.className = "d-flex justify-content-between align-items-center mt-auto";
			
			var tiendaDireccion = document.createElement("h5");
			tiendaDireccion.innerHTML = tienda.direccion;
			tiendaBotonesBox.appendChild(tiendaDireccion);
			
			var tiendaBotonesGroup = document.createElement("div");
			tiendaBotonesGroup.className = "btn-group";
			
			var tiendaVerUrl = document.createElement("a");
			tiendaVerUrl.href = tiendaLink.href;
			
			var tiendaBotonVer = document.createElement("button");
			tiendaBotonVer.className = "w-100 btn btn-outline-primary btn-lg px-4";
			tiendaBotonVer.innerHTML ="<i class='fa-solid fa-eye'></i> Ver tienda";
			
			tiendaVerUrl.appendChild(tiendaBotonVer);
			tiendaBotonesGroup.appendChild(tiendaVerUrl);
			tiendaBotonesBox.appendChild(tiendaBotonesGroup);
			
			tiendaBody.appendChild(tiendaBotonesBox);
			
			tiendaCard.appendChild(tiendaBody);
			tiendaCol.appendChild(tiendaCard);
			
			document.getElementById("tiendas").appendChild(tiendaCol);
			
		}
		
	</script>







</petclinic:layout>
