<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Home Page</title>
    <%@include file="all_component/allcss.jsp"%>
    <style>
        /* New Modern Gradient Background */
        body {
           background: linear-gradient(135deg, #667eea, #764ba2);
            background-attachment: fixed;
            font-family: Arial, sans-serif;
            margin: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            color: white; /* White text for better contrast */
        }

        /* Navbar & Footer */
        .navbar, .footer {
            width: 100%;
            padding: 15px 0;
            text-align: center;
            background: rgba(255, 255, 255, 0.1); /* Transparent effect */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
        }

        /* Centered Content */
        .container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .card {
            background: rgba(255, 255, 255, 0.2); /* Slight transparency */
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            max-width: 500px;
            width: 90%;
            text-align: center;
            backdrop-filter: blur(10px); /* Glassmorphism effect */
        }

        img {
            max-width: 100%;
            border-radius: 8px;
        }

        h1 {
            margin: 20px 0;
            font-size: 24px;
        }

        .btn {
            padding: 12px 20px;
            font-size: 16px;
            border-radius: 6px;
            background-color: #ffcc00; /* Yellow button for contrast */
            color: black;
            border: none;
        }
        
        .btn:hover {
            background-color: #ff9900;
        }

    </style>
</head>
<body>

    <%@include file="all_component/navbar.jsp"%> <!-- Full-width Navbar -->

    <div class="container">
        <div class="card">
            <img src="img/Home img.jpg" alt="Home Image">
            <h1>Start Taking Your Notes</h1>
            <a href="addNotes.jsp" class="btn">Start Here</a>
        </div>
    </div>

    <%@include file="all_component/footer.jsp"%> <!-- Full-width Footer -->

</body>
</html>
