<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:layout pageName="productos">
    <h2>
        <c:if test="${producto['new']}">Nuevo </c:if> Producto
    </h2>
    <form:form modelAttribute="producto" class="form-horizontal" id="add-producto-form">
        <div class="form-group has-feedback">
            <petclinic:inputField label="Nombre" name="nombre"/>
            <petclinic:inputField label="Imagen" name="imagen"/>
            <petclinic:inputField label="Precio" name="precio"/>  <%--Necesita validación de numeros--%>
            <petclinic:inputField label="Marca" name="marca"></petclinic:inputField>
            <petclinic:inputField label="Descripcion" name="descripcion"></petclinic:inputField><%--es un textArea --%>
            <petclinic:inputField label="Estado" name="estado"></petclinic:inputField><%--es un radio con 3 opciones --%>
            <petclinic:inputField label="Motivo" name="motivo"></petclinic:inputField><%--es un textArea --%>
            <petclinic:inputField label="Promocionado" name="promocionado"></petclinic:inputField><%--es un radio con dos opciones, tiene que devolver 0 o 1 --%>
           <%-- <petclinic:inputField label="Intolerancias" name="intolerancia"></petclinic:inputField><%--es un checkbox y necesita toda la lista de intolerancias --%>
           <petclinic:inputField label="Preferencia" name="preferencia"></petclinic:inputField><%-- es un radio y necesita toda la lista de preferencias --%>
           <petclinic:inputField label="Tienda" name="tienda"></petclinic:inputField>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <c:choose>
                    <c:when test="${producto['new']}">
                        <button class="btn btn-default" type="submit">Añadir Producto</button>
                    </c:when>
                    <c:otherwise>
                        <button class="btn btn-default" type="submit">Actualizar Producto</button>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </form:form>
</petclinic:layout>