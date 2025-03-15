<%@page import="com.User.post"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.DAO.PostDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
UserDetails user1 = (UserDetails) session.getAttribute("userD");
if (user1 == null) {
	session.setAttribute("login-error", "Please Login....");
	response.sendRedirect("login.jsp");
	return;
}

// Fetch notes from the database
PostDAO ob = new PostDAO(DBConnect.getConn());
List<post> postList = ob.getData(user1.getId());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Notes</title>
<%@ include file="all_component/allcss.jsp"%>
<script>
    // Confirmation function for delete operation
    function confirmDelete(noteId) {
        if (confirm("Are you sure you want to delete this note?")) {
            window.location.href = "DeleteServlet?note_id=" + noteId;
        }
    }
</script>
</head>
<body>
	<%@ include file="all_component/navbar.jsp"%>

	<!-- Display success or error messages -->
	<%
	String updateMsg = (String) session.getAttribute("updateMsg");
	String deleteMsg = (String) session.getAttribute("DeleteMsg");
	String wrongMsg = (String) session.getAttribute("wrongMsg");

	if (updateMsg != null) {
	%>
	<div class="alert alert-success" role="alert"><%=updateMsg%></div>
	<%
	session.removeAttribute("updateMsg");
	}

	if (deleteMsg != null) {
	%>
	<div class="alert alert-success" role="alert"><%=deleteMsg%></div>
	<%
	session.removeAttribute("DeleteMsg");
	}

	if (wrongMsg != null) {
	%>
	<div class="alert alert-danger" role="alert"><%=wrongMsg%></div>
	<%
	session.removeAttribute("wrongMsg");
	}
	%>

	<div class="container">
		<h2 class="text-center"><b>All Notes</b></h2>
		
		<!-- Import Notes Form -->
		<div class="mb-3">
			<form action="ImportServlet" method="post" enctype="multipart/form-data">
				<input type="hidden" name="userId" value="<%=user1.getId()%>">
				<input type="file" name="file" accept=".txt,.docx,.pdf" class="form-control mb-2">
				<button type="submit" class="btn btn-primary">Upload Note</button>
			</form>
		</div>
		
		<div class="row">
			<div class="col-md-12">
				<%
				if (postList != null && !postList.isEmpty()) {
					for (post po : postList) {
				%>
				<div class="card mt-3">
					<img src="img/Home img.jpg" class="card-img-top mt-2 mx-auto"
						style="max-width: 100px;">

					<div class="card-body p-4">
						<h5 class="card-title"><%=po.getTitle()%></h5>
						<p><%=po.getContent()%></p>

						<p>
							<b class="text-success">Published By: </b><br><%=user1.getName()%>
						</p>

						<p>
							<b class="text-primary">Published On: </b><%=po.getPdate()%>
						</p>

						<div class="container text-center mt-2">
							<%
							if (po.getId() > 0) {
							%>
							<!-- Export Options -->
							<a href="ExportPDFServlet?note_id=<%=po.getId()%>" class="btn btn-danger">Export PDF</a>
							<a href="ExportWordServlet?note_id=<%=po.getId()%>" class="btn btn-info">Export Word</a>
							<a href="ExportTxtServlet?note_id=<%=po.getId()%>" class="btn btn-secondary">Export TXT</a>
							
							<!-- Edit & Delete Options -->
							<a href="edit.jsp?note_id=<%=po.getId()%>" class="btn btn-warning">Edit</a>
							<button class="btn btn-danger" onclick="confirmDelete(<%=po.getId()%>)">Delete</button>
							<%
							} else {
							%>
							<p class="text-danger">Invalid Note ID</p>
							<%
							}
							%>
						</div>
					</div>
				</div>
				<%
				}
				} else {
				%>
				<p class="text-center text-muted">No notes found.</p>
				<%
				}
				%>
			</div>
		</div>
	</div>
</body>
</html>
