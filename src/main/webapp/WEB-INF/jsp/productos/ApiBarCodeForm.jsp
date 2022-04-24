<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<petclinic:layout pageName="productos">

	<h2>
		<c:if test="${producto['new']}">Nuevo </c:if>
		ProductoAPI
	</h2>


	<form:form modelAttribute="productoAPI" class="form-horizontal"
		id="add-producto-form">
		<div class="container">
			<div id="tienda-producto col-md-12">
				<input type="text" id="tienda" name="tienda" class="hidden"
					value="${tiendaId}"><br>
			</div>
			<div id="barCode col-md-12">
				<input type="text" id="barCode" name="barCode" 
					value="${barCode}"><br>
			</div>	
			<div id="precio col-md-12">
				<input type="text" id="precio" name="precio" 
					value="${precio}"><br>
			</div>	
			<div id="productoAPI col-md-12">
				<input type="text" id="productoApi" name="productoApi" class="hidden"
					value="${productoApi}"><br>
			</div>	
			<button class='btn btn-default btn-sm' type="submit">A&ntildeadir
									ProductoAPI</button>	
			</div>					
	</form:form>
					
</petclinic:layout>

