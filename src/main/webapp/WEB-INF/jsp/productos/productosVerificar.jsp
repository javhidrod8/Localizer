<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<petclinic:layout pageName="productosList">
	<spring:url value="/productos/" var="productosUrl"></spring:url>
	<spring:url value="/producto/" var="productoUrl"></spring:url>
	<spring:url value="/productos/search/" var="searchUrl"></spring:url>
	<spring:url value="/tienda/" var="tiendaUrl"></spring:url>
	<h2>Productos por verificar</h2>
	<br>

	<div class="row" style="margin-top: 2%">
		<div class="col-md-12" id="productos"></div>
	</div>
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
		</c:forEach> 
	
		productos.forEach(producto=> printProducto(producto));
		
	
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
 		url.className="producto-img"
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
    	button="<button class='btn btn-default btn-sm'>Verificar</button>";
 		var urlEdit = document.createElement("a");
 		urlEdit.href="${fn:escapeXml(tiendaUrl)}"+producto.tienda+"/producto/"+producto.id+"/edit";
 		urlEdit.innerHTML = button;
 		urlEdit.className = "edit-btn";
    	thumbnail.appendChild(caption);
    	thumbnail.appendChild(urlEdit);
    	prodDiv.appendChild(thumbnail);
		document.getElementById('productos').appendChild(prodDiv);
	};

	function onlyUnique(value, index, self) {
		  return self.indexOf(value) === index;
		};

</script>
</petclinic:layout>
