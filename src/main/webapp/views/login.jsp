<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="styles/login-style.css">
</head>
<body>
<h1>Login</h1>
<div class="form-container">
    <form action="login-data" method="POST">
        <label for="login_id">Login ID:</label>
        <input type="text" id="login_id" name="login_id" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <button type="submit">Login</button>
        <%
            String alert = (String) request.getAttribute("error");
            if(alert != null && !alert.isEmpty()){
        %>
        <a style="color: darkred"><%= alert %></a>
        <%
            }
        %>
        <a href="register">Don't have an account? Register</a>
    </form>
</div>
<script>
    document.getElementById("login_id").focus();
</script>
</body>
</html>

