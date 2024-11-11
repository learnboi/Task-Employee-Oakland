<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Default Page</title>
    <link rel="stylesheet" href="styles/index-style.css">
</head>
<body>
<h1>Welcome to Our Page</h1>
<div class="buttons">
    <%
        String loginId = (String) session.getAttribute("login_id");
        if (loginId != null && loginId.equals("admin")) {
    %>
    <a href="admin-page">Dashboard</a>  <!-- Admin Home -->
    <%
    } else if (loginId != null) {
    %>
    <a href="welcome">Profile</a>  <!-- Employee Welcome Page -->
    <%
    } else {
    %>
    <a href="home">Home</a>  <!-- Public Home -->
    <%
        }
    %>
    <%
        if (loginId == null) {
    %>
    <a href="login">Login</a>
    <a href="register">Register</a>
    <%
        } else {
    %>
    <a href="logout">Logout</a>
    <%
        }
    %>
</div>
</body>
</html>
