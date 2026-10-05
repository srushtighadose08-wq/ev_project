<%@ page import="java.sql.*" %>
<%
    String msg = "";

    if (request.getParameter("submit") != null) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String password = request.getParameter("password");
        String city = request.getParameter("city");

        if (!name.trim().equals("") && !email.trim().equals("") && !mobile.trim().equals("") && !password.trim().equals("") && !city.trim().equals("")) {
            try {
                // Update your DB URL, user, password if needed
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/evchargingstation", "root", "");
                PreparedStatement ps = con.prepareStatement("INSERT INTO user(name, email, mobile, city, password) VALUES (?, ?, ?, ?, ?)");
                ps.setString(1, name.trim());
                ps.setString(2, email.trim());
                ps.setString(3, mobile.trim());
                ps.setString(4, city.trim());
                ps.setString(5, password.trim());

                int i = ps.executeUpdate();
                msg = (i > 0) ? "✅ User Registered Successfully!" : "❌ Registration failed. Try again.";
                con.close();
            } catch (Exception e) {
                msg = "⚠️ Error: " + e.getMessage();
            }
        } else {
            msg = "⚠️ All fields are required.";
        }
    }
%>
<html>
<head>
    <title>User Registration</title>
    <style>
        body {
            font-family: "Segoe UI", sans-serif;
            background-color: #f3e5f5;
            padding: 30px;
        }
        form {
            background: #fff;
            padding: 25px 30px;
            border-radius: 10px;
            max-width: 500px;
            margin: auto;
            box-shadow: 0 0 10px rgba(106, 27, 154, 0.2);
        }
        h2 {
            text-align: center;
            color: #6a1b9a;
        }
        input[type="text"], input[type="email"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 12px;
            font-size: 15px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }
        input[type="submit"] {
            background-color: #8e24aa;
            color: white;
            border: none;
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border-radius: 6px;
            margin-top: 20px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #6a1b9a;
        }
        .msg {
            text-align: center;
            margin-top: 20px;
            color: #4a148c;
        }
    </style>
</head>
<body>
    <form method="post">
        <h2>User Registration</h2>
        <label>Name:</label>
        <input type="text" name="name" required>

        <label>Email:</label>
        <input type="email" name="email" required>

        <label>Mobile:</label>
        <input type="text" name="mobile" required>

        <label>Password:</label>
        <input type="password" name="password" required>

        <label>City:</label>
        <input type="text" name="city" required>

        <input type="submit" name="submit" value="Register">
        <div class="msg"><%= msg %></div>
    </form>
</body>
</html>
