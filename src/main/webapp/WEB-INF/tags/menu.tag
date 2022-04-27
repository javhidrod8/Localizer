<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!--  >%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%-->
<%@ attribute name="name" required="true" rtexprvalue="true"
	description="Name of the active menu: home, owners, vets or error"%>
	<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
	

<nav class="navbar navbar-default" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand"
				href="<spring:url value="/" htmlEscape="true" />"><span></span></a>
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#main-navbar">
				<span class="sr-only"><os-p>Toggle navigation</os-p></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>
		<div class="navbar-collapse collapse" id="main-navbar">
			<ul class="nav navbar-nav">

<%-- 				<petclinic:menuItem active="${name eq 'home'}" url="/"
					title="home page">
					<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
					<span>Home</span>
				</petclinic:menuItem>

				<petclinic:menuItem active="${name eq 'owners'}" url="/owners/find"
					title="find owners">
					<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
					<span>Find owners</span>
				</petclinic:menuItem>

				<petclinic:menuItem active="${name eq 'vets'}" url="/vets"
					title="veterinarians">
					<span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>
					<span>Veterinarians</span>
				</petclinic:menuItem>

				<petclinic:menuItem active="${name eq 'error'}" url="/oups"
					title="trigger a RuntimeException to see how it is handled">
					<span class="glyphicon glyphicon-warning-sign" aria-hidden="true"></span>
					<span>Error</span>
				</petclinic:menuItem>

	 --%>		

				<petclinic:menuItem active="${name eq 'home'}" url="/"
					title="home page">
					<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
					<span>Inicio</span>
				</petclinic:menuItem>

				<petclinic:menuItem active="${name eq 'productos'}" url="/productos"
					title="productos">
					<!-- <span class="glyphicon glyphicon-search" aria-hidden="true"></span>-->
					<span>Productos</span>
				</petclinic:menuItem>
				
				<petclinic:menuItem active="${name eq 'tiendas'}" url="/tiendas"
					title="tiendas">
					<span>Tiendas</span>
				</petclinic:menuItem>

				 <sec:authorize access="hasAuthority('vendedor')">  
				 <petclinic:menuItem active="${name eq 'miTienda'}" url="/tiendas/miTienda"
					title="tiendaVendedor">
					<span>Mi tienda</span>
				</petclinic:menuItem>
				 </sec:authorize>
				 
				 <sec:authorize access="hasAuthority('nutricionista')">  
				 <petclinic:menuItem active="${name eq 'productosPorVerificar'}" url="/productos/verificar"
					title="productosPorVerificar">
					<span>Productos Por Verificar</span>
				</petclinic:menuItem>
				 </sec:authorize>
				 <sec:authorize access="hasAuthority('cliente')">
                <spring:url value="/users/{username}/reservas" var="historialUrl">
                	<sec:authentication property="principal" var= "user"/>
                        <spring:param name="username" value="${user.username}" />
                    </spring:url>    
                 <petclinic:menuItem active="${name eq 'historialReservas'}" url="${fn:escapeXml(historialUrl)}"
                    title="historialReservas">
                    <span>Mis Reservas</span>
                </petclinic:menuItem>
                 </sec:authorize>
                 <petclinic:menuItem active="${name eq 'terminos'}" url="/terminos"
					title="terminos">
					<span>T�rminos</span>
				</petclinic:menuItem>




</ul>


			<ul class="nav navbar-nav navbar-right">
				<sec:authorize access="!isAuthenticated()">
					<li><a href="<c:url value="/login" />">Acceder</a></li>
					<li><a href="<c:url value="/users/new" />">Registro</a></li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> <span class="glyphicon glyphicon-user"></span>�
							<strong><sec:authentication property="name" /></strong> <span
							class="glyphicon glyphicon-chevron-down"></span>
					</a>
						<ul class="dropdown-menu">
							<li>
								<div class="navbar-login">
									<div class="row">
										<div class="col-lg-4">
											<p class="text-center">
												<span class="glyphicon glyphicon-user icon-size"></span>
											</p>
										</div>
										<div class="col-lg-8">
											<p class="text-left">
												<strong><sec:authentication property="name" /></strong>
											</p>
											<p class="text-left">
											<spring:url value="/users/{username}" var="miPerfil">
               	 							<spring:param name="username"> <sec:authentication property="name"/></spring:param>
            								</spring:url>
												<a href="${fn:escapeXml(miPerfil)}"
													class="btn btn-primary btn-block btn-sm">Mi perfil</a>
											</p>
											<p class="text-left">
												<a href="<c:url value="/logout" />"
													class="btn btn-primary btn-block btn-sm">Cerrar sesi�n</a>
											</p>
											
										</div>
									</div>
								</div>
							</li>
							<li class="divider"></li>
<!-- 							
                            <li> 
								<div class="navbar-login navbar-login-session">
									<div class="row">
										<div class="col-lg-12">
											<p>
												<a href="#" class="btn btn-primary btn-block">My Profile</a>
												<a href="#" class="btn btn-danger btn-block">Change
													Password</a>
											</p>
										</div>
									</div>
								</div>
							</li>
-->
						</ul></li>
				</sec:authorize>
			</ul>
		</div>
	</div>
</nav>
