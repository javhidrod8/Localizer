

<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<petclinic:layout pageName="home">
	<spring:url value="/resources/images/tiendas.png" htmlEscape="true"
		var="tiendasImagen" />
	<spring:url value="/tiendas/" var="tiendasUrl"/>
	<spring:url value="/productos/" var="productosUrl"/>

	<script src="https://unpkg.com/typewriter-effect@2.3.1/dist/core.js"></script>
	
	<div class="container col-xxl-12 px-4 py-5">
			<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='currentColor'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
  			<ol class="breadcrumb">
    				<li class="breadcrumb-item active" aria-current="page"><i class="fa-solid fa-house icon-menu"> </i> Inicio</li>
  			</ol>
		</nav>
		<div class="row align-items-md-stretch">
			 <div class="col-md-12 d-flex justify-content-sm-center">
			 	<h1>Bienvenid@ a Localizer</h1>
			 </div>
			
		</div>
		
	    <div class="row align-items-md-stretch">
	      <div class="col-md-6">
	        <div class="h-100 p-5">
	  			<img src="resources/images/tiendas.png" class="img-fluid border rounded-3 shadow-lg mb-4 w-100 mt-auto" alt="Bienvenido">
	        </div>
	      </div>
	      <div class="col-md-6">
	        <div class="h-100 p-5">
				<div class="lead" id="servicios"></div>
	        </div>
	      </div>
	    </div>
	  <div class="container col-xxl-12 px-4 py-2">  
	  
	  								<div id ="botones" class="d-grid gap-2 d-md-flex justify-content-md-end py-2">
									<a href="${fn:escapeXml(productosUrl)}" class="w-50 btn btn-outline-primary btn-lg px-4">
										<i class="fa-solid fa-bowl-food"></i> Ver Productos 
									</a>
									<a href="${fn:escapeXml(tiendasUrl)}" class = "w-50 btn btn-outline-primary btn-lg px-4">
										<i class="fa-solid fa-store"></i> Ver Tiendas 
									</a>
								</div>	

		</div>
	</div>
	<script>
		servicios = document.getElementById('servicios');
		typewriter2 = new Typewriter(servicios, {
			loop : false,
			cursor : '',
			delay : 50
		});
		typewriter2
				.typeString(
						`<h2 id="titulo">Su lugar de confianza para encontrar negocios locales y los productos más adecuados para usted.</h2>`)
				.typeString(`<h3>Nuestros servicios:</h3>`)
				.typeString(
						`<li><h3>Posibilidad de reservar productos de una tienda</h3></li>`)
				.typeString(`<ul id="servicios">`)
				.typeString(
						`<li><h3>Filtro de productos según intolerancias y preferencias alimenticias</h3></li>`)
				.typeString(
						`<li><h3>Busqueda de tiendas y sus catálogos de productos</h3></li>`)
				.start();
	</script>
</petclinic:layout>