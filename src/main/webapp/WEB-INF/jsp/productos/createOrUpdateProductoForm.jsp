<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<petclinic:layout pageName="productos">

	<h2>
		<c:if test="${producto['new']}">Nuevo </c:if>
		Producto <c:if test="${auth == 'nutricionista'}">:
					<c:out value="${producto.nombre}"></c:out></c:if>
	</h2>
	<form:form modelAttribute="producto" class="form-horizontal"
		id="add-producto-form">
		<div class="container">
			<div class="form-group has-feedback">
				
				<div id="nombre-producto col-md-12">
					<label id="nombre2" for="nombre">
						<h3>Nombre:</h3>
					</label> <input required type="text" id="nombre" name="nombre" class="form-control" value="${producto.nombre}"><br>
				</div>
				<div id="imagen-producto col-md-12">
					<label id="imagen2" for="imagen">
						<h3>Imagen (URL):</h3>
						     				<c:if
						test="${producto.imagen!=null}"> 
						<img src="${producto.imagen }" class="img-responsive"/>
				</c:if> 
					</label> <input required type="text" id="imagen" name="imagen" class="form-control" value="${producto.imagen}"><br>



				</div>
				<div id="precio-producto" class="form-group col-md-12">
					<label id="precio2" for="precio">
						<h3>Precio:</h3>
					</label>
					<div id="precio" class="input-group">
						<input required type="number" id="precio" class="form-control" id="precio"
							name="precio" placeholder="0" min=0 step="any" value="${producto.precio}">
						<div class="input-group-addon">&#8364</div>
					</div>
				</div>
				<div id="marca-producto col-md-12">
					<label id="marca2" for="marca">
						<h3>Marca:</h3>
					</label> <input required type="text" id="marca" name="marca" class="form-control" value="${producto.marca}"><br>
				</div>
				<div id="descripcion-producto col-md-12">
					<label id="descripcion2" for="descripcion">
						<h3>Descripción:</h3>
					</label>
					<textarea class="form-control" id="descripcion" name="descripcion" rows="3" value="${producto.descripcion}"></textarea>
					<br>
				</div>
				
				<c:if test="${auth == 'nutricionista'}">
					<div id="estado-producto">
					<h3>Estado:</h3>
					<div class="radio-inline">
						<label> <input type="radio" name="estado" id="pendiente"
							value="PENDIENTE" 						     				
							<c:if test="${producto.estado=='PENDIENTE'}">checked</c:if> > PENDIENTE
						</label>
					</div>
					<div class="radio-inline">
						<label> <input type="radio" name="estado" id="aceptado"
							value="ACEPTADO"
							<c:if test="${producto.estado=='ACEPTADO'}">checked</c:if> > ACEPTADO
						</label>
					</div>
					<div class="radio-inline">
						<label> <input type="radio" name="estado" id="rechazado"
							value="RECHAZADO"
							<c:if test="${producto.estado=='RECHAZADO'}">checked</c:if> > RECHAZADO
						</label>
					</div>
				</div>
						</c:if>
					<c:if test="${auth == 'vendedor'}">
							<input checked type="radio" name="estado" id="pendiente"
							value="PENDIENTE"> PENDIENTE
					</c:if>	
				
				
				<div id="vendedor">
				<div id="motivo-producto col-md-12">
					<label for="motivo">
						<h3>Motivo:</h3>
					</label>
					<textarea class="form-control" rows="3" name="motivo" value="${producto.motivo}"></textarea>
					<br>
				</div>
				
				<div id="promocionado-producto">
					<h3>Promocionado:</h3>
					<div class="radio-inline">
						<label> <input type="radio" name="promocionado"
							id="no" value="TRUE" <c:if test="${producto.promocionado}">checked</c:if>> SI
						</label>
					</div>
					<div class="radio-inline">
						<label> <input type="radio" name="promocionado"
							id="si" value="FALSE" <c:if test="${!producto.promocionado}">checked</c:if>> NO
						</label>
					</div>
				</div>
				<div id="intolerancias-producto">
					<h3>Intolerancias</h3>
				</div>

				<div id="preferencias-producto">
					<h3>Preferencias</h3>
				</div>
				
				<div id="marca-producto col-md-12">
					<input type="text" id="tienda" name="tienda" class="hidden" value="${tiendaId}"><br>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<c:choose>
						<c:when test="${producto['new']}">
							<button class="btn btn-default" type="submit">Añadir
								Producto</button>
						</c:when>
						<c:otherwise>
							<button class="btn btn-default" type="submit">Actualizar
								Producto</button>
						</c:otherwise>
					</c:choose>
				</div>
			</div></div>
		</div>

	</form:form>
	<script type="text/javascript">
