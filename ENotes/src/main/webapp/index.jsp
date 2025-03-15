<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.Db.DBConnect" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ENotes</title>
<style type="text/css">
.back-img {
	background: url("img/Book_img.jpg");
	width: 100%;
	height: 93vh;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<%@include file="all_component/allcss.jsp"%>
<body>
<%@include file="all_component/navbar.jsp"%>

	<div class="container-fluid back-img">
		<div class="text-center">
			<h1 class="text-white">
				<i class="fa-solid fa-book"></i> E Notes - Save Your Notes
			</h1>
			<a href="login.jsp" class="btn btn-light">
				<i class="fa-solid fa-circle-user"></i> Login
			</a>
			<a href="reigster.jsp" class="btn btn-light">
				<i class="fa-solid fa-user-plus"></i> Register
			</a>
		</div>
	</div>

<%@include file="all_component/footer.jsp"%>

</body>
</html>
