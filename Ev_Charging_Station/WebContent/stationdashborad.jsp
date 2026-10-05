<%@ page import="java.sql.*" %>
<%
    String stationName = (String) session.getAttribute("station_name");
    if (stationName == null) {
        response.sendRedirect("loginuser.jsp"); // redirect if not logged in
        return;
    }
%>
<html>
<head>
    <title>Charging Station Dashboard</title>
    <style>
        body {
            font-family: "Segoe UI", sans-serif;
            background-color: #f3e5f5;
            padding: 40px;
        }

        .container {
            background: #fff;
            padding: 30px;
            max-width: 600px;
            margin: auto;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(106, 27, 154, 0.3);
            text-align: center;
        }

        h2 {
            color: #6a1b9a;
        }

        .btn {
            display: block;
            margin: 20px auto;
            padding: 12px 25px;
            background-color: #8e24aa;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
            width: 80%;
        }

        .btn:hover {
            background-color: #6a1b9a;
        }

        .logout {
            background-color: #e53935;
        }

        .logout:hover {
            background-color: #c62828;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Welcome, <%= stationName %> ⚡</h2>

        <a class="btn" href="view_station_info.jsp"> View & Edit Station Info</a>
        <a class="btn" href="updatepower.jsp"> Update Power</a>
        <a class="btn logout" href="logout.jsp">Logout</a>
    </div>
</body>
</html>
