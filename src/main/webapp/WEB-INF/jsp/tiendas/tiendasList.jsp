<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<petclinic:layout pageName="tiendasList">

	<h2>Tiendas</h2>
	
	<style>
/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
}

/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
</style>

	<script>
		function Buscar(){
		  var text = $("#busquedaCP").val();
		  location.href = "/tiendas/"+text;
		}
</script>
<!-- <div class="row">
			<div class="col-sm-11">
				<input id="busquedaCP" type="text" class="form-control"
					placeholder="Busqueda de tiendas por Código postal...">
			</div>
			<div class="col-sm-1">
				<button class="btn btn-default" onClick="Buscar()">Buscar</button>
			</div></div></br> -->
			
			<button id="myBtn">Búsqueda de tiendas</button></br></br></br>
			
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">

    		<div class="row">
				<div class="col-sm-8">
				<input id="busquedaCP" type="text" class="form-control"
					placeholder="Busqueda de tiendas por Código postal...">
			</div>
			<div class="col-sm-1">
				<button class="btn btn-default" onClick="Buscar()">Buscar</button>
			</div>
			<div class="col-sm-1">
				<span class="close">&times;</span>
			</div></div>
			
  </div>

</div>

<script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>
	
	<div class="row">
		<c:forEach items="${tiendas}" var="tienda">
		<div class="col-md-3">
			<div >
				<spring:url value="/tienda/{tiendaId}" var="tiendaUrl">
				<spring:param name="tiendaId" value="${tienda.id}" />
				</spring:url>
				<a href="${fn:escapeXml(tiendaUrl)}">
				<img src="<c:out value="${tienda.imagen}"/>" class="img-responsive" alt="Responsive image"/></a>
				<a href="${fn:escapeXml(tiendaUrl)}"><c:out value="${tienda.nombre}"/></a>
				
			</div>

		</div></c:forEach>
	</div>
	
</petclinic:layout>
