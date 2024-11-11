<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    if (session == null || session.getAttribute("login_id") == null ) {
        response.sendRedirect("login");
        return;
    }
%>

<%@ page import="java.util.List" %>
<%@ page import="com.project.Task.Model.Employee" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Employee List</title>
    <link rel="stylesheet" href="styles/admin-page-style.css">
</head>
<body>

<h2>Hello, Admin</h2>
<table>
    <tr>
        <th>Name</th>
        <th>Date of Birth</th>
        <th>Gender</th>
        <th>Address</th>
        <th>City</th>
        <th>State</th>
    </tr>
    <%
        List<Employee> list = (List<Employee>) request.getAttribute("employees");
        if (list != null) {
            for (Employee e : list) {
    %>
    <tr>
        <td><%= e.getName() %></td>
        <td><%= e.getDob() %></td>
        <td><%= e.getGender() %></td>
        <td><%= e.getAddress() %></td>
        <td><%= e.getCity() %></td>
        <td><%= e.getState() %></td>
    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="8" style="text-align:center;">No employees found</td>
    </tr>
    <%
        }
    %>
</table>

<div class="buttons">
    <a href="home">Home</a>
    <a href="logout">Logout</a>
</div>

<%
    session.setAttribute("username", session.getAttribute("username"));
%>

</body>
</html>
