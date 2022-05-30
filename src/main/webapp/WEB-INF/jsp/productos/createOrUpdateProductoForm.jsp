<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<petclinic:layout pageName="productos">
	
	<spring:url value="/resources/images/preferencias/" var="prefImagenUrl"></spring:url>	
	<spring:url value="/resources/images/intolerancias/" var="intolImagenUrl"></spring:url>	
	<spring:url value="/tiendas/miTienda/" var="miTiendaUrl"></spring:url>	
	<spring:url value="/resources/images/localizer-logo.png" htmlEscape="true" var="productoImagen" />
	<spring:url value="/" var="inicioUrl"></spring:url>

	
	<div class="container col-xxl-12 px-4 py-4">
			  	<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='currentColor'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
	  <ol class="breadcrumb">
	    <li class="breadcrumb-item"><a href="${fn:escapeXml(inicioUrl)}"><i class="fa-solid fa-house icon-menu"> </i> Inicio</a></li>
	    <li class="breadcrumb-item"><a href="${fn:escapeXml(miTiendaUrl)}"><i class="fa-solid fa-store icon-menu"></i> Mi Tienda</a></li>
	    <li class="breadcrumb-item active" aria-current="page" id="nombreProductoBC">
	    	<c:if test="${!producto['new']}"><c:out value="${producto.nombre}" /></c:if>
	    	<c:if test="${producto['new']}">Nuevo Producto</c:if>
	    </li>
	    
	  </ol>
	</nav>
	
	<div class="col-md-12 py-1">
            <div class="row g-0 card overflow-hidden flex-md-row mb-4 h-md-250 position-relative">
                <div class="col-auto d-none d-lg-block">
                <c:if test="${!producto['new']}">
                	<img id="imagenProductoPreview" src="<c:out value="${producto.imagen}"/>" />
                </c:if>
                <c:if test="${producto['new']}">
                    <img id="imagenProductoPreview" src="${fn:escapeXml(productoImagen)}" />
                </c:if>
                </div>
                <div class="col p-4 d-flex flex-column position-static">
                <div class="row">
                    <div class="col-xl-9 py-1">

              		<a href="${fn:escapeXml(tiendaUrl)}"> 
                            <strong class="d-inline-block mb-2 text-primary" id="nombreTienda">
                                <i class="fa-solid fa-store icon-menu"></i>
                                <c:if test="${!producto['new']}"> ${producto.tienda.nombre}</c:if>
                                <c:if test="${producto['new']}"> Mi tienda</c:if>
                            </strong>
                        </a>
         
                        <h3 class="mb-0" id="nombreProductoPreview">
                        	<c:if test="${!producto['new']}"><c:out value="${producto.nombre}" /></c:if>
	    					<c:if test="${producto['new']}">Nuevo Producto</c:if>
	    				</h3>
                    </div>
                        <div class="col-xl-3 d-flex justify-content-end align-items-end">
                            <h1 id="precioProductoPreview">
                                <c:if test="${!producto['new']}"><c:out value="${producto.precio}" /></c:if>
	    						<c:if test="${producto['new']}">0</c:if>
								&#8364
							</h1>
                        </div>
                </div>
                        <div class="col-xl-3 py-2 
                            <c:if test="${producto.preferencia=='TODO' || producto.preferencia=='' || empty producto.preferencia}">hidden</c:if>
                        " id="bloquePreferencia" >
                            <div class="col-xl-12"><h6>Preferencia:</h6></div>
                            <div class="col-xl-12">
                                <div class="list-group list-group-horizontal" id="preferenciasBox[0]">
                                    <div class="list-group-item" id="preferenciasBoxPreview">
                                            <img class="menu-pref-icon" src="${fn:escapeXml(prefImagenUrl)}${producto.preferencia}.png">
                                            ${producto.preferencia}
                                    </div>
                                </div>
                            </div>
                        </div>
                    <div class="mb-1 text-muted" id="marcaProductoPreview">
                    	<c:if test="${!producto['new']}"><c:out value="${producto.marca}" /></c:if>
                    </div>
                    <div class="h5" id="descripcionProductoPreview">${producto.descripcion}</div>
                    <c:if test="${!producto['new']}">
                        <div class="row">
                            <div class='col-xl-12 card py-2
                                <c:if test="${empty producto.intolerancia}">
                                    hidden
                                </c:if>' id="bloqueIntolerancias">
                                <div class="col-xl-12"><h6>Intolerancias:</h6></div>
                                <div class="col-xl-12" id="intoleranciasBoxPreview">
                                </div>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
    </div>
</div>	

