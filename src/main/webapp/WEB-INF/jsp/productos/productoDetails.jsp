<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<petclinic:layout pageName="productos">    
    
     <div class="row">
    <div class="col-xs-6 col-sm-3">
      <img height="200px" width=auto src="<c:out value="${producto.imagen}"/>" style="margin:0px 50px"/>
        </div>
    <div class="col-xs-6 col-sm-4" style="margin-left:2%">
   <b><c:out value="${producto.nombre}"/></b><br>
   <br>
   <h2><c:out value="${producto.precio}"/> &#8364<c:if test="${producto.verificado==true}">    <i class="fa fa-check" style="margin-left:2%"></i></c:if></h2><br>
  	<c:if test="${not empty producto.intolerancia  }">Contiene:   <c:out value="${producto.intolerancia}"/></c:if>
  	 
  	 <br><br>
   <button>Reservar</button>
   <br><br>   

   <button>Ver tienda</button>
   </div>
   <div class="col-xs-6 col-sm-3"> <h3>Productos de esta tienda:</h3> <br><br>
   <c:forEach items="${producto.tienda.productos}" var="productos">
     <img height="100px" width=auto src="<c:out value="${productos.imagen}"/>" style="margin:0px 50px"/>
     </br> </br><c:out value="${productos.nombre}"/> marca <c:out value="${producto.marca}"/>, 
     <c:out value="${productos.precio}"/> &#8364<c:if test="${productos.verificado==true}">    <i class="fa fa-check" style="margin-left:2%"></i></c:if></h2><br>
       </br><button>Reservar</button> </br> </br></c:forEach>
        </div>
   </div>
		
        
		


</petclinic:layout>