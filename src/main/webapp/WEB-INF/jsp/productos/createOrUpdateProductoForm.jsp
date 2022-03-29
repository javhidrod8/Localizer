<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>


<petclinic:layout pageName="productos">

	<h2>
		<c:if test="${producto['new']}">Nuevo </c:if>
		Producto
	</h2>
	<form:form modelAttribute="producto" class="form-horizontal"
		id="add-producto-form">
		<div class="container">
			<div class="form-group has-feedback">
				<div id="nombre-producto col-md-12">
					<label for="nombre">
						<h3>Nombre:</h3>
					</label> <input type="text" id="nombre" name="nombre" class="form-control"><br>
				</div>
				<div id="imagen-producto col-md-12">
					<label for="imagen">
						<h3>Imagen (URL):</h3>
					</label> <input type="text" id="imagen" name="imagen" class="form-control"><br>
				</div>
				<div id="precio-producto" class="form-group col-md-12">
					<label for="precio">
						<h3>Precio:</h3>
					</label>
					<div class="input-group">
						<input type="number" id="precio" class="form-control" id="precio"
							name="precio" placeholder="0" min=0 step="any">
						<div class="input-group-addon">&#8364</div>
					</div>
				</div>
				<div id="marca-producto col-md-12">
					<label for="marca">
						<h3>Marca:</h3>
					</label> <input type="text" id="marca" name="marca" class="form-control"><br>
				</div>
				<div id="descripcion-producto col-md-12">
					<label for="descripcion">
						<h3>Descripción:</h3>
					</label>
					<textarea class="form-control" name="descripcion" rows="3"></textarea>
					<br>
				</div>
				<div id="estado-producto">
					<h3>Estado:</h3>
					<div class="radio-inline">
						<label> <input type="radio" name="estado" id="pendiente"
							value="PENDIENTE" checked> PENDIENTE
						</label>
					</div>
					<div class="radio-inline">
						<label> <input type="radio" name="estado" id="aceptado"
							value="ACEPTADO"> ACEPTADO
						</label>
					</div>
					<div class="radio-inline">
						<label> <input type="radio" name="estado" id="rechazado"
							value="RECHAZADO"> RECHAZADO
						</label>
					</div>
				</div>

				<div id="motivo-producto col-md-12">
					<label for="motivo">
						<h3>Motivo:</h3>
					</label>
					<textarea class="form-control" rows="3" name="motivo"></textarea>
					<br>
				</div>

				<div id="promocionado-producto">
					<h3>Promocionado:</h3>
					<div class="radio-inline">
						<label> <input type="radio" name="promocionado"
							id="pendiente" value="TRUE" checked> SI
						</label>
					</div>
					<div class="radio-inline">
						<label> <input type="radio" name="promocionado"
							id="aceptado" value="FALSE"> NO
						</label>
					</div>
				</div>
				<div id="intolerancias-producto">
					<h3>Intolerancias</h3>
				</div>

				<div id="preferencias-producto">
					<h3>Preferencias</h3>
				</div>

				<petclinic:inputField label="Tienda" name="tienda"></petclinic:inputField>
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
			</div>
		</div>

	</form:form>
	<script type="text/javascript">
var intolerancias = new Array();
<c:forEach items="${intolerancias}" var="intolerancia">
	intolerancias.push("${intolerancia}");
</c:forEach>
intolerancias.forEach((intolerancia, i) => {
      var divIntolerancia = document.createElement('div');
      divIntolerancia.className="checkbox-inline";
      var label = document.createElement('label');
      var input = document.createElement('input');
      input.type ="checkbox";
      input.name ="intolerancia";
      input.value = i;
      console.log(intolerancia,i);
      label.appendChild(input);
      label.innerHTML +=" "+ intolerancia;
      divIntolerancia.appendChild(label);
      document.getElementById("intolerancias-producto").appendChild(divIntolerancia);

   });
</script>

	<script type="text/javascript">
var preferencias = new Array();
<c:forEach items="${preferencias}" var="preferencia">
	preferencias.push("${preferencia}");
</c:forEach>
preferencias.forEach((preferencia, i) => {
      var divPreferencia = document.createElement('div');
      divPreferencia.className="radio-inline";
      var label = document.createElement('label');
      var input = document.createElement('input');
      input.type ="radio";
      input.name ="preferencia";
      input.value = preferencia;
      label.appendChild(input);
      label.innerHTML +=" "+ preferencia;
      divPreferencia.appendChild(label);
      document.getElementById("preferencias-producto").appendChild(divPreferencia);

   });
</script>
</petclinic:layout>

