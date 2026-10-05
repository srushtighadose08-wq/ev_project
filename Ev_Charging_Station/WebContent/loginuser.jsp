<%@ page import="java.sql.*" %>
<%@ page import="databaseco.DbConnection" %>
<%
    String msg = "";

    if (request.getParameter("login") != null) {
        String mobile = request.getParameter("mobile");
        String password = request.getParameter("password");

        try {
            Connection con = DbConnection.connect();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM chargingstation WHERE mobile=? AND password=?");
            ps.setString(1, mobile.trim());
            ps.setString(2, password.trim());
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                session.setAttribute("station_name", rs.getString("station_name"));  // ✅ Only station_name stored
                response.sendRedirect("stationdashborad.jsp");
            } else {
                msg = " Invalid mobile number or password!";
            }
            con.close();
        } catch (Exception e) {
            msg = "⚠️ Error: " + e.getMessage();
        }
    }
%>
<html>
<head>
    <title>Charging Station Login</title>
    <style>
        body {
            font-family: "Segoe UI", sans-serif;
            background-color: #f3e5f5;
            padding: 40px;
        }

        form {
            background: #fff;
            padding: 30px;
            max-width: 450px;
            margin: auto;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(106, 27, 154, 0.2);
        }

        h2 {
            text-align: center;
            color: #6a1b9a;
            margin-bottom: 25px;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            font-size: 16px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            background-color: #8e24aa;
            color: white;
            border: none;
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
            color: red;
            margin-top: 15px;
            font-weight: bold;
        }
    </style>
</head>
<body>

    <form method="post">
        <h2>Charging Station Login</h2>

        <label>Mobile:</label>
        <input type="text" name="mobile" required>

        <label>Password:</label>
        <input type="password" name="password" required>

        <input type="submit" name="login" value="Login">
        <div class="msg"><%= msg %></div>
    </form>

</body>
</html>
