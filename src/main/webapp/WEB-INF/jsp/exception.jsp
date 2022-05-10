<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<petclinic:layout pageName="error">
<spring:url value="/resources/images/localizer-logo.png" var="imgLogoUrl"></spring:url>
<div class="container h-100 py-4">
    <div class="row d-flex justify-content-center align-items-center h-100">
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

                  <h1 class="h3 mb-3 fw-normal">Error</h1>
                </div>
                <div class="d-flex align-items-center justify-content-center">
                    <p class="lead h3">Ha ocurrido un error inesperado en la aplicación </p>
                 </div>
                  <div class="d-flex align-items-center justify-content-center">
                  	<p class="lead">Contacte con soporte.</p>
                  </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</petclinic:layout>