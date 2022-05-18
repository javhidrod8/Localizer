<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<petclinic:layout pageName="login">
	<spring:url value="/terminos" var="terminosUrl"></spring:url>
	<link href="/resources/css/signin.css" rel="stylesheet">

  <div class="container h-100 py-4">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-xl-10">
        <div class="card" style="border-radius: 1rem;">
          <div class="row g-0">
            <div class="col-md-12 col-lg-12 d-flex align-items-center">
              <div class="card-body p-4 p-lg-5 text-black">

                <form method="POST" action="${contextPath}/login" >

		<div class="d-flex align-items-center justify-content-center">
					<img class="mb-4" src="../resources/images/localizer-logo.png" alt=""
				width="100" height="90">
		</div>
				<div class="d-flex align-items-center justify-content-center">

                  <h1 class="h3 mb-3 fw-normal"><i class="fa-solid fa-user"></i> Iniciar sesi&#243n</h1>
                </div>

                  <div class="form-outline mb-4">
                   <label class="form-label" for="username">Usuario</label>
                    <input id="username" name="username" type="text" placeholder="Usuario" class="form-control form-control-lg" />
                   
                  </div>

                  <div class="form-outline mb-4">
                  <label class="form-label" for="password">Password</label>
                  <div class="input-group">
                    <input type="password" id="password" name="password" placeholder="Password" class="form-control form-control-lg" />
                    <span class="input-group-text"><i class="fa fa-solid fa-eye-slash" id="togglePassword"></i></span>
                  </div>
                  
                  </div>
                  
                  
                  
				<div class="botones d-grid gap-2 d-md-flex justify-content-md-end py-2">
					<a class="w-50 btn btn-outline-primary btn-lg px-4 mx-auto" href="/users/new"><i class="fa-solid fa-user-plus"></i> Registrar nuevo usuario</a>
					<button class="w-100 btn btn-outline-primary btn-lg px-4 mx-auto" type="submit"><i class="fa-solid fa-arrow-right-to-bracket"></i> Entrar</button>
					
				</div>
                </form>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

						<div class="py-2 text-center">
							<p class="lead"><a href="${fn:escapeXml(terminosUrl)}">T&eacuterminos y condiciones de uso</a>
							</p>
						</div>
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

 </script>


</petclinic:layout>

