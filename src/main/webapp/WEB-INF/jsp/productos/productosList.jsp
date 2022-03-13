<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Listado de productos</title>
<link href="${petclinicCss}" rel="stylesheet"/>
</head>
<body>
	<table>
		<tr>
			<th>Nombre</th><th>Precio</th><th></th>
			<c:forEach items="${productos}" var="producto">
				<tr>
					<td>${producto.nombre}</td>
					<td>${producto.precio}</td>
				</tr>
			</c:forEach>
		</tr>
	</table>
<!-- 	<p>
	<a href="/bills/create">Create Bill</a>
	</p> -->
</body>
</html>