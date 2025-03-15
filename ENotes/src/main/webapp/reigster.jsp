<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
	background: rgb(238, 174, 206);
	background: linear-gradient(90deg, rgba(238, 174, 206, 1) 5%,
		rgba(143, 179, 235, 0.9781162464985994) 100%);
}
</style>
<meta charset="ISO-8859-1">
<title>Register Page</title>
<%@include file="all_component/allcss.jsp"%>
<!-- Including CSS & Bootstrap -->
</head>
<body>

	<%@include file="all_component/navbar.jsp"%>
	<!-- Including Navbar -->

	<!-- Centered Card Container -->
	<div
		class="container-fluid d-flex justify-content-center align-items-center"
		style="min-height: 100vh;">
		<div class="card" style="width: 400px;">
			<div class="card-header text-center text-white bg-dark">
				<h3>
					<i class="fa-solid fa-user-plus"></i> Register
				</h3>
			</div>


			<%
			String regMsg = (String) session.getAttribute("Reg-Sucess");
			if (regMsg != null) {
			%>
			<div class="alert alert-success" role="alert"><%=regMsg%> Login <a href="login.jsp">Click Here</a></div>
			<%
			session.removeAttribute("Reg-Sucess");
			}
			%>


			<%
			String FailedMsg = (String) session.getAttribute("Failed-Msg");
			if (FailedMsg != null) {
			%>
			<div class="alert alert-danger" role="alert"><%=FailedMsg%></div>
			<%
			session.removeAttribute("Failed-Msg");
			}
			%>

			<div class="card-body">
				<form action="UserServlet" method="post">

					<div class="mb-3">
						<label for="exampleInputName" class="form-label"> Enter
							Full Name</label> <input type="text" class="form-control"
							id="exampleInputName" required name="fname">
					</div>

					<div class="mb-3">
						<label for="exampleInputEmail1" class="form-label"> Enter
							Email address</label> <input type="email" class="form-control"
							id="exampleInputEmail1" aria-describedby="emailHelp" required
							name="uemail">
					</div>

					<div class="mb-3">
						<label for="exampleInputPassword1" class="form-label">
							Enter Password</label> <input type="password" class="form-control"
							id="exampleInputPassword1" required name="upassword">
					</div>

					<div class="mb-3 form-check">
						<input type="checkbox" class="form-check-input" id="exampleCheck1">
						<label class="form-check-label" for="exampleCheck1">Remember
							me</label>
					</div>

					<button type="submit" class="btn btn-primary w-100 "
						style="background: #9c27b0">Reigster</button>
				</form>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>
