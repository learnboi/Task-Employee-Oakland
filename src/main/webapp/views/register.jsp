<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Employee Registration</title>
  <link rel="icon" href="images/favicon.png" type="image/png">
  <link rel="stylesheet" href="styles/register.css">
</head>
<body>
<h1>Employee Registration</h1>
<div class="form-container">
  <form action="register-data" method="POST">
    <div class="error-message">
      <%
        String error = (String) request.getAttribute("error");
        if(error != null && !error.isEmpty()) {
      %>
      <span><%=error%></span>
      <%
        }
      %>
    </div>

    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required>

    <label for="dob">Date of Birth:</label>
    <input type="date" id="dob" name="dob" value="2024-01-01" min="1950-01-01" required>

    <label>Gender:</label>
    <div class="gender-options">
      <label><input type="radio" id="male" name="gender" value="Male" required> Male</label>
      <label><input type="radio" id="female" name="gender" value="Female" required> Female</label>
      <label><input type="radio" id="other" name="gender" value="Other" required> Other</label>
    </div>

    <label for="address">Address:</label>
    <textarea id="address" name="address" rows="3" required placeholder="Enter your address"></textarea>

    <label for="city">City:</label>
    <input type="text" id="city" name="city" required>

    <label for="state">State:</label>
    <input type="text" id="state" name="state" required>

    <label for="login_id">Login ID:</label>
    <input type="text" id="login_id" name="login_id" required>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required>

    <button type="submit">Register</button>

    <a href="login">Already Have an account? Login</a>
  </form>
</div>

<script>
  document.getElementById("name").focus();
  const today = new Date().toISOString().split('T')[0];
  document.getElementById("dob").setAttribute("max", today);
</script>

</body>
</html>