var intolerancias = new Array();
var intoleranciasSeleccionadas = new Array();
var intoleranciasSeleccionadasNombres = new Array();
<c:forEach items="${intolerancias}" var="intolerancia">
	intolerancia = {id:"${intolerancia.id}", nombre:"${intolerancia.nombre}"};
	intolerancias.push(intolerancia);
</c:forEach>
<c:forEach items="${producto.intolerancia}" var="intolerancia">
intoleranciaSeleccionada = {id:"${intolerancia.id}", nombre:"${intolerancia.nombre}"};
intoleranciasSeleccionadas.push(intoleranciaSeleccionada);
</c:forEach>
<c:forEach items="${producto.intolerancia}" var="intolerancia">
intoleranciaSeleccionada = "${intolerancia.nombre}";
intoleranciasSeleccionadasNombres.push(intoleranciaSeleccionada);
</c:forEach>

intolerancias.forEach((intolerancia) => {
      var divIntolerancia = document.createElement('div');
      divIntolerancia.className="checkbox-inline";
      var label = document.createElement('label');
      var input = document.createElement('input');
      input.type ="checkbox";
      input.name ="intolerancia";
      input.value = intolerancia.id;
      input.id = intolerancia.nombre;
      label.appendChild(input);
      label.innerHTML +=" "+ intolerancia.nombre;
      divIntolerancia.appendChild(label);
      document.getElementById("intolerancias-producto").appendChild(divIntolerancia);
      if (intoleranciasSeleccionadasNombres.includes(intolerancia.nombre)){
    	  document.getElementById(intolerancia.nombre).checked = true;
      }
   });
</script>

	<script type="text/javascript">
var preferencias = new Array();
var preferenciaSeleccionada = "${producto.preferencia}";
<c:forEach items="${preferencias}" var="preferencia">
	preferencias.push("${preferencia}");
</c:forEach>

preferencias.forEach((preferencia, i) => {
	if (preferencia!="" && preferencia!=null){
	      var divPreferencia = document.createElement('div');
	      divPreferencia.className="radio-inline";
	      var label = document.createElement('label');
	      var input = document.createElement('input');
	      input.type ="radio";
	      input.name ="preferencia";
	      input.value = preferencia;
	      input.id = preferencia;
	      label.appendChild(input);
	      label.innerHTML +=" "+ preferencia;
	      divPreferencia.appendChild(label);
	      document.getElementById("preferencias-producto").appendChild(divPreferencia);
	      if (preferenciaSeleccionada == preferencia){
	    	  document.getElementById(preferencia).checked = true;
	      }
	}


   });
</script>

<c:if test="${auth == 'nutricionista'}">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		
	<script>
	$("#nombre2").hide();$("#nombre").hide();
	$("#imagen").hide();$("#imagen2").hide();
	$("#marca").hide();$("#marca2").hide();
	$("#descripcion").hide();$("#descripcion2").hide();
	$("#precio").hide();$("#precio2").hide();
	</script>
</c:if>
<c:if test="${auth == 'vendedor'}">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		
	<script>
	$("#vendedor").hide();
	</script>
</c:if>
</petclinic:layout>

