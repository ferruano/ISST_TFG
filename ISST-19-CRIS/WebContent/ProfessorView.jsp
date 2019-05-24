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
   Professor view Welcome back <shiro:principal />! Click <a href="LogoutServlet">here</a> to logout.
</shiro:user>
<shiro:user>	
	<h3>Mis datos</h3>
			<table border="1">
				<tr>
					<th>Nombre</th>
					<th>Email</th>
				</tr>
					<tr>
						<td>${prof.name}</td>
						<td>${prof.email}</td>
					</tr>
			</table>
	<h3>Listado de tfgs</h3>
		<table border="1">
			<tr>
				<th>Título</th>
				<th>Email alumno</th>
				<th>Nombre del alumno</th>
				<th>Estado del TFG</th>
				<th>Memoria</th>
				<th>Acción requerida</th>
			</tr>
			<c:forEach items="${prof.advisedTFGs}" var="tfgi">
				<tr>
					<td>${tfgi.title }</td>
					<td>${tfgi.email }</td>
					<td>${tfgi.name }</td>
					<td>${tfgi.status }</td>
					<td></td>
					<td>
					<c:if test="${tfgi.status == 1}">
						<form action="Form2ProfessorServlet" method="post">
							<input type="hidden" name="email" value="${tfgi.email}" />
							<button type="submit">Aceptar tfg</button>
						</form>
					</c:if>
					<c:if test="${tfgi.status >= 4}">
						<form action="ServeFileServlet" method="get">
							<input type="hidden" name="email" value="${tfgi.email}" />
							<button type="submit">Descargar TFG</button>
						</form>
					</c:if></td>
		
				</tr>
			</c:forEach>
		</table>
</shiro:user>
</body>
</html>