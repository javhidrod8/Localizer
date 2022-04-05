<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<petclinic:layout pageName="productos">

	<h2>Realizar pago</h2>
	
 <form method="post"  action="/pay">
                <div class="container">
					<div id="precio" class="form-group col-md-12">
						<label id="precio2" for="precio" style="pointer-events: none"
							readonly>
							<h3>Precio:</h3>
						</label>
						<div id="precio" class="input-group">
							<input required type="number" class="form-control"
								id="precio-num" name="price" placeholder="0" min=0 step="any"
								value="12" style="pointer-events: none" readonly>
							<div class="input-group-addon">&#8364</div>
						</div>
					</div>

                    <input type="text" id="euro" name="currency" placeholder="EUR" required value="EUR" readonly style="pointer-events: none" class="hidden">
                    <div id="pago" class="col-md-12">
						<label id="pago2" for="pago" style="pointer-events: none">
							<h3>Método de pago:</h3>
						</label> <input required type="text" id="method" name="method"
							class="form-control" value="Paypal" readonly
							style="pointer-events: none"><br>
					</div>
                    <input type="text" id="intent" name="intent" value="sale" readonly style="pointer-events: none" class="hidden">
        
                    <div id="descripcion" class="input-group">
                    
                     <div id="descripcion" class="col-md-12">
						<label id="descripcion2" for="descripcion" style="pointer-events: none">
							<h3>Descripción:</h3>
						</label> <input required type="text" id="description" name="description"
							class="form-control" value="Cuota mensual" readonly
							style="pointer-events: none"><br>
					</div>
					<br>
					<div class="col-md-12"><br><input type="submit" value="Continuar con el pago" class="btn btn-default"></div>
					
                </div>  </div>

                
            </form>

</petclinic:layout>

