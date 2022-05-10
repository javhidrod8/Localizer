<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<petclinic:layout pageName="success">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<spring:url value="/resources/images/localizer-logo.png" var="imgLogoUrl"></spring:url>
<div class="row d-flex justify-content-center py-5">
      <div class="col col-xl-10">
        <div class="card" style="border-radius: 1rem;">
          <div class="row g-0">
            <div class="col-md-12 col-lg-12 d-flex align-items-center">
              <div class="card-body p-4 p-lg-5 text-black">

		<div class="d-flex align-items-center justify-content-center">
					<img class="mb-4" src="${fn:escapeXml(imgLogoUrl)}" alt=""
				width="100" height="90">
		</div>
				<div class="d-flex align-items-center justify-content-center">

                   <h1 class="h3 mb-3 fw-normal">Pago con tarjeta</h1>
                </div>
                <div class="row d-flex align-items-center justify-content-center">
					<div class="my-2">
				        <h3 style='color: green;'>Pago realizado con exito.</h3>
				        <h4>Pulse el siguiente botón para continuar.</h4>
					</div>
					<div id="botones" class="d-flex gap-2 my-2">     
						<a href='/tiendas/new'> <button id="crearTienda" class="btn btn-lg btn-primary w-100">Crear Mi Tienda</button></a>
					</div>
                  </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    

	<script>$("#crearTienda").click()</script>
</petclinic:layout>