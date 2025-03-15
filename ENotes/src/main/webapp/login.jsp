<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<%@include file="all_component/allcss.jsp"%>
<title>Login Page</title>
<style>
body {
	background: rgb(238, 174, 206);
	background: linear-gradient(90deg, rgba(238, 174, 206, 1) 5%,
		rgba(143, 179, 235, 0.9781162464985994) 100%);
}
</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div
		class="container-fluid d-flex justify-content-center align-items-center div-color"
		style="min-height: 100vh;">
		<div class="card" style="width: 400px;">
			<div class="card-header text-center text-white bg-dark">
				<h3>
					<i class="fa-solid fa-circle-user"></i> Login
				</h3>
			</div>


           <%
			String invalidMsg = (String) session.getAttribute("login-failed");
			if (invalidMsg!= null) {
			%>
			<div class="alert alert-danger" role="alert"><%=invalidMsg%></div>
			<%
			session.removeAttribute("invalidMsg");
			}
			%>
			
			<%
			
			String withoutlogin= (String)session.getAttribute("login-error");
			if(withoutlogin!=null)
			{
				%>
				<div class="alert alert-danger" role="alert"><%=withoutlogin%></div>
				<%
				session.removeAttribute("login-error");
				}
				%>
				
			<%
			String logoutMsg=(String)session.getAttribute("logoutMsg");
			if(logoutMsg!=null)
			{%>
			
			<div class="alert alert-success" role="alert"><%=logoutMsg%></div>
			
			
			<%
			session.removeAttribute("logoutMsg");
			}
			
			%>




			<div class="card-body">
				<form action="loginServlet" method="post">
					<div class="mb-3">
						<label for="exampleInputEmail1" class="form-label"> Enter
							Email address</label> <input type="email" class="form-control"
							id="exampleInputEmail1" aria-describedby="emailHelp" name="uemail"required>
					</div>

					<div class="mb-3">
						<label for="exampleInputPassword1" class="form-label">
							Enter Password</label> <input type="password" class="form-control"
							id="exampleInputPassword1" name="upassword"required>
					</div>

					<button type="submit" class="btn btn-primary w-100 "
						style="background: #9c27b0">Login</button>
				</form>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>


</body>
</html>