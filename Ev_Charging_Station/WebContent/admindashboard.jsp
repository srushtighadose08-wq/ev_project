<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Dashboard</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
        }

        .header {
            background-color: #2c3e50;
            color: white;
            padding: 20px;
            text-align: center;
            font-size: 24px;
        }

        .sidebar {
            position: fixed;
            top: 70px;
            left: 0;
            width: 220px;
            height: 100%;
            background-color: #34495e;
            padding-top: 30px;
        }

        .sidebar a {
            display: block;
            color: white;
            padding: 15px 25px;
            text-decoration: none;
            font-size: 18px;
            transition: background 0.3s;
        }

        .sidebar a:hover {
            background-color: #2980b9;
        }

        .main {
            margin-left: 240px;
            padding: 40px;
        }

        .main h2 {
            font-size: 28px;
            margin-bottom: 20px;
        }

        .main p {
            font-size: 16px;
            line-height: 1.5;
        }
    </style>
</head>
<body>

<div class="header">
    Admin  - EV Charging Station
</div>

<div class="sidebar">
    <a href="viewchargingstations.jsp">View Charging Stations</a>
    <a href="manuallyapprove.jsp">Approve Charging Stations</a>
    <a href="delete.jsp">Delete Charging Stations</a>
</div>

<div class="main">
    <h2>Welcome, Admin!</h2>

</div>

</body>
</html>