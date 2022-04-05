<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
	<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<petclinic:layout pageName="productos">

	<div class="row">
		<div class="col-md-6"> <div class="producto-imagen-div">
			<img class="producto-imagen"
				src="<c:out value='${producto.imagen}'/>"/>
		</div>
		</div>
		<div class="col-md-6">
			<h2><b><c:out value="${producto.nombre}" /></b></h2>
			<h2>
				<c:out value="${producto.precio}" />
				&#8364
				<c:if test="${producto.estado=='ACEPTADO'}">
					<i class="fa fa-check" style="margin-left: 2%"></i>
				</c:if>
				<c:if test="${producto.estado=='RECHAZADO'}">
					<i class="fa-solid fa-x" style="margin-left: 2%"></i>
				</c:if>
			</h2>
			<c:if test="${not empty producto.descripcion}">
			<h3>Descripción:</h3>${producto.descripcion }<br>
			</c:if>
			
			<c:if test="${not empty producto.intolerancia  }">
			<h3>Intolerancias:</h3> <ul><c:forEach items="${producto.intolerancia}" var="intolerancia">
			<li><c:out	value="${intolerancia.nombre} " /></li>
			</c:forEach>
			</ul>
			</c:if>
			<c:if test="${not empty producto.preferencia}">
			<h3>Preferencias:</h3><ul><li><c:out	value="${producto.preferencia} " /></li></ul>
			</c:if><br>
			<spring:url value="/tienda/{tiendaId}" var="tiendaUrl">
				<spring:param name="tiendaId" value="${producto.tienda.id}" />
			</spring:url>
			<a href="${fn:escapeXml(tiendaUrl)}">
				<button class='btn btn-default btn-sm'>Ver tienda</button>
			</a>
			<sec:authorize access="isAuthenticated()">
			<spring:url value="/tienda/{tiendaId}/producto/{productoId}/reservar" var="reservaUrl">
                <spring:param name="tiendaId" value="${producto.tienda.id}"/>
                <spring:param name="productoId" value="${producto.id}"/>
            </spring:url>
            <a href="${fn:escapeXml(reservaUrl)}">
                <button class = "btn btn-default btn-sm">Reservar</button></br></br>
            </a>
			</sec:authorize>
			 <sec:authorize access="hasAuthority('nutricionista')"> 
			 <spring:url value="/tienda/{tiendaId}/producto/{productoId}/edit" var="productoUrl">
				<spring:param name="tiendaId" value="${producto.tienda.id}" />
				<spring:param name="productoId" value="${producto.id}" />
			</spring:url>
			<c:if test="${producto.estado!='ACEPTADO'}">
			<a href="${fn:escapeXml(productoUrl)}">
				<button class='btn btn-default btn-sm'>Verificar producto</button>
			</a>
			</c:if>
			 </sec:authorize>
			 <sec:authorize access="hasAuthority('vendedor')"> 
			 <spring:url value="/tienda/{tiendaId}/producto/{productoId}/edit" var="productoUrl">
				<spring:param name="tiendaId" value="${producto.tienda.id}" />
				<spring:param name="productoId" value="${producto.id}" />
			</spring:url>
			<a href="${fn:escapeXml(productoUrl)}">

				<button class='btn btn-default btn-sm'>Editar producto</button>

			</a>
			 </sec:authorize>

		</div>
	</div>

			
			<br> <br>
			<div class="row" style="margin-top: 2%">
			<h3>Productos de esta tienda:</h3>
		<div class="col-md-2">
			<div id="intolerancias">
				<h3>Intolerancias</h3>
				<c:forEach items="${intolerancias}" var="intolerancia">
					<input class="form-check-input" type="checkbox" id="${intolerancia}" />
					<c:out value="${intolerancia}"></c:out>
					<br>
				</c:forEach>
			</div>
			<div id="preferencias">
				<h3>Preferencias</h3>
				<input class="form-check-input" type="radio" name = "preferencia" checked> NINGUNA <br></input>
				<c:forEach items="${preferencias}" var="preferencia">
					<c:if	test="${preferencia != 'TODO' && preferencia != null}"> 
					<input class="form-check-input" type="radio" name = "preferencia" id="${preferencia}" />	
					
					<c:out value="${preferencia}"></c:out></c:if>
					<br>
				</c:forEach>
				<br>
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
		<c:forEach items="${producto.tienda.productos}" var="producto"> 
			<c:if test="${producto.estado == 'ACEPTADO'||miTienda}">
			 productoDetails = new Object();
			    productoDetails.id =  "${producto.id}"; 
			    productoDetails.nombre = "${producto.nombre}";
			    productoDetails.precio = "${producto.precio}";
			    productoDetails.marca = "${producto.marca}";
			    productoDetails.imagen = "${producto.imagen}";
			    productoDetails.estado = "${producto.estado}";
			    productoDetails.tienda = "${producto.tienda.id}";
			    productoDetails.intolerancias = new Array();
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
		button.className="btn btn-default btn-md";
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
				img.id = "productoImg";
		    
		 		var url = document.createElement("a");
		 		url.href="${fn:escapeXml(productoUrl)}"+producto.id;
		 		url.className="producto-tienda-img";
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
				

		    	caption.innerHTML+="<p> Marca: "+producto.marca+"</p>";
		    	caption.innerHTML+="<h3>"+producto.precio+"<span class='glyphicon glyphicon-euro' aria-hidden='true'></span></h3>";
		    	<sec:authorize access="isAuthenticated()">
		    	<c:if test="${!miTienda}">
		    	caption.innerHTML+="<a href='/tienda/"+producto.tiendaid+"/producto/"+producto.id+"/reservar'><button class='btn btn-default btn-sm'>Reservar</button></br></br></a>";

		    	</c:if>
		    	</sec:authorize>

		    	<c:if test="${miTienda}">
		    	var url = document.createElement("a");
		 		url.href="${fn:escapeXml(productoEditarUrl)}"+producto.id+"/edit";
		    	button = document.createElement("button");
		    	button.className = 'btn btn-default btn-sm';   	
				button.innerHTML="Editar";
		 		url.appendChild(button);
		    	caption.appendChild(url);
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