<c:if test="${auth == 'vendedor'}">
	<form:form modelAttribute="producto" class="form-horizontal"
		id="add-producto-form">
			<input type="text" id="tienda" name="tienda" class="hidden"value="${tiendaId}">
				<div id="form-vendedor" class="row">
				<div id="nombre-producto" class="col-md-8 mb-3">
						<label id="nombreLabel" for="nombre">
							<h3>Nombre</h3>
						</label>
							<input required type="text" class="form-control"
								id="nombre" name="nombre" value="${producto.nombre}" <c:if test="${!producto['new']}">readonly style="pointer-events:none"</c:if>>
					</div>
					
					<div id="marca-producto" class="col-md-2 mb-3">
						<label id="marcaLabel" for="marca">
							<h3>Marca</h3>
						</label>
							<input required type="text" class="form-control"
								id="marca" name="marca" value="${producto.marca}" <c:if test="${!producto['new']}">readonly style="pointer-events:none"</c:if>>
					</div>
					
					<div id="precio-producto" class="col-md-2 mb-3">
						<label id="precio2" for="precio">
							<h3>Precio</h3>
						</label>
						<div id="precio" class="input-group">
							<input required type="number" class="form-control"
								id="precio-num" name="precio" placeholder="0" min=0 step="any"
								value="${producto.precio}" aria-describedby="euros">
							<span class="input-group-text" id="euros">&#8364</span>
						</div>
					</div>
					
					<div class="col-sm-12">
			  		<label for="imagenPrueba" class="form-label" style="pointer-events: none">
              			<h4>Imagen</h4>
              		</label>
              		<input required type="text" class="form-control" id="imagenPrueba" title="Debe empezar por https y terminar por formato gráfico (png,jpg,jpeg,gif,png,svg)" pattern="(https:\/\/.+\.(?:png|jpg|jpeg|gif|png|svg))$"  placeholder="" value="${producto.imagen}">
              		<div class="invalid-feedback">
               			Imagen necesaria para el registro.
              		</div>
				</div>
				<div class="col-sm-12 hidden">
			  		<label for="imagen" class="form-label" style="pointer-events: none">
              			<h4>Imagen</h4>
              		</label>
              		<input type="text" class="form-control" id="imagen" name="imagen" pattern="(https:\/\/.+\.(?:png|jpg|jpeg|gif|png|svg))$"  placeholder="" value="${producto.imagen}" required>
              		<div class="invalid-feedback">
               			Imagen necesaria para el registro.
              		</div>
				</div>
					
					<div id="descripcion-producto" class="col-md-12 mb-3">
						<label id="descripcionLabel" for="descripcion">
							<h3>Descripci&oacuten:</h3>
						</label>
						<textarea required class="form-control" id="descripcion" name="descripcion"
							rows="3"
							<c:if test="${!producto['new']}">
								readOnly style="pointer-events: none" 
							</c:if>
							>${producto.descripcion}</textarea>
						<br>
					</div>
					<div id="estado-producto">
						<c:if test="${producto['new']}">
							<div class="radio-inline">
								<label class="hidden"> <input type="radio" name="estado"
									id="pendiente" value="PENDIENTE" checked readOnly
									style="pointer-events: none" class="hidden">
								</label>
							</div>
						</c:if>
						<c:if test="${producto.estado=='PENDIENTE'}">
							<h2>Producto Sin Validar</h2>
							<div class="radio-inline">
								<label class="hidden"> <input type="radio" name="estado"
									id="pendiente" value="PENDIENTE" checked readOnly
									style="pointer-events: none" class="hidden">
								</label>
							</div>
						</c:if>

						<c:if test="${producto.estado=='ACEPTADO'}">
							<h2>Producto Aceptado</h2>
							<div class="radio-inline hidden">
								<label> <input type="radio" name="estado" id="aceptado"
									value="ACEPTADO"
									<c:if test="${producto.estado=='ACEPTADO'}">checked</c:if>>
									ACEPTAR
								</label>
							</div>
						</c:if>

						<c:if test="${producto.estado=='RECHAZADO'}">
							<h2>Producto Rechazado</h2>
							<div class="radio-inline hidden">
								<label> <input type="radio" name="estado" id="rechazado"
									value="RECHAZADO" checked> RECHAZADO
								</label>
							</div>
							<div id="motivo-producto col-md-12">
								<label for="motivo">
									<h3>Motivo:</h3>
								</label>
								<textarea class="form-control" rows="3" name="motivo" readOnly
									style="pointer-events: none">${producto.motivo}</textarea>
								<br>
							</div>
						</c:if>
					</div>



				</div>
							
				<div id="intoleranciasCheckBoxDiv" class="hidden">
				</div>
				<div id="preferenciasCheckBoxDiv" class="hidden">
				</div>
				<div id="promocionado-producto" class="hidden">
					<h3>Promocionar:</h3>
					<div class="radio-inline">

						<label style="pointer-events: none"> <input type="radio"
							name="promocionado" id="no" value="TRUE" readOnly
							style="pointer-events: none"
							<c:if test="${producto.promocionado}">checked</c:if>>SI
						</label>
					</div>
					<div class="radio-inline">
						<label style="pointer-events: none"> <input type="radio"
							name="promocionado" id="no" value="FALSE" readOnly
							style="pointer-events: none"
							<c:if test="${!producto.promocionado}"> checked</c:if>>NO
						</label>
					</div>
				</div>
				<div class="form-group">
					<div class="d-grid gap-2 d-md-flex justify-content-md-end py-2">
					
						<a class="btn btn-primary btn-lg w-100" href="${fn:escapeXml(miTiendaUrl)}"><i class="fa-solid fa-store icon-menu"></i> Volver a Mi Tienda</a>
						<c:choose>
							<c:when test="${producto['new']}">
								<button class="btn btn-primary btn-lg w-100" type="submit"><i class="fa-solid fa-floppy-disk icon-menu"></i> A&ntildeadir
									Producto</button>
							</c:when>
							<c:otherwise>
								<button class="btn btn-primary btn-lg w-100" type="submit"><i class="fa-solid fa-floppy-disk icon-menu"></i> Actualizar
									Producto</button>
							</c:otherwise>
						</c:choose>
					</div>

				</div>
	</form:form>
		<script>
            const imagenOriginal = document.getElementById('imagenProductoPreview').src;
            const imagen = document.getElementById('imagen');
            const imagenPrueba = document.getElementById('imagenPrueba');
            const resultImagen = document.getElementById('imagenProductoPreview');
            const inputHandlerImagen = function(e) {
                const strImagen = e.target.value;
                const n = 4; 
                const extension = strImagen.substring(strImagen.length - n)
                if(extension=='.png'||extension=='.jpg'||extension=='.gif'||extension=='jpeg'||extension=='.svg'){
                        checkIfImageExists(strImagen, (exists) => {
                                if (exists) {
                                    resultImagen.src = e.target.value;
                                    imagen.value = e.target.value;	  
                            }});
                }
            }
            imagenPrueba.addEventListener('input', inputHandlerImagen);

                function checkIfImageExists(url, callback) {
                    const img = new Image();
                    img.src = url;

                    if (img.complete) {
                        callback(true);
                    } else {
                        img.onload = () => {
                        callback(true);
                        };
                        
                        img.onerror = () => {
                        callback(false);
                        };
                    }
                    }

        </script>
        <script>
        function sortByKey(array, key) {
            return array.sort(function(a, b) {
                var x = a[key]; var y = b[key];
                return ((x < y) ? -1 : ((x > y) ? 1 : 0));
            });
        }
            const precio = document.getElementById('precio');
            const resultPrecio = document.getElementById('precioProductoPreview');
            const inputHandlerPrecio = function(e) {
                resultPrecio.innerHTML = e.target.value+ "  &#8364";
            }
            precio.addEventListener('input', inputHandlerPrecio);
        </script>
        <c:if test="${producto['new']}">
        	<script>
	            const nombre = document.getElementById('nombre');
	            const marca = document.getElementById('marca');
	            const nombreProductoBC = document.getElementById('nombreProductoBC');
	            const descripcion = document.getElementById('descripcion');
	            const resultDescripcion = document.getElementById('descripcionProductoPreview');
	            const resultNombre = document.getElementById('nombreProductoPreview');
	            const resultMarca = document.getElementById('marcaProductoPreview');
	            const inputHandlerNombre = function(e) {
	                nombreProductoBC.innerHTML = e.target.value;
	                resultNombre.innerHTML = e.target.value;
	            }
	            nombre.addEventListener('input', inputHandlerNombre);
	            const inputHandlerDescripcion = function(e) {
	                resultDescripcion.innerHTML = e.target.value;
	            }
	            descripcion.addEventListener('input', inputHandlerDescripcion);
	
	            const inputHandlerMarca = function(e) {
	                resultMarca.innerHTML = "Marca: "+ e.target.value;
	            }
	            marca.addEventListener('input', inputHandlerMarca);
        	</script>
        </c:if>     
        <c:if test="${!producto['new']}">
               <script>
					var intolerancias = new Array();
                    var preferencias = new Array();
                    <c:forEach items="${intolerancias}" var="intolerancia">
                        var intolerancia = {id:${intolerancia.id}, nombre:"${intolerancia.nombre}"};
                        intolerancias.push(intolerancia);
                    </c:forEach>
                    <c:forEach items="${preferencias}" var="preferencia">
                        preferencias.push("${preferencia}");
                    </c:forEach>
                    var intoleranciasSeleccionadas = new Array();
                    <c:forEach items="${producto.intolerancia}" var="intolerancia">
                        var intoleranciaSeleccionada = {id:${intolerancia.id}, nombre:"${intolerancia.nombre}"};
                        intoleranciasSeleccionadas.push(intoleranciaSeleccionada);
                    </c:forEach> 
                    var intoleranciasCheckBoxDiv = document.getElementById("intoleranciasCheckBoxDiv");
                    var preferenciaSeleccionada = "${producto.preferencia}";
                    var preferenciasCheckBoxDiv = document.getElementById("preferenciasCheckBoxDiv");
                    

                    intolerancias.forEach(intol=>crearInputIntolerancia(intol));
                    preferencias.forEach(preferencia=>crearInputPreferencia(preferencia));
                    if(intoleranciasSeleccionadas.length>0){
                    	intoleranciasSeleccionadas.forEach(intol=>marcarSeleccionada(intol));	
                    }
                    if(preferenciaSeleccionada!=''){
                    	var inputPreferenciaSeleccionada = document.getElementById(preferenciaSeleccionada);
                        inputPreferenciaSeleccionada.checked = true;
                    }else{
                    	var inputPreferenciaSeleccionada = document.getElementById('TODO');
                        inputPreferenciaSeleccionada.checked = true;
                    }
                    
                    
                    function crearInputIntolerancia(intol){
                        var inputIntolerancia = document.createElement("input");
                        inputIntolerancia.type="checkbox";
                        inputIntolerancia.id = intol.nombre;
                        inputIntolerancia.value = intol.id;
                        inputIntolerancia.name = "intolerancia";
                        inputIntolerancia.readOnly = true; 
                        var labelIntolerancia = document.createElement("label");
                        labelIntolerancia.htmlFor = intol.nombre;
                        labelIntolerancia.innerHTML +=  intol.nombre;  
                        intoleranciasCheckBoxDiv.appendChild(inputIntolerancia);
                        intoleranciasCheckBoxDiv.appendChild(labelIntolerancia);
                    }
                    
                    function marcarSeleccionada(intol){
                        var intolId = intol.nombre;
                        var inputIntol = document.getElementById(intolId);
                        inputIntol.checked = true;
                    }
                    

                    
                    
                    function crearInputPreferencia(preferencia){
                        var inputPreferencia = document.createElement("input");
                        inputPreferencia.type="radio";
                        inputPreferencia.id = preferencia;
                        inputPreferencia.value = preferencia;
                        inputPreferencia.name = "preferencia";
                        inputPreferencia.readOnly = true; 
                        var labelPreferencia = document.createElement("label");
                        labelPreferencia.htmlFor = preferencia;
                        labelPreferencia.innerHTML += preferencia;
                            
                        preferenciasCheckBoxDiv.appendChild(inputPreferencia);
                        preferenciasCheckBoxDiv.appendChild(labelPreferencia);
                    }

            </script> 
	        <script>
				var intolerancias = new Array();
				var preferencias = new Array();
	            <c:forEach items="${intolerancias}" var="intolerancia">
	                var intolerancia = {id:${intolerancia.id}, nombre:"${intolerancia.nombre}"};
	                intolerancias.push(intolerancia);
	            </c:forEach>
	            <c:forEach items="${preferencias}" var="preferencia">
	                preferencias.push("${preferencia}");
	            </c:forEach>
	            var intoleranciasSeleccionadas = new Array();
	            <c:forEach items="${producto.intolerancia}" var="intolerancia">
	                var intoleranciaSeleccionada = {id:${intolerancia.id}, nombre:"${intolerancia.nombre}"};
	                intoleranciasSeleccionadas.push(intoleranciaSeleccionada);
	            </c:forEach>
	            
	                const numIntolsPorUl = 6;
	                var intoleranciasPreview = sortByKey(intoleranciasSeleccionadas,"id");
	                var intoleranciasBoxPreview = document.getElementById("intoleranciasBoxPreview");
	                printIntoleranciasPreview(intoleranciasPreview);
	                
	                function printIntoleranciasPreview(intolerancias){
	                    var intoleranciasSize = intolerancias.length;
	                    var numIntoleranciasBoxes = Math.floor(intoleranciasSize/numIntolsPorUl);
	                    var bloqueIntolerancias = document.getElementById('bloqueIntolerancias');
	                    intoleranciasBoxPreview.innerHTML ="";
	                    if(intoleranciasSize>0){
	                        bloqueIntolerancias.className = "col-xl-12 card py-2";
	                    }else{
	                        bloqueIntolerancias.className = "hidden";
	                    }
	                    if (numIntoleranciasBoxes == 0 && intoleranciasSize!=0 ){
	                        var intoleranciasBox = document.createElement('div');
	                        intoleranciasBox.className = "list-group list-group-horizontal-md d-flex flex-fill";
	                        intoleranciasBoxPreview.appendChild(intoleranciasBox);
	                        intolerancias.forEach(intol => printIntol(intol,intoleranciasBox));
	                        
	                    }else{
	                        var intoleranciasBoxes = new Array();
	                        for(var i=0;i<=numIntoleranciasBoxes;i++){
	                            var inicio = i*numIntolsPorUl;
	                            var fin = Math.min(inicio+numIntolsPorUl,intoleranciasSize);
	                            var intoleranciasParaElBox = new Array();
	                            for(var j=inicio;j<fin;j++){
	                                intoleranciasParaElBox.push(intolerancias[j]);
	                            }
	                            intoleranciasBoxes[i] = document.createElement('div');
	                            intoleranciasBoxes[i].className = "list-group list-group-horizontal-md d-flex flex-fill";
	                            intoleranciasBoxPreview.appendChild(intoleranciasBoxes[i]);
	                            
	                            intoleranciasParaElBox.forEach(intol => printIntol(intol,intoleranciasBoxes[i]));
	                        }
	                    }
	                }
	                function actualizaIntoleranciasPreview(){
	                    var intoleranciasCheckBoxes = document.getElementsByName('intolerancia');
	                    var checkedIntols = new Array();
	                    var intolsResult = new Array();
	                    for (var i=0;i<intoleranciasCheckBoxes.length;i++){
	                        if(intoleranciasCheckBoxes[i].checked){
	                            checkedIntols.push(intoleranciasCheckBoxes[i].value);
	                        }	
	                    }
	                    for (var i=0;i<intolerancias.length;i++){
	                        for(var j=0;j<checkedIntols.length;j++){
	                            if(intolerancias[i].id == parseInt(checkedIntols[j])){
	                                intolsResult.push(intolerancias[i]);
	                            }
	                        }
	                    }
	                    printIntoleranciasPreview(intolsResult);
	                }
	                function printIntol(intol, div) {
	                    var liIntol = document.createElement("li");
	                    liIntol.className = "list-group-item";
	                    var imgIntol = document.createElement("img");
	                    imgIntol.src = "${fn:escapeXml(intolImagenUrl)}" + intol.nombre + ".png";
	                    imgIntol.className = "menu-pref-icon";
	                    liIntol.innerHTML = " " + intol.nombre;
	                    liIntol.prepend(imgIntol);
	                    div.append(liIntol);
	                }
	                function actualizaPreferencia(preferencia){
	                    var preferenciaBox = document.getElementById("preferenciasBoxPreview");
	                    var bloquePreferencia = document.getElementById("bloquePreferencia");
	                    preferenciaBox.innerHTML = '';
	                        if(preferencia!='TODO'){
	                            bloquePreferencia.className ="col-xl-3 py-2"
	                            var imgPreferencia = document.createElement("img");
	                            imgPreferencia.src = "${fn:escapeXml(prefImagenUrl)}" + preferencia + ".png";
	                            imgPreferencia.className = "menu-pref-icon";
	                            preferenciaBox.appendChild(imgPreferencia);
	                            preferenciaBox.innerHTML+=" "+preferencia;
	                        }else{
	                        bloquePreferencia.className ="hidden"
	                        var preferenciaBox0 = document.getElementById("preferenciasBox[0]");
	                        preferenciaBox0.className = "";
	                        }    
	                }
	        </script>
        </c:if>
