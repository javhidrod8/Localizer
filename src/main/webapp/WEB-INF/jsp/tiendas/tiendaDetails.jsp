<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<petclinic:layout pageName="tiendas">

	<div class="row">
		<div class="col-md-6">
			<img src="<c:out value="${tienda.imagen}"/>" class="img-responsive"
				alt="Responsive image" />
		</div>
		<div class="col-md-6">
		
		<div class="infoTienda">
  			<h1><c:out value="${tienda.nombre}" /></h1>
			<dl>
							<dt>Descripción:</dt>
				<dd>
					<c:out value="${tienda.descripcion}" />
				</dd>
				<dt><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> Localizaci&oacuten:</dt>
				<dd>
					<p><c:out value="${tienda.calle}" /></p>
					<p><c:out value="${tienda.provincia}" /></p>
					<p><c:out value="${tienda.codigoPostal}" /></p>
				</dd>
				<dt><span class="glyphicon glyphicon-time" aria-hidden="true"></span> Horarios:</dt>
				<dd>
					<c:out value="${tienda.horario}" />
				</dd>
				<dt><span class="glyphicon glyphicon-phone" aria-hidden="true"></span>Teléfono:</dt>
				<dd>
					<c:out value="${tienda.telefono}" />
				</dd>
			</dl>
</div>

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
		button.className="btn btn-default";
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
		prodDiv.className = "col-sm-6 col-md-4";
		prodDiv.id = "producto"; 
    
    	var thumbnail = document.createElement('div');
    	thumbnail.className = "thumbnail";
    	thumbnail.id ="productThumbnail";
		
		var img = document.createElement('img');
		img.src = producto.imagen;
		img.alt = producto.nombre;
		img.id = "productoImg";
    
 		var url = document.createElement("a");
 		url.href="${fn:escapeXml(productoUrl)}"+producto.id;
 		url.appendChild(img);
    	thumbnail.appendChild(url);

    
    	var caption = document.createElement('div'); 
		caption.className = "caption";
		caption.id = "productoInfo";
		if(producto.nombre.length>=30){
	    	caption.innerHTML+="<h3>"+producto.nombre.substring(0,30)+"...</h3>";
		}else{
	    	caption.innerHTML+="<h3>"+producto.nombre+"</h3>";
		}

    	caption.innerHTML+="<p> Marca: "+producto.marca+"</p>"
    	caption.innerHTML+="<h3>"+producto.precio+"<span class='glyphicon glyphicon-euro' aria-hidden='true'></span></h3>";
    	caption.innerHTML+="<button class='btn btn-default btn-sm'>Resevar</button>";
    	thumbnail.appendChild(caption);
    	prodDiv.appendChild(thumbnail);
		document.getElementById('productos').appendChild(prodDiv);
	};

	function onlyUnique(value, index, self) {
		  return self.indexOf(value) === index;
		};

</script>
</petclinic:layout>
