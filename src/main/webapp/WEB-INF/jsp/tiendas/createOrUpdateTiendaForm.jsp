<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:layout pageName="tiendas">
    <h2>
        <c:if test="${tienda['new']}">Nueva </c:if> Tienda
    </h2>
    <form:form modelAttribute="tienda" class="form-horizontal" id="add-tienda-form">
        <div class="form-group has-feedback">
            <petclinic:inputField label="Nombre" name="nombre"/>
            <petclinic:inputField label="Descripci�n" name="descripcion"/>
            <petclinic:inputField label="Calle" name="calle"/>
            <petclinic:inputField label="Provincia" name="provincia"/>
            <petclinic:inputField label="C�digo Postal" name="codigoPostal"/>
            <petclinic:inputField label="Tel�fono" name="telefono"/>
            <petclinic:inputField label="Horario" name="horario"/>
            <petclinic:inputField label="Imagen de la tienda (url)" name="imagen"/>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <c:choose>
                    <c:when test="${tienda['new']}">
                        <button class="btn btn-default" type="submit">A&ntildeadir Tienda</button>
                    </c:when>
                    <c:otherwise>
                        <button class="btn btn-default" type="submit">Actualizar Tienda</button>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </form:form>
</petclinic:layout> 
