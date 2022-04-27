<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- %@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %-->  

<petclinic:layout pageName="home">
<!--     <h2>Bienvenid@ a Localizer</h2> -->
<!--     <div class="row"> -->
<!--         <div class="col-md-12"> -->
<%--             <spring:url value="/resources/images/tiendas.png" htmlEscape="true" var="tiendasImagen"/> --%>
<%--             <img class="tiendas img-responsive" src="${tiendasImagen}"/> --%>
<!--         </div> -->
<!--     </div> -->



<script src="https://unpkg.com/typewriter-effect@2.3.1/dist/core.js"></script>

<div class="container">
  <div class="row">
    <div class="col-md-12">
     <h1>Bienvenido a Localizer</h1> 
    </div>
    <div class="col-md-12" id="servicios" >
    </div>

				<spring:url
					value="/tiendas/" var="tiendasUrl">
				</spring:url>
				<spring:url
					value="/productos/" var="productosUrl">
				</spring:url>
				<a href="${fn:escapeXml(productosUrl)}">
				<button class = "btn btn-default">Ver Productos</button>
				</a>
				<a href="${fn:escapeXml(tiendasUrl)}">
				<button class = "btn btn-default">Ver Tiendas</button>
				</a>
  </div>
 
  <div class=""></div>
</div>

<script>

servicios = document.getElementById('servicios');

typewriter2 = new Typewriter(servicios, {
    loop: false,
    cursor: ''
});
typewriter2.typeString(`<h2 id="titulo">Su lugar de confianza para encontrar negocios locales y los productos más adecuados para usted.</h2>`)
  .typeString(`<h3>Nuestros servicios:</h3>`).typeString(`<li><h3>Posibilidad de reservar productos de una tieda</h3></li>`).typeString(`<ul id="servicios">`).typeString(`<li><h3>Filtro de productos según intolerancias y preferencias alimenticias</h3></li>`).typeString(`<li><h3>Busqueda de tiendas y sus catálogos de productos</h3></li>`)
    .start();

</script>
</petclinic:layout>
