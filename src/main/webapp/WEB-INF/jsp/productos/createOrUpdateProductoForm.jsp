<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<petclinic:layout pageName="productos">

	
<form:form modelAttribute="producto" class="form-horizontal" id="edit-producto-form">
		<spring:url value="/productos/verificar" var="productoUrl">
		</spring:url>	
		<button id="validarProducto" type="submit">Validar Producto</button>

</form:form>
<spring:url value="/productos/verificar" var="productosVerificarUrl"></spring:url>
<script>
  var a = confirm("¿Está seguro de que quiere validar el producto?");
 
  if(a==true){
	  document.getElementById("validarProducto").click();
  }else{
	  location.href = "${fn:escapeXml(productosVerificarUrl)}";
  }
</script>


</petclinic:layout>