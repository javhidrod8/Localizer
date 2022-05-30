<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>

<petclinic:layout pageName="users">
	<spring:url value="/terminos" var="terminosUrl"></spring:url>
	              	<form:form modelAttribute="user" class="form-horizontal"
		id="add-user-form">
  <div class="container h-100 py-4">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-xl-10">
        <div class="card" style="border-radius: 1rem;">
          <div class="row g-0">
            <div class="col-md-12 col-lg-12 d-flex align-items-center">
              <div class="card-body p-4 p-lg-5 text-black">
              

		

		
			<c:if test="${isNew}">
					<input type="hidden" id="pagado" name="pagado" class="hidden" value=false readonly>
				<div class="d-flex align-items-center justify-content-center">
					<img class="mb-4" src="../resources/images/localizer-logo.png" width="100" height="90">
				</div>
				<div class="d-flex align-items-center justify-content-center">
			        <h1 class="h3 mb-3 fw-normal"><i class="fa-solid fa-address-card"></i> Nuevo Usuario</h1>
			   </div>
			</c:if>
			<c:if test="${!isNew}">
				<input type="hidden" id="pagado" name="pagado" class="hidden" value="${user.pagado}" readonly>
				<div class="d-flex align-items-center justify-content-center">
			          <h1 class="h3 mb-3 fw-normal"><i class="fa-solid fa-pen-to-square"></i> Editar Usuario</h1>
			    </div>
				
			</c:if>
					<div class="row g-3">
						<div class="col-sm-6">
							<label for="firstName" class="form-label">Nombre</label> <input
								type="text" class="form-control" id="firstName" name="firstName"
								placeholder="Nombre" value="${user.firstName}" required>
						</div>

						<div class="col-sm-6">
							<label for="lastName" class="form-label">Apellidos</label> <input
								type="text" class="form-control" id="lastName" name="lastName"
								placeholder="Apellidos" value="${user.lastName}" required>
						</div>

						<div class="col-md-6">
							<label for="username" class="form-label">Usuario</label>
							<div class="input-group">
								<c:if test="${isNew}">
									<input type="text" class="form-control" id="username"
										name="username" placeholder="Usuario" value="${user.username}"
										required>
								</c:if>
								<c:if test="${!isNew}">
									<input type="text" class="form-control" id="username"
										name="username" placeholder="Usuario" value="${user.username}"
										disabled>
								</c:if>

							</div>
						</div>

						<div class="col-md-6">
							<label for="password" class="form-label">Password</label>
							<div class="input-group">
								<input type="password" class="form-control" id="password"
									name="password" placeholder="Password" value="${user.password}"
									required>
								<span class="input-group-text"><i class="fa fa-solid fa-eye-slash" id="togglePassword"></i></span>
									
							</div>
						</div>
						<div class="col-md-4">

							<form:form modelAttribute="authorities" class="form-horizontal" id="authorities-form">
								<c:choose>
									<c:when test="${isNew}">
										<label for="authority" class="form-label">Rol</label>
										<select required name="authority" class="form-select" id="authority">
											<option id="cliente" value="cliente">CLIENTE</option>
											<option id="vendedor" value="vendedor">VENDEDOR</option>
										</select>
										<div class="invalid-feedback">Elija un tipo de usuario.
										</div>
									</c:when>
									<c:otherwise>

										<c:if test="${auth == 'cliente'}">
											<label for="authority" class="form-label">Rol</label>
											<select name="authority" class="form-select" id="authority"
												disabled>
												<option id="cliente" value="cliente">CLIENTE</option>
											</select>
										</c:if>
										<c:if test="${auth == 'vendedor'}">
											<label for="authority" class="form-label">Rol</label>
											<select name="authority" class="form-select" id="authority"
												disabled>
												<option id="vendedor" value="vendedor">VENDEDOR</option>
											</select>
										</c:if>

										<c:if test="${auth == 'admin'}">
											<label for="authority" class="form-label">Rol</label>
											<select name="authority" class="form-select" id="authority"
												disabled>
												<option id="admin" value="admin">ADMIN</option>
											</select>
										</c:if>

										<c:if test="${auth == 'nutricionista'}">
											<label for="authority" class="form-label">Rol</label>
											<select name="authority" class="form-select" id="authority"
												disabled>
												<option id="nutricionista" value="nutricionista">NUTRICIONISTA</option>
											</select>
										</c:if>
										<input type="hidden" name="auth" value="${auth}" readonly>
										<input type="hidden" id="tiendaId" name="tiendaId"
											value="${tiendaId}" readonly>
									</c:otherwise>

								</c:choose>

							</form:form>
						</div>
						<c:if test="${isNew}">
							<div class="col-md-8 d-flex align-items-center">
								<div id="descripcion">
									<label for="descripcion" class="form-label">Descripción</label>
									<p id="titulo-desc">Elija una opción para ver sus
										características.</p>
								</div>
							</div>

							<div class="col-md-12">
								<br>
								<div class="form-check">
									<input required type="checkbox" class="form-check-input"
										id="same-address"> <label class="form-check-label"
										for="same-address">Acepto los términos y condiciones
										de uso*</label>
								</div>
								<br>
							</div>
						</c:if>
					</div>



					<c:choose>
						<c:when test="${isNew}">
							<button class="w-100 btn btn-primary btn-lg" type="submit"><i class="fa-solid fa-user-plus"></i> Registrarse</button>
							
						</c:when>
						<c:otherwise>
							<button class="w-100 btn btn-primary btn-lg" type="submit"><i class="fa-solid fa-floppy-disk icon-menu"></i> Guardar Cambios</button>
						</c:otherwise>
					</c:choose>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
	</form:form>


					<c:if test="${isNew}">
						<div class="py-2 text-center">
							<p class="lead">
								* <a href="${fn:escapeXml(terminosUrl)}">Aquí</a> encontrará toda la información relativa a
								los términos y condiciones de uso, deberá aceptarlos para poder
								registrarse.
							</p>
						</div>
					</c:if>


	<script>
	
	const togglePassword = document.querySelector("#togglePassword");
    const password = document.querySelector("#password");
    var eyeState = false;

    togglePassword.addEventListener("click", function () {
        // toggle the type attribute
        const type = password.getAttribute("type") === "password" ? "text" : "password";
        password.setAttribute("type", type);
        eyeState = !eyeState;
        // toggle the icon
        if(eyeState){
        	this.className="fa fa-solid fa-eye";
        }else{
        	this.className="fa fa-solid fa-eye-slash";
        }
        
    });

    
    <c:if test="${isNew}">
    const selectElement = document.getElementById('authority');

    selectElement.addEventListener('change', (event) => {
        const resultado = document.getElementById('titulo-desc');
        if(event.target.value =='vendedor' ){
        	resultado.textContent = 'Como vendedor podrá dar de alta su tienda en la aplicación, subir productos y recibir reservas en cuanto pague la cuota mensual.';
        }
        else if(event.target.value =='cliente' ){
        	resultado.textContent = 'Como cliente podrá realizar reservas en las tiendas registradas.';
        }else {
        	resultado.textContent = 'Elija una opción para ver sus características.';
        }
    

});
    </c:if>


</script>

</petclinic:layout>