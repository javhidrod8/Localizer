<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--  >%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%-->
<%@ attribute name="name" required="true" rtexprvalue="true"
	description="Name of the active menu: home, owners, vets or error"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<spring:url value="/terminos" var="terminosUrl"></spring:url>
<spring:url value="/intolerancias" var="intoUrl"></spring:url>
<spring:url value="/" var="inicioUrl"></spring:url>
<spring:url value="/productos" var="productosUrl"></spring:url>
<spring:url value="/tiendas" var="tiendasUrl"></spring:url>
<spring:url value="/productos/search/" var="searchUrl"></spring:url>
<sec:authorize access="hasAuthority('vendedor')">
	<spring:url value="/tiendas/miTienda" var="miTiendaUrl"></spring:url>
</sec:authorize>
<sec:authorize access="hasAuthority('cliente')">
	<spring:url value="/users/{username}/reservas" var="reservasUrl">
		<sec:authentication property="principal" var="user" />
		<spring:param name="username" value="${user.username}" />
	</spring:url>
</sec:authorize>

<sec:authorize access="hasAuthority('nutricionista')">
	<spring:url value="/productos/verificar"
		var="productosNutricionistaUrl"></spring:url>
</sec:authorize>
<sec:authorize access="!isAuthenticated()">
	<spring:url value="/login" var="loginUrl"></spring:url>
	<spring:url value="/users/new" var="registroUrl"></spring:url>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
	<spring:url value="/logout" var="logoutUrl"></spring:url>
	<spring:url value="/users/{username}" var="miPerfil">
		<spring:param name="username">
			<sec:authentication property="name" />
		</spring:param>
	</spring:url>
</sec:authorize>

<script>
	function Buscar() {
		var text = $("#busqueda").val();
		location.href = "${fn:escapeXml(searchUrl)}" + text;
	}
</script>




<div class="menu-superior">
	<header
		class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-2">
		<div
			class="logo-box d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none justify-content-center ">
			<a href="/" class="logo-menu"> <img
				src="/resources/images/localizer-logo.png" class="logo-menu"
				alt="Logo Localizer">
			</a>
		</div>


		<ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
			<li><a href="${fn:escapeXml(inicioUrl)}"
				class="nav-link text-white">
					<div class="option-menu">
						<div class="icon-menu">
							<i class="fa-solid fa-house icon-menu"></i>
						</div>
						<div class="icon-leyenda">Inicio</div>
					</div>
			</a></li>
			
						<sec:authorize access="hasAuthority('vendedor')">
			<li><a href="${fn:escapeXml(miTiendaUrl)}"
				class="nav-link text-white">
					<div class="option-menu">
						<div class="icon-menu">
							<i class="fa-solid fa-store icon-menu"></i>
						</div>
						<div class="icon-leyenda">Mi Tienda</div>
					</div>
			</a></li>
			</sec:authorize>
			
			<sec:authorize access="hasAuthority('cliente')">
	<li><a href="${fn:escapeXml(reservasUrl)}"
				class="nav-link text-white">
					<div class="option-menu">
						<div class="icon-menu">
							<i class="fa-solid fa-basket-shopping icon-menu"></i>
						</div>
						<div class="icon-leyenda">Reservas</div>
					</div>
			</a></li>
</sec:authorize>
			
			<sec:authorize access="hasAuthority('nutricionista')">
			<li><a href="${fn:escapeXml(productosNutricionistaUrl)}"
				class="nav-link text-white">
					<div class="option-menu">
						<div class="icon-menu">
							<i class="fa-solid fa-check icon-menu"></i>
						</div>
						<div class="icon-leyenda">Verificar</div>
					</div>
			</a></li>
			</sec:authorize>
			
			

			
			<sec:authorize access="!hasAuthority('vendedor')">
			<li><a href="${fn:escapeXml(productosUrl)}"
				class="nav-link text-white">
					<div class="option-menu">
						<div class="icon-menu">
							<i class="fa-solid fa-bowl-food icon-menu"></i>
						</div>
						<div class="icon-leyenda">Productos</div>
					</div>
			</a></li>
			</sec:authorize>
			<sec:authorize access="!hasAnyAuthority('vendedor')">
			<li><a href="${fn:escapeXml(tiendasUrl)}"
				class="nav-link text-white">
					<div class="option-menu">
						<div class="icon-menu">
							<i class="fa-solid fa-store icon-menu"></i>
						</div>
						<div class="icon-leyenda">Tiendas</div>
					</div>
			</a></li>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<li><a href="${fn:escapeXml(miPerfil)}"
					class="nav-link text-white">
						<div class="option-menu">
							<div class="icon-menu">
								<i class="fa-solid fa-user icon-menu"></i>
							</div>
							<div class="icon-leyenda">
								<sec:authentication property="name" />
							</div>
						</div>
				</a></li>
			</sec:authorize>
			<sec:authorize access="!isAuthenticated()">
				<li><a href="${fn:escapeXml(loginUrl)}"
					class="nav-link text-white">
						<div class="option-menu">
							<div class="icon-menu">
								<i class="fa-solid fa-user icon-menu"></i>
							</div>
							<div class="icon-leyenda">Usuario</div>
						</div>
				</a></li>
			</sec:authorize>
		
		<li><a href="${fn:escapeXml(terminosUrl)}"
			class="nav-link text-white">
				<div class="option-menu">
					<div class="icon-menu">
						<i class="fa-solid fa-shield-halved"></i>
					</div>
					<div class="icon-leyenda">Términos</div>
				</div>
		</a></li>
		<li><a href="${fn:escapeXml(intoUrl)}" 
			class="nav-link text-white">
				<div class="option-menu">
 					<div class="icon-menu"> 
 						<i class="fa-solid fa-wheat-awn-circle-exclamation"></i>
 					</div> 
 					<div class="icon-leyenda">Intolerancias</div>
 				</div> 
		</a></li> 
</ul>
		<div
			class="botones-usuario d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none justify-content-center">
			<sec:authorize access="!isAuthenticated()">
				<a href="${fn:escapeXml(registroUrl)}" class="btn btn-primary"><i class="fa-solid fa-user-plus"></i> Registro</a>
				<a href="${fn:escapeXml(loginUrl)}" class="btn btn-primary"><i class="fa-solid fa-arrow-right-to-bracket"></i> Entrar</a>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<a href="${fn:escapeXml(miPerfil)}" class="btn btn-primary"><i class="fa-solid fa-user"></i> Mi Perfil </a>
				<a href="${fn:escapeXml(logoutUrl)}" class="btn btn-primary"><i class="fa-solid fa-arrow-right-from-bracket"></i> Salir</a>
			</sec:authorize>
		</div>
	</header>
</div>

