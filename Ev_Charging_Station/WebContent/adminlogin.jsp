<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login - EV Charging Station Finder</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }
        .container {
            width: 400px;
            margin: 80px auto;
            padding: 25px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px #aaa;
        }
        input[type="text"], input[type="password"] {
            width: 95%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        input[type="submit"] {
            background-color: #28a745;
            color: white;
            padding: 10px;
            width: 100%;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }
        .error {
            color: red;
        }
    </style>
</head>
<body>

<%
    String msg = "";
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.jdbc.Driver"); // Make sure MySQL JDBC driver is added to build path
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/evchargingstation", "root", "");

            String query = "SELECT * FROM admin WHERE username = ? AND password = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                session.setAttribute("adminEmail", email);
                response.sendRedirect("admindashboard.jsp"); // You can create this JSP separately
            } else {
                msg = "Invalid Email or Password!";
            }

            con.close();
        } catch (Exception e) {
            msg = "Error: " + e.getMessage();
        }
    }
%>

<div class="container">
    <h2>Admin Login</h2>
    <form method="post" action="">
        <label>Email:</label><br>
        <input type="text" name="email" required><br>
        <label>Password:</label><br>
        <input type="password" name="password" required><br>
        <input type="submit" value="Login">
    </form>
    <% if (!msg.equals("")) { %>
        <p class="error"><%= msg %></p>
    <% } %>
</div>

</body>
</html>