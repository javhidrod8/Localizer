<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Resultado</title>
</head>
<body>
	<c:if test="'${error}'" <h3 style='color: red;'>${error}</h3></c:if>
	<c:else>
		<div>
		<h3 style='color: green;'>Pago realizado con exito</h3>
		<div>
			Id.: <span>${id}</span>
		</div>
		<div>
			Estado: <span>${status}</span>
		</div>
		<div>
			Charge id.: <span>${chargeId}</span>
		</div>
		<div>
			Balance transaction id.: <span>${balance_transaction}</span>
		</div>
		</div>
	</c:else>
	<a href='/tiendas/new'>Ir al inicio</a>
</body>
</html>