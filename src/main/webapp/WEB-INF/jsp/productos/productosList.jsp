<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<petclinic:layout pageName="productosList">
	<spring:url value="/productos/" var="productosUrl"></spring:url>
	<spring:url value="/producto/" var="productoUrl"></spring:url>
	<spring:url value="/productos/search/" var="searchUrl"></spring:url>
	<h2>Productos</h2>
	<br>

	<script>
		function Buscar(){
		  var text = $("#busqueda").val();
		  location.href = "${fn:escapeXml(searchUrl)}"+text;
		}
</script>
	<div class="row">
			<div class="col-sm-11">
				<input id="busqueda" type="text" class="form-control"
					placeholder="Busqueda de productos...">
			</div>
			<div class="col-sm-1">
				<button class="btn btn-default" onClick="Buscar()">Buscar</button>
			</div>

	</div>
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
				<input class="form-check-input" type="radio" name = "preferencia" checked> NINGUNA </br></input>
				<c:forEach items="${preferencias}" var="preferencia">
					<c:if	test="${preferencia != 'TODO'}"> 
					<input class="form-check-input" type="radio" name = "preferencia" id="${preferencia}" />	
					
					<c:out value="${preferencia}"></c:out></c:if>
					</br>
				</c:forEach>
				</br>
			</div>
		</div>
		<div class="col-md-10" id="productos"></div>
	</div>
	<script type="text/javascript">
	

    var productos = new Array();

	
	/* TODO: rellenar los 2 siguientes arrays y crear un checkbox por cada ${preferencia} e ${intolerancia} (vienen del back, mientras se estan asignado en 1 y 2) */
	/* se deben poder marcar varias intolerancias perso solo una preferencia */
	
    	var intolerancias = new Array();
        var preferencias = new Array();
		<c:forEach items="${productos}" var="producto">
			<c:if test="${producto.estado == 'ACEPTADO'}">
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
		    	intolerancias.push("${intolerancia}");/*1 - quitar cuando esten los checkbox*/
		    </c:forEach>

		    productoDetails.preferencia = "${producto.preferencia}";
		    preferencias.push(productoDetails.preferencia);/*2 - quitar cuando esten los checkbox*/
		    productos.push(productoDetails);
		    </c:if>
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
	  			if(document.getElementById(p) != null){
				 	if(document.getElementById(p).checked && !selectedPreferencia.includes(p)){
 					  selectedPreferencia.push(p);
				 	}
	  			}
			  })
	  		
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
// 		prodDiv.style = "object-fit: cover";
		img.id = "productoImg";
    
 		var url = document.createElement("a");
 		url.className="producto-img";
 		url.href="${fn:escapeXml(productoUrl)}"+producto.id;
 		url.appendChild(img);
    	thumbnail.appendChild(url);

    
    	var caption = document.createElement('div'); 
		caption.className = "caption";
		caption.id = "productoInfo";
		if(producto.nombre.length>=30){
	    	caption.innerHTML+="<h3>"+producto.nombre.substring(0,25)+"...</h3>";
		}else{
	    	caption.innerHTML+="<h3>"+producto.nombre+"</h3>";
		}

    	caption.innerHTML+="<p> Marca: "+producto.marca+"</p>"
    	caption.innerHTML+="<h3>"+producto.precio+"<span class='glyphicon glyphicon-euro' aria-hidden='true'></span></h3>";
    	
    	
    	urlVer = document.createElement("a");
    	button="<button class='btn btn-default btn-sm'>Ver</button>";
 		urlVer.href="${fn:escapeXml(productoUrl)}"+producto.id;
 		urlVer.innerHTML = button;
 		urlVer.className = "edit-btn";
 		caption.appendChild(urlVer);
 		
    	<c:if test="${auth == 'vendedor'&&producto.tienda==tiendaId}">
	    	urlVer = document.createElement("a");
	    	button="<button class='btn btn-default btn-sm'>Editar</button>";
	 		urlVer.href="${fn:escapeXml(tiendaUrl)}"+producto.tienda+"/producto/"+producto.id+"/edit";
	 		urlVer.innerHTML = button;
	 		urlVer.className = "edit-btn";
	 		caption.appendChild(urlVer);
 		</c:if>
 		<c:if test="${auth == 'nutricionista'}">
	    	urlVerificar = document.createElement("a");
	    	button="<button class='btn btn-default btn-sm'>Ver</button>";
	 		urlVerificar.href="${fn:escapeXml(tiendaUrl)}"+producto.tienda+"/producto/"+producto.id+"/edit";
	 		urlVerificar.innerHTML = button;
	 		urlVerificar.className = "edit-btn";
	 		caption.appendChild(urlVerificar);
 		</c:if>

 		
    	thumbnail.appendChild(caption);
    	prodDiv.appendChild(thumbnail);
		document.getElementById('productos').appendChild(prodDiv);
	};

	function onlyUnique(value, index, self) {
		  return self.indexOf(value) === index;
		};

</script>
</petclinic:layout>
