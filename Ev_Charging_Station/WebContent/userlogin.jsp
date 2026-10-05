<%@ page import="java.sql.*" %>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    boolean loggedIn = false;
    String msg = "";

    if(email != null && password != null){
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/evchargingstation", "root","");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM user WHERE email=? AND password=?");
            ps.setString(1, email.trim());
            ps.setString(2, password.trim());
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                loggedIn = true;
                session.setAttribute("user_email", email); // You can use this later
            } else {
                msg = " Invalid email or password.";
            }
            con.close();
        } catch(Exception e){
            msg = "Error: " + e.getMessage();
        }
    }
%>
<html>
<head>
    <title>User Login</title>
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
            max-width: 400px;
            margin: auto;
            box-shadow: 0 0 10px rgba(106, 27, 154, 0.2);
        }
        h2 {
            text-align: center;
            color: #6a1b9a;
        }
        input[type="email"], input[type="password"], input[type="submit"] {
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
        }
        input[type="submit"]:hover {
            background-color: #6a1b9a;
        }
        .msg {
            text-align: center;
            margin-top: 20px;
            color: #4a148c;
        }
        .link {
            text-align: center;
            margin-top: 15px;
        }
        .link a {
            color: #6a1b9a;
            text-decoration: none;
        }
    </style>
</head>
<body>

<% if(loggedIn) { %>
    <form>
        <h2>Welcome, <%= email %>!</h2>
        <div class="link">
            <a href="userdashborad.jsp"> View opations</a>
        </div>
    </form>
<% } else { %>
    <form method="post">
        <h2>User Login</h2>
        <label>Email:</label>
        <input type="email" name="email" required>

        <label>Password:</label>
        <input type="password" name="password" required>

        <input type="submit" value="Login">
        <div class="msg"><%= msg %></div>

        <div class="link">
            <a href="userregister.jsp">Don't have an account? Register here</a>
        </div>
    </form>
<% } %>

</body>
</html>
