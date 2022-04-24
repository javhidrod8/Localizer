<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>

<petclinic:layout pageName="login">
    
	<div class="container-login">

    <form method="POST" action="${contextPath}/login" class="form-signin ">
        <h2 class="form-heading">Iniciar sesión</h2>

        <div class="form-group ${error != null ? 'has-error' : ''}">
            <span class="">${msg}</span>
            <input name="username" type="text" class="form-control  login" placeholder="Usuario"
                   autofocus="true"/>
            <input name="password" type="password" class="form-control" placeholder="Contraseña"/>
            <span class="login">${errorMsg}</span>

            <button class="btn btn-default btn-sm login" type="submit">Iniciar Sesión</button>
        </div>

    </form>

</div>
	
</petclinic:layout>

