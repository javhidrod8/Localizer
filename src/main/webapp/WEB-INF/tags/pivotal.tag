<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<br/>
<br/>


<spring:url value="/" var="homeUrl"></spring:url>
<spring:url value="/productos" var="productosUrl"></spring:url>
<spring:url value="/tiendas" var="tiendasUrl"></spring:url>
<spring:url value="/terminos" var="terminosUrl"></spring:url>
<sec:authorize access="!isAuthenticated()">
<spring:url value="/login" var="userUrl"></spring:url>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
	<spring:url value="/users/{username}" var="userUrl">
		<spring:param name="username">
			<sec:authentication property="name" />
		</spring:param>
	</spring:url>
</sec:authorize>

<div class="container">
  <footer class="py-3 my-4">
    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
      <li class="nav-item"><a href="${fn:escapeXml(homeUrl)}" class="nav-link px-2 text-muted"><i class="fa-solid fa-house icon-menu"></i> Inicio</a></li>
      <li class="nav-item"><a href="${fn:escapeXml(productosUrl)}" class="nav-link px-2 text-muted"><i class="fa-solid fa-bowl-food icon-menu"></i> Productos</a></li>
      <li class="nav-item"><a href="${fn:escapeXml(tiendasUrl)}" class="nav-link px-2 text-muted"><i class="fa-solid fa-store icon-menu"></i>  Tiendas</a></li>
      <li class="nav-item"><a href="${fn:escapeXml(userUrl)}" class="nav-link px-2 text-muted"><i class="fa-solid fa-user icon-menu"></i> Usuario</a></li>
      <li class="nav-item"><a href="${fn:escapeXml(terminosUrl)}" class="nav-link px-2 text-muted"><i class="fa-solid fa-shield-halved"></i> Términos y condiciones</a></li>
    </ul>
    <div class="d-flex justify-content-center align-content-center">
        <img src="<spring:url value="/resources/images/localizer-pivotal-logo.png" htmlEscape="true" />"
                                             alt="Localizer by ISPP G1-6"/>
    </div>

    <p class="text-center text-muted">&copy; 2022 Localizer por ISPP-6</p>
  </footer>
</div>
