<%@ page import="com.project.Task.Model.Employee" %>
<%@ page import="java.util.List" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    if (session == null || session.getAttribute("name") == null ) {
        response.sendRedirect("login");
        return;
    }
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome Page</title>
    <link rel="stylesheet" href="styles/welcome-style.css">
</head>
<body>
<div class="message">
    <%
        String name = (String) session.getAttribute("name");
        String loginId = (String) session.getAttribute("login_id");
        if (name != null && !name.isEmpty()) {
    %>
    Hello, <%= name %>!
    <%
    } else {
    %>
    Hello, Guest!
    <%
        }
    %>
</div>

<table>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Date of Birth</th>
        <th>Gender</th>
        <th>Address</th>
        <th>City</th>
        <th>State</th>
    </tr>
    <%

        List<Employee> list = (List<Employee>) session.getAttribute("employees");
        if (list != null) {
            for (Employee e : list) {
                if(!e.getLogin_id().equals(loginId)){
    %>
    <tr>
        <td><%= e.getId() %></td>
        <td><%= e.getName() %></td>
        <td><%= e.getDob() %></td>
        <td><%= e.getGender() %></td>
        <td><%= e.getAddress() %></td>
        <td><%= e.getCity() %></td>
        <td><%= e.getState() %></td>
    </tr>
    <%
        }
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
    session.setAttribute("loginId", loginId);
%>
</body>
</html>