</c:if>

<c:if test="${auth == 'nutricionista'}">
<form:form modelAttribute="producto" class="form-horizontal" id="add-producto-form">	


	<div class="hidden">
		<input required type="text" id="tienda" name="tienda" value="${tiendaId}" readOnly style="pointer-events: none">
		<input required type="text" id="nombre" name="nombre" value="${producto.nombre}" readonly style="pointer-events: none">
		<input required type="text" id="imagen" name="imagen" value="${producto.imagen}" readonly style="pointer-events: none">
		<input required type="number" id="precio-num" name="precio" value="${producto.precio}" readonly style="pointer-events: none">
		<input required type="text" id="marca" name="marca" value="${producto.marca}" readonly style="pointer-events: none">
		<textarea required id="descripcion" name="descripcion" readonly style="pointer-events: none">${producto.descripcion}</textarea>
		<input required type="text" name="estado" id="estado" value="${producto.estado}">
		<c:if test="${producto.promocionado}">
			<input type="radio" name="promocionado" id="no" value="TRUE" readOnly style="pointer-events: none" checked> SI
		</c:if>
		<c:if test="${!producto.promocionado}">
	 		<input type="radio" name="promocionado" id="no" value="FALSE" readOnly style="pointer-events: none" checked>NO
		</c:if>	
	</div>
	<h2>Verificar Producto</h2>
	<div class="form-group has-feedback">
		<div class="row g-1">
		<div class="col-xl-4 card px-2 py-2" id="preferenciasBox">
			<h6>Preferencia:</h6>
			<div class="col-xl-12" id="preferenciasCheckBoxDiv"></div>	
		</div>
		<div class="col-xl-8 card px-2 py-2" id="intoleranciasBox">
			<h6>Intolerancias:</h6>
			<div class="col-xl-12 mx-2" id="intoleranciasCheckBoxDiv"></div>	
		</div>

		</div>
	</div>
	<div class="row py-2">
        <div class="col-xl-12 py-2">
            <div id ="botones" class="d-grid gap-2 d-md-flex justify-content-md-end py-2">
                <button class="w-50 btn btn-outline-primary btn-lg px-4" data-bs-toggle="modal" data-bs-target="#canceladoToast" onclick="cancelar(); return false;">
                    <i class="fa-solid fa-circle-xmark icon-menu"></i> Rechazar Producto
                </button>
                <button class="w-50 btn btn-outline-primary btn-lg px-4" data-bs-toggle="modal" data-bs-target="#aceptadoToast" onclick="aceptar(); return false;">
                    <i class="fa-solid fa-check"></i> Validar Producto
                </button>
            </div>
        </div>
    </div>
						
		<div class="modal fade" id="canceladoToast" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
		    <div class="modal-content rounded-6 shadow">
		      <div class="modal-header border-bottom-0">
		        <h5 class="modal-title">Cancelar</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body py-0">
		       	<label for="comentarioToastCancelar"> Deje un comentario para rechazar</label>
				<textarea class="form-control" rows="3" name="motivo" id="motivo" minlength="3" required>${producto.motivo}
				</textarea>
		      </div>
		      <div class="modal-footer flex-column border-top-0">
					<button class="btn btn-outline-primary btn-lg px-4 w-100" type="submit">Rechazar producto</button>
		      </div>
		    </div>
		  </div>
		 </div>
						
		<div class="modal fade" id="aceptadoToast" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
		    <div class="modal-content rounded-6 shadow">
		      <div class="modal-header border-bottom-0">
		        <h5 class="modal-title">Aceptar</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body py-0">
		       	<label> Pulse para guardar los cambios</label>
		      </div>
		      <div class="modal-footer flex-column border-top-0">
		      	<button class="btn btn-outline-primary btn-lg px-4 w-100" type="submit">Aceptar Producto</button>

		      </div>
		    </div>
		  </div>
		 </div>		
         
         
	</form:form>
		<script>
		var intolerancias = new Array();
		var preferencias = new Array();
            <c:forEach items="${intolerancias}" var="intolerancia">
                intolerancia = {id:${intolerancia.id}, nombre:"${intolerancia.nombre}"};
                intolerancias.push(intolerancia);
            </c:forEach>
            <c:forEach items="${preferencias}" var="preferencia">
                preferencias.push("${preferencia}");
            </c:forEach>
            var intoleranciasSeleccionadas = new Array();
            <c:forEach items="${producto.intolerancia}" var="intolerancia">
                intoleranciaSeleccionada = {id:${intolerancia.id}, nombre:"${intolerancia.nombre}"};
                intoleranciasSeleccionadas.push(intoleranciaSeleccionada);
            </c:forEach>
			    
                var intoleranciasCheckBoxDiv = document.getElementById("intoleranciasCheckBoxDiv");
                <c:if test="${not empty producto.preferencia}">
                	var preferenciaSeleccionada = "${producto.preferencia}";
                </c:if>
                <c:if test="${empty producto.preferencia}">
                	var preferenciaSeleccionada ='TODO';
                </c:if>
                
                var preferenciasCheckBoxDiv = document.getElementById("preferenciasCheckBoxDiv");
                

                intolerancias.forEach(intol=>crearInputIntolerancia(intol));
                preferencias.forEach(preferencia=>crearInputPreferencia(preferencia));
                intoleranciasSeleccionadas.forEach(intol=>marcarSeleccionada(intol));
                var inputPreferenciaSeleccionada = document.getElementById(preferenciaSeleccionada);
                inputPreferenciaSeleccionada.checked = true;
                
                function crearInputIntolerancia(intol){
                    var inputIntolerancia = document.createElement("input");
                    inputIntolerancia.type="checkbox";
                    inputIntolerancia.className = "btn-check";
                    inputIntolerancia.id = intol.nombre;
                    inputIntolerancia.value = intol.id;
                    inputIntolerancia.name = "intolerancia";
                    inputIntolerancia.onclick = function(){
                        actualizaIntoleranciasPreview();
                    }
                    var labelIntolerancia = document.createElement("label");
                    labelIntolerancia.className="btn btn-primary"
                    labelIntolerancia.htmlFor = intol.nombre;
                    var imgIntol = document.createElement("img");
                    imgIntol.src = "${fn:escapeXml(intolImagenUrl)}" + intol.nombre + ".png";
                    imgIntol.className = "menu-pref-icon";
                    labelIntolerancia.appendChild(imgIntol);
                    labelIntolerancia.innerHTML += " " + intol.nombre;  
                    intoleranciasCheckBoxDiv.appendChild(inputIntolerancia);
                    intoleranciasCheckBoxDiv.appendChild(labelIntolerancia);
                }
                
                function marcarSeleccionada(intol){
                    var intolId = intol.nombre;
                    var inputIntol = document.getElementById(intolId);
                    inputIntol.checked = true;
                }
                

                
                
                function crearInputPreferencia(preferencia){
                    var inputPreferencia = document.createElement("input");
                    inputPreferencia.type="radio";
                    inputPreferencia.className = "btn-check";
                    inputPreferencia.id = preferencia;
                    inputPreferencia.value = preferencia;
                    inputPreferencia.name = "preferencia";
                    inputPreferencia.onclick = function(){
                        actualizaPreferencia(preferencia);
                    }
                    var labelPreferencia = document.createElement("label");
                    labelPreferencia.className="btn btn-md btn-primary w-50";
                    labelPreferencia.htmlFor = preferencia;
            
                    var imgPreferencia = document.createElement("img");
                    if(preferencia!='TODO'){
                        imgPreferencia.src = "${fn:escapeXml(prefImagenUrl)}" + preferencia + ".png";
                        imgPreferencia.className = "menu-pref-icon";
                        labelPreferencia.appendChild(imgPreferencia); 
                        labelPreferencia.innerHTML += " ";
                    }else{
                        labelPreferencia.className="btn btn-md btn-primary w-100"
                    }
            
                    labelPreferencia.innerHTML +=  preferencia;
                        
                    preferenciasCheckBoxDiv.appendChild(inputPreferencia);
                    preferenciasCheckBoxDiv.appendChild(labelPreferencia);
                }

                const numIntolsPorUl = 6;
                var intoleranciasPreview = sortByKey(intoleranciasSeleccionadas,"id");
                var intoleranciasBoxPreview = document.getElementById("intoleranciasBoxPreview");
                printIntoleranciasPreview(intoleranciasPreview);
                
                function printIntoleranciasPreview(intolerancias){
                    var intoleranciasSize = intolerancias.length;
                    var numIntoleranciasBoxes = Math.floor(intoleranciasSize/numIntolsPorUl);
                    var bloqueIntolerancias = document.getElementById('bloqueIntolerancias');
                    intoleranciasBoxPreview.innerHTML ="";
                    if(intoleranciasSize>0){
                        bloqueIntolerancias.className = "col-xl-12 card py-2";
                    }else{
                        bloqueIntolerancias.className = "hidden";
                    }
                    if (numIntoleranciasBoxes == 0 && intoleranciasSize!=0 ){
                        var intoleranciasBox = document.createElement('div');
                        intoleranciasBox.className = "list-group list-group-horizontal-md d-flex flex-fill";
                        intoleranciasBoxPreview.appendChild(intoleranciasBox);
                        intolerancias.forEach(intol => printIntol(intol,intoleranciasBox));
                        
                    }else{
                        var intoleranciasBoxes = new Array();
                        for(var i=0;i<=numIntoleranciasBoxes;i++){
                            var inicio = i*numIntolsPorUl;
                            var fin = Math.min(inicio+numIntolsPorUl,intoleranciasSize);
                            var intoleranciasParaElBox = new Array();
                            for(var j=inicio;j<fin;j++){
                                intoleranciasParaElBox.push(intolerancias[j]);
                            }
                            intoleranciasBoxes[i] = document.createElement('div');
                            intoleranciasBoxes[i].className = "list-group list-group-horizontal-md d-flex flex-fill";
                            intoleranciasBoxPreview.appendChild(intoleranciasBoxes[i]);
                            
                            intoleranciasParaElBox.forEach(intol => printIntol(intol,intoleranciasBoxes[i]));
                        }
                    }
                }
                function actualizaIntoleranciasPreview(){
                    var intoleranciasCheckBoxes = document.getElementsByName('intolerancia');
                    var checkedIntols = new Array();
                    var intolsResult = new Array();
                    for (var i=0;i<intoleranciasCheckBoxes.length;i++){
                        if(intoleranciasCheckBoxes[i].checked){
                            checkedIntols.push(intoleranciasCheckBoxes[i].value);
                        }	
                    }
                    for (var i=0;i<intolerancias.length;i++){
                        for(var j=0;j<checkedIntols.length;j++){
                            if(intolerancias[i].id == parseInt(checkedIntols[j])){
                                intolsResult.push(intolerancias[i]);
                            }
                        }
                    }
                    printIntoleranciasPreview(intolsResult);
                }
                function printIntol(intol, div) {
                    var liIntol = document.createElement("li");
                    liIntol.className = "list-group-item";
                    var imgIntol = document.createElement("img");
                    imgIntol.src = "${fn:escapeXml(intolImagenUrl)}" + intol.nombre + ".png";
                    imgIntol.className = "menu-pref-icon";
                    liIntol.innerHTML = " " + intol.nombre;
                    liIntol.prepend(imgIntol);
                    div.append(liIntol);
                }
                function actualizaPreferencia(preferencia){
                    var preferenciaBox = document.getElementById("preferenciasBoxPreview");
                    var bloquePreferencia = document.getElementById("bloquePreferencia");
                    preferenciaBox.innerHTML = '';
                        if(preferencia!='TODO'){
                            bloquePreferencia.className ="col-xl-3 py-2"
                            var imgPreferencia = document.createElement("img");
                            imgPreferencia.src = "${fn:escapeXml(prefImagenUrl)}" + preferencia + ".png";
                            imgPreferencia.className = "menu-pref-icon";
                            preferenciaBox.appendChild(imgPreferencia);
                            preferenciaBox.innerHTML+=" "+preferencia;
                        }else{
                        bloquePreferencia.className ="hidden"
                        var preferenciaBox0 = document.getElementById("preferenciasBox[0]");
                        preferenciaBox0.className = "";
                        }    
                }
				 
    

				    

				    
    const imagenOriginal = document.getElementById('imagenProductoPreview').src;
    const nombre = document.getElementById('nombre');
    const marca = document.getElementById('marca');
    const nombreProductoBC = document.getElementById('nombreProductoBC');
    const descripcion = document.getElementById('descripcion');
    const imagen = document.getElementById('imagen');
    const precio = document.getElementById('precio');
    const imagenPrueba = document.getElementById('imagenPrueba');
    const resultDescripcion = document.getElementById('descripcionProductoPreview');
    const resultNombre = document.getElementById('nombreProductoPreview');
    const resultImagen = document.getElementById('imagenProductoPreview');
    const resultPrecio = document.getElementById('precioProductoPreview');
    const resultMarca = document.getElementById('marcaProductoPreview');
    const inputHandlerNombre = function(e) {
        nombreProductoBC.innerHTML = e.target.value;
        resultNombre.innerHTML = e.target.value;
    }
    nombre.addEventListener('input', inputHandlerNombre);
    const inputHandlerDescripcion = function(e) {
        resultDescripcion.innerHTML = e.target.value;
    }
    descripcion.addEventListener('input', inputHandlerDescripcion);

    const inputHandlerPrecio = function(e) {
        resultPrecio.innerHTML = e.target.value+ "  &#8364";
    }
    precio.addEventListener('input', inputHandlerPrecio);

    const inputHandlerMarca = function(e) {
        resultMarca.innerHTML = "Marca: "+ e.target.value;
    }
    marca.addEventListener('input', inputHandlerMarca);

    const inputHandlerImagen = function(e) {
        const strImagen = e.target.value;
        const n = 4; 
        const extension = strImagen.substring(strImagen.length - n)
        if(extension=='.png'||extension=='.jpg'||extension=='.gif'||extension=='jpeg'||extension=='.svg'){
                checkIfImageExists(strImagen, (exists) => {
                        if (exists) {
                            resultImagen.src = e.target.value;
                            imagen.value = e.target.value;	  
                    }});
        }
    }
    imagenPrueba.addEventListener('input', inputHandlerImagen);

        function checkIfImageExists(url, callback) {
            const img = new Image();
            img.src = url;

            if (img.complete) {
                callback(true);
            } else {
                img.onload = () => {
                callback(true);
                };
                
                img.onerror = () => {
                callback(false);
                };
            }
            }
        function cancelar(){
            document.getElementById("estado").value = "RECHAZADO";
        }
        function aceptar(){
            document.getElementById("estado").value = "ACEPTADO";
        }
        function sortByKey(array, key) {
            return array.sort(function(a, b) {
                var x = a[key]; var y = b[key];
                return ((x < y) ? -1 : ((x > y) ? 1 : 0));
            });
        }

	</script>

</c:if>


</petclinic:layout>

