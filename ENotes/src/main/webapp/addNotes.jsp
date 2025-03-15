<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
UserDetails user1 = (UserDetails) session.getAttribute("userD");
if (user1 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("login-error", "Please Login....");

}
%>






<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
<%@include file="all_component/allcss.jsp"%>
<style>
/* Page Layout */
body {
	background: linear-gradient(135deg, #667eea, #764ba2);
	font-family: Arial, sans-serif;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	min-height: 100vh;
	margin: 0;
	padding: 0;
}

/* Navbar */
.navbar {
	width: 100%;
	position: fixed;
	top: 0;
	left: 0;
	background: rgba(255, 255, 255, 0.9);
	padding: 15px 0;
	text-align: center;
	font-weight: bold;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

/* Main Content */
.container {
	flex: 1;
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	padding: 20px;
	margin-top: 80px;
	margin-bottom: 60px; /* Space for footer */
}

.card {
	max-width: 500px;
	width: 90%;
	padding: 20px;
	border-radius: 10px;
	background: white;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
	text-align: center;
}

.form-control {
	width: 100%;
	margin-bottom: 10px;
	padding: 10px;
	border: 1px solid #764ba2;
	border-radius: 6px;
}

.btn-primary {
	background: #007bff;
	border: none;
	padding: 10px 18px;
	border-radius: 6px;
	cursor: pointer;
	transition: 0.3s;
}

.btn-primary:hover {
	background: #0056b3;
}

/* Fixed Footer */
.footer {
	width: 100%;
	position: fixed;
	bottom: 0;
	left: 0;
	background: rgba(255, 255, 255, 0.9);
	padding: 15px 0;
	text-align: center;
	box-shadow: 0 -4px 10px rgba(0, 0, 0, 0.2);
}
</style>
</head>
<body>

	<%@include file="all_component/navbar.jsp"%>
	<!-- Full-width Navbar -->

	<div class="container">
		<div class="card">
			<h2>Add Your Notes</h2>
			<form action="AddNotesServlet" method="post">
				<%
				UserDetails us = (UserDetails) session.getAttribute("userD");
				int userId = (us != null) ? us.getId() : 0; // Assuming ID is an integer
				%>

				<input type="text" class="form-control" value="<%=userId%>"
					name="uid" readonly> <input type="text"
					class="form-control" placeholder="Enter Title" required
					name="title">
				<textarea class="form-control" rows="8" placeholder="Enter Content"
					name="content" required></textarea>
				<button type="submit" class="btn btn-primary">Add Note</button>
			</form>
		</div>
	</div>

	<%@include file="all_component/footer.jsp"%>
	<!-- Fixed Footer -->

</body>
</html>
