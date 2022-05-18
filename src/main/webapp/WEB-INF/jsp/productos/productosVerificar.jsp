<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<petclinic:layout pageName="productosList">
	<link href="/resources/css/productos.css" rel="stylesheet">
	<spring:url value="/productos/" var="productosUrl"></spring:url>
	<spring:url value="/producto/" var="productoUrl"></spring:url>
	<spring:url value="/tienda/" var="tiendaUrl"></spring:url> 
	
	
<div class="container col-xxl-12 px-4 py-5">
	<h2>
		<i class='fa-solid fa-check'></i> Productos por Verificar
	</h2>
	<div class="row" style="margin-top: 2%">
		<div class="col-md-12 col-sm-12 col-12">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3"
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
	<script type="text/javascript">
		var numPagina = 1;
		var numProductosPorPagina = 9;
    	var productos = new Array();
		<c:forEach items="${productos}" var="producto">
			<c:if test="${producto.estado == 'PENDIENTE'}">
		    productoDetails = new Object();
		    productoDetails.id =  "${producto.id}"; 
		    productoDetails.nombre = "${producto.nombre}";
		    productoDetails.precio = "${producto.precio}";
		    productoDetails.marca = "${producto.marca}";
		    productoDetails.imagen = "${producto.imagen}";
		    productoDetails.estado = "${producto.estado}";
		    productoDetails.tienda = "${producto.tienda.id}";
		    productoDetails.intolerancias = new Array();
		    productos.push(productoDetails);
		    </c:if>
		</c:forEach> 
		var numeroProductos = productos.length;
		var numeroPaginas = Math.ceil(numeroProductos/numProductosPorPagina);
		var botonesPaginas = new Array();
		var button = document.createElement('button');
		var productosFiltrados = [...productos];
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
				tituloError.innerHTML ="No hay productos por verificar";
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
	 		
	 		<sec:authorize access="hasAuthority('nutricionista')">
		 		var urlEditar = document.createElement("a");
				var buttonEditar= document.createElement("button");
				buttonEditar.className="w-100 btn btn-outline-primary btn-lg px-4";
				buttonEditar.innerHTML = "<i class='fa-solid fa-check'></i> Verificar Producto";
				urlEditar.href="${fn:escapeXml(tiendaUrl)}"+ producto.tienda + "/producto/" + producto.id + "/edit";
				urlEditar.appendChild(buttonEditar);
		 		prodButtonGroup.appendChild(urlEditar);
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
