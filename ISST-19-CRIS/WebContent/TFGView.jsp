<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<shiro:user>
  TFGVIew  Welcome back <shiro:principal />! Click <a href="LogoutServlet">here</a> to logout.
</shiro:user>
<shiro:user>	
	<h3>Mi TFG</h3>
			<table border="1">
				<tr>
					<th>Nombre</th>
					<th>Email</th>
					<th>Titulo</th>
					<th>Estado</th>
					<th>Profesor</th>
					<th>Acciones</th>
					
				</tr>
					<tr>
						<td>${miTFG.name}</td>
						<td>${miTFG.email}</td>
						<td>${miTFG.title}</td>
						<td>${miTFG.status}</td>
						<td>${miTFG.advisor.name}</td>
						<td><c:if test="${miTFG.status >= 4}">
							<form action="ServeFileServlet" method="get">
								<input type="hidden" name="email" value="${miTFG.email}" />
								<button type="submit">Descargar TFG</button>
							</form>
						</c:if></td>
					</tr>
			</table>
			<c:if test="${miTFG.status >= 3}">
				<h4>Subir Memoria</h4>
				<form action="Form4TFGServlet" method="post" enctype="multipart/form-data">
					<input type="hidden" name="email" value="${miTFG.email}" />
				    <input type="file" name="file" />
					<button type="submit">Subir memoria</button>
				</form>
			</c:if>

</shiro:user>
</body>
</html>