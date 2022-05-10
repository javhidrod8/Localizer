<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>

<petclinic:layout pageName="users">
	<spring:url value="/terminos" var="terminosUrl"></spring:url>
  <div class="container h-100 py-4">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-xl-10">
        <div class="card" style="border-radius: 1rem;">
          <div class="row g-0">
            <div class="col-md-12 col-lg-12 d-flex align-items-center">
              <div class="card-body p-4 p-lg-5 text-black">
				<div class="d-flex align-items-center justify-content-center">
			        <h1 class="h3 mb-3 fw-normal"><i class="fa-solid fa-address-card"></i> Información del usuario</h1>
			   </div>
		<div class="row g-5">
			<div class="col-md-12 col-lg-12">
				<div class="row g-3">
					<div class="col-sm-6">
						<label for="firstName" class="form-label">Nombre</label> <input
							type="text" class="form-control" id="firstName" name="firstName"
							placeholder="Nombre" value="${user.firstName}" disabled>
					</div>

					<div class="col-sm-6">
						<label for="lastName" class="form-label">Apellidos</label> <input
							type="text" class="form-control" id="lastName" name="lastName"
							placeholder="Apellidos" value="${user.lastName}" disabled>
					</div>

					<div class="col-md-6">
						<label for="username" class="form-label">Usuario</label>
						<div class="input-group">

								<input type="text" class="form-control" id="username"
									name="username" placeholder="Usuario" value="${user.username}"
									disabled>

						</div>
					</div>

					<div class="col-md-6">
						<label for="password" class="form-label">Password</label>
						<div class="input-group">
							<input type="password" class="form-control" id="password"
								name="password" placeholder="Password" value="${user.password}"
								disabled> <span class="input-group-text"><i
								class="fa fa-solid fa-eye-slash" id="togglePassword"></i></span>

						</div>
					</div>


					<spring:url value="/users/{username}/edit" var="editUrl">
						<spring:param name="username" value="${user.username}" />
					</spring:url>
					<a href="${fn:escapeXml(editUrl)}"><button
							class="w-100 btn btn-primary btn-lg" type="submit"><i class="fa-solid fa-pen-to-square"></i> Editar</button></a>
				</div>

			</div>


		</div>




              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

	<script>
		const togglePassword = document.querySelector("#togglePassword");
		const password = document.querySelector("#password");
		var eyeState = false;

		togglePassword.addEventListener("click", function() {
			// toggle the type attribute
			const type = password.getAttribute("type") === "password" ? "text"
					: "password";
			password.setAttribute("type", type);
			eyeState = !eyeState;
			// toggle the icon
			if (eyeState) {
				this.className = "fa fa-solid fa-eye";
			} else {
				this.className = "fa fa-solid fa-eye-slash";
			}

		});

	</script>



</petclinic:layout>