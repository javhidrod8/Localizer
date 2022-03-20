<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<petclinic:layout pageName="productosList">


	<h2>Productos</h2>
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

	<div class="row" id="intolerancias"></div>
	<div class="row" id="preferencias"></div>

	<script type="text/javascript">
        var productos = new Array();
        var intolerancias = new Array();
        var preferencias = new Array();
		<c:forEach items="${productos}" var="producto"> 
		    productoDetails = new Object();
		    productoDetails.id =  "${producto.id}"; 
		    productoDetails.nombre = "${producto.nombre}";
		    productoDetails.precio = "${producto.precio}";
		    productoDetails.marca = "${producto.marca}";
		    productoDetails.intolerancias = new Array();
		    <c:forEach items="${producto.intolerancia}" var="intolerancia">
		    	productoDetails.intolerancias.push("${intolerancia}");
		    	intolerancias.push("${intolerancia}");
		    </c:forEach>
		    productoDetails.preferencia = "${producto.preferencia}";
		    preferencias.push(productoDetails.preferencia);
		    productos.push(productoDetails);	 
		</c:forEach> 
		
		
		productos.forEach(producto=> printProducto(producto));
		var uniquePreferencias = preferencias.filter(onlyUnique);
		uniquePreferencias.forEach(pref=>setPref(pref));
		
	
	function setPref(pref){
		  var button = document.createElement('button');
		  prodHtml = "";
		  text = JSON.stringify(pref);
		 
		  button.innerHTML = text;
		  button.onclick = function(){
			  console.log(pref);
			  document.getElementById('productos').innerHTML= prodHtml;
			  productosFiltrados = productos.filter(preferencia=>preferencia==pref);
			  productosFiltrados.forEach(producto=> printProducto(producto));
		  };
			
		  document.getElementById('preferencias').appendChild(button);
	}; 
	
	function printProducto(producto){
		document.getElementById('productos').innerHTML+= "<p>"+JSON.stringify(producto)+"</p>";
	};

	function onlyUnique(value, index, self) {
		  return self.indexOf(value) === index;
		};

</script>



</petclinic:layout>