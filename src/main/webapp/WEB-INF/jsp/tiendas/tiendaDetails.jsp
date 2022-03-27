<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:layout pageName="tiendas">

	<div class="row">
		<div class="col-md-6">
			<img src="<c:out value="${tienda.imagen}"/>" class="img-responsive" alt="Responsive image"/>
		</div>
		<div class="col-md-6">
			<h1><strong><c:out value="${tienda.nombre}"/></strong></h1>
			<br>
			<br>
			<dl>
				<dt>Localizaci&oacuten: </dt>
				<dd><c:out value="${tienda.calle}"/></dd>
				<br>
				<br>
				<dt>Horarios: </dt>
				<dd><c:out value="${tienda.horario}"/></dd>
			</dl>
		</div>
	</div>


	<br>
    <h2>Productos</h2>
    <br>

	<div class="row" style="margin-top: 2%">
		<div class="col-md-2">
			<div id="intolerancias">
				<h3>Intolerancias</h3>
				<c:forEach items="${intolerancias}" var="intolerancia">
					<input class="form-check-input" type="checkbox"
						id="${intolerancia}" />
					<c:out value="${intolerancia}"></c:out>
					</br>
					</br>
				</c:forEach>
			</div>
			<div id="preferencias">
				<h3>Preferencias</h3>
				<c:forEach items="${preferencias}" var="preferencia">
					<input class="form-check-input" type="checkbox" id="${preferencia}" />
					<c:out value="${preferencia}"></c:out>
					</br>
				</c:forEach>
				</br>
			</div>
		</div>
		<div class="col-md-10" id="productos"></div>
	</div>
	<spring:url value="/tienda/${tienda.id}/" var="tiendaUrl"></spring:url>
	<spring:url value="/producto/" var="productoUrl"></spring:url>
	<script type="text/javascript">
	
		function Buscar(){
		  var text = $("#busqueda").val();
		  location.href = "${fn:escapeXml(tiendaUrl)}"+text;
		}
		
    	var productos = new Array();

	
	/* TODO: rellenar los 2 siguientes arrays y crear un checkbox por cada ${preferencia} e ${intolerancia} (vienen del back, mientras se estan asignado en 1 y 2) */
	/* se deben poder marcar varias intolerancias perso solo una preferencia */
	
    	var intolerancias = new Array();
        var preferencias = new Array();
		<c:forEach items="${tienda.productos}" var="producto"> 
		    productoDetails = new Object();
		    productoDetails.id =  "${producto.id}"; 
		    productoDetails.nombre = "${producto.nombre}";
		    productoDetails.precio = "${producto.precio}";
		    productoDetails.marca = "${producto.marca}";
		    productoDetails.imagen = "${producto.imagen}";
		    productoDetails.intolerancias = new Array();
		    <c:forEach items="${producto.intolerancia}" var="intolerancia">
		    	productoDetails.intolerancias.push("${intolerancia}");
		    	intolerancias.push("${intolerancia}");/*1 - quitar cuando esten los checkbox*/
		    </c:forEach>

		    productoDetails.preferencia = "${producto.preferencia}";
		    preferencias.push(productoDetails.preferencia);/*2 - quitar cuando esten los checkbox*/
		    productos.push(productoDetails);
		</c:forEach> 
	
		productos.forEach(producto=> printProducto(producto));
		
		
	/*TODO: asignar a las siguientes variable las intolerancias seleccionadas y la preferencia*/
	/* ahora solo esta cogiendo la primera de todas las preferencias de la lista y todas las intolerancias disponibles*/
		
// 		var selectedPreferencia = preferencias.filter(onlyUnique)[0];
//  	var selectedIntolerancias = intolerancias.filter(onlyUnique);	
		//var selectedPreferencia = new Array();
		//var selectedIntolerancias = new Array();	

		var button = document.createElement('button');
	  	prodHtml = "";
	  	button.innerHTML = "Filtrar";
	  	button.onclick = function(){
	  		
	  		var selectedPreferencia = new Array();
			var selectedIntolerancias = new Array();
			document.getElementById('productos').innerHTML= prodHtml;
			var productosFiltrados = [...productos];
	  		preferencias.forEach(p => {
				  if(document.getElementById(p).checked && !selectedPreferencia.includes(p)){
 					  selectedPreferencia.push(p);
				  }
			  })
	  		
	  		intolerancias.forEach(i => {
				  if(document.getElementById(i).checked && !selectedIntolerancias.includes(i)){
					  selectedIntolerancias.push(i);
				  }
			  })
			  			  
			  if(selectedPreferencia.length > 0 || selectedIntolerancias.length > 0){
				  var indexListPreferencias = [];
				  var indexListIntolerancias = [];
				  if(selectedPreferencia.length > 0 ) {
					  productosFiltrados.forEach(e => {
						  if(!(e.preferencia == selectedPreferencia[0])){
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
				  productosFiltrados = [...productos]
			  }
	  			productosFiltrados.forEach(producto=> printProducto(producto));
			  
		  };
			
		  document.getElementById('preferencias').appendChild(button);
		
	
	function printProducto(producto){
		
		var prodDiv = document.createElement('div'); 
		prodDiv.className = "col-md-4";
		prodDiv.id = "prodDiv";       
		
		var img = document.createElement('img');
		img.src = producto.imagen;
		img.alt = "Imagen no encontrada";
		img.id = "imagen"
		img.height="200";
// 		img.width="auto";
 		img.style="margin:0px 50px";
		
 		var url = document.createElement("a");
 		url.href="${fn:escapeXml(productoUrl)}"+producto.id;
 		
 		url.appendChild(img);
		
 		prodDiv.appendChild(url);
 		
		var url2 = document.createElement("a");
		url2.href="${fn:escapeXml(productoUrl)}"+producto.id;
 		url2.innerHTML+= "<h2>"+producto.nombre+"</h2>";
 		prodDiv.appendChild(url2);
 		
		prodDiv.innerHTML+= "<h3>"+producto.precio+" &#8364, marca "+producto.marca+"</h3><br>";
		document.getElementById('productos').appendChild(prodDiv);
	
		/*TODO: crear aqui la estructura de un producto en la lista (se puede basar en lo que esta comentado de arriba) usando ya un objeto JS (producto) y no una variable de spring (${producto})*/
// 		document.getElementById('productos').innerHTML+= "<p>"+producto.nombre+"</p>";
	};

	function onlyUnique(value, index, self) {
		  return self.indexOf(value) === index;
		};

</script>
</petclinic:layout>
