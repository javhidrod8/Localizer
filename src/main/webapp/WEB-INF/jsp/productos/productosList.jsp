<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<petclinic:layout pageName="productosList">


	<h2>Productos</h2><br>
	<div class="row" id="productos">
		<!-- <c:forEach items="${productos}" var="producto">
        	<div class = "col-md-3">
        		<br><br>
        		<spring:url value="/producto/{productoId}" var="productoUrl">
        			<spring:param name="productoId" value="${producto.id}"/>
        		</spring:url>
        		<a href="${fn:escapeXml(productoUrl)}">
        			<img height="200px" width="auto" src="<c:out value="${producto.imagen}"/>" style="margin:0px 50px"/>
        		</a>
        		<br><br>
                <font size="+1">
                    <spring:url value="/producto/{productoId}" var="productoUrl">
                        <spring:param name="productoId" value="${producto.id}"/>
                    </spring:url>
                    <a href="${fn:escapeXml(productoUrl)}">
                    	<c:out value="${producto.nombre}"/>
					</a>
                </font>
                <br>
                <font size="+1">
                    <c:out value="${producto.precio}"/>
                    &#8364, marca 
                </font>
                <font size="+1">
                    <c:out value="${producto.marca}"/>
                </font>
			</div>
        </c:forEach> -->
	</div>

	<div class="row" id="intolerancias">
		<c:forEach items="${intolerancias}" var="intolerancia"> 
			 <input class="form-check-input" type="checkbox" id="${intolerancia}"/> <c:out value="${intolerancia}"></c:out>
			</c:forEach>
	</div>
	<div class="row" id="preferencias">
		<c:forEach items="${preferencias}" var="preferencia"> 
			 <input class="form-check-input" type="checkbox" id="${preferencia}" /> <c:out value="${preferencia}"></c:out>
			</c:forEach>
	</div>
	<br><br>
	<script type="text/javascript">
    var productos = new Array();

	
	/* TODO: rellenar los 2 siguientes arrays y crear un checkbox por cada ${preferencia} e ${intolerancia} (vienen del back, mientras se estan asignado en 1 y 2) */
	/* se deben poder marcar varias intolerancias perso solo una preferencia */
	
    	var intolerancias = new Array();
        var preferencias = new Array();
		<c:forEach items="${productos}" var="producto"> 
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
		var selectedPreferencia = new Array();
		var selectedIntolerancias = new Array();	

		var button = document.createElement('button');
	  	prodHtml = "";
	  	button.innerHTML = "Filtrar";
	  	button.onclick = function(){
	  		
	  		preferencias.forEach(p => {
				  if(!selectedPreferencia.includes(p)){
 					  selectedPreferencia.push(p);
				  }
			  })
	  		
	  		intolerancias.forEach(i => {
				  if(document.getElementById(i).checked && !selectedIntolerancias.includes(i)){
					  selectedIntolerancias.push(i);
				  }
			  })
			  
			  document.getElementById('productos').innerHTML= prodHtml;
			  var productosFiltrados = {...productos};
			  if(selectedPreferencia != "" || selectedPreferencia != null || selectedIntolerancias.length > 0){
				  productosFiltrados = [];
				  if(selectedPreferencia != "" || selectedPreferencia != null ) {
					  productos.forEach(e => {
						  if(e.preferencia == selectedPreferencia){
							  productosFiltrados.push(e);
						  }
					  })
				  } 
				  if(selectedIntolerancias.length > 0) {
					  var indexList = [];
					  productos.forEach(e => {
						  selectedIntolerancias.forEach(i => {
							  if(e.intolerancias.includes(i)){
								  var index = productos.indexOf(e);
								  if(!(indexList.includes(index))){
									  indexList.push(index);
								  }
							  }
						  })
					  })
					  indexList.forEach(i => {
						  productosFiltrados.splice(i, 1);
					  })
				  }
			  }
			  productosFiltrados.forEach(producto=> printProducto(producto));
		  };
			
		  document.getElementById('preferencias').appendChild(button);
		
	
	function printProducto(producto){
		
		var prodDiv = document.createElement('div'); 
		prodDiv.className = "col-md-3";
		prodDiv.id = "prodDiv";       
		
		var img = document.createElement('img');
		img.src = producto.imagen;
		img.alt = "Imagen no encontrada";
		img.id = "imagen"
		img.height="200";
// 		img.width="auto";
 		img.style="margin:0px 50px";
		
 		var url = document.createElement("a");
 		url.href="http://localhost:8080/producto/"+producto.id;
 		
 		url.appendChild(img);
		
 		prodDiv.appendChild(url);
 		
		var url2 = document.createElement("a");
 		url2.href="http://localhost:8080/producto/"+producto.id;
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