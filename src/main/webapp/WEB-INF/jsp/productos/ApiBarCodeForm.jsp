<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<petclinic:layout pageName="productos">
   
    <form:form modelAttribute="" class="form-horizontal" id="add-producto-form">
        <div class="form-group has-feedback">
            <petclinic:inputField label="BarCode" name="barCode"/>
            <petclinic:inputField label="Precio" name="precio"/>
     
        </div>
        <div class="form-group">
                        <button class="btn btn-default" type="submit">Buscar Producto</button>
        </div>
    </form:form>
</petclinic:layout>

