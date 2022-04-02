<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:layout pageName="users">
    <h2>
        <c:if test="${isNew}">Nuevo </c:if> Usuario
    </h2>
    <form:form modelAttribute="user" class="form-horizontal" id="add-user-form">
        <div class="form-group has-feedback">
            <petclinic:inputField label="First Name" name="firstName"/>
            <petclinic:inputField label="Last Name" name="lastName"/>
            <petclinic:inputField label="Username" name="username"/>
            <petclinic:inputField label="Password" name="password"/>
            
            <div class="row">
        <label class="col-sm-2 control-label">Rol</label>

        <div class="col-sm-10">
            	<select class="form-control" name="rol">
    			<option value="cliente">Cliente</option>
    			<option value="vendedor">Vendedor</option>
    			<option value="nutricionista">Nutricionista</option>
			</select></div></div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <c:choose>
                    <c:when test="${isNew}">
                        <button class="btn btn-default" type="submit">A�adir usuario</button>
                    </c:when>
                    <c:otherwise>
                        <button class="btn btn-default" type="submit">Actualizar usuario</button>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </form:form>
</petclinic:layout>
