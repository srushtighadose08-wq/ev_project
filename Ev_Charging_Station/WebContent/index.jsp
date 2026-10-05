<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EV Charging Portal</title>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
           background: url('https://www.chargepoint.com/sites/default/files/blog-photos/2022-04/DC-fast-charging-site-design.png') no-repeat center center fixed;
            background-size: cover;
        height: 100vh;
    }

    /* Header */
    .header {
        background-color: rgba(179, 157, 219, 0.95); /* light purple */
        color: white;
        padding: 20px;
        text-align: center;
        font-size: 28px;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        z-index: 10;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    }

    /* Sidebar */
    .sidebar {
        position: fixed;
        top: 70px;
        left: 0;
        width: 220px;
        height: calc(100% - 70px);
        background-color: rgba(206, 147, 216, 0.9); /* very light purple */
        padding-top: 30px;
        box-shadow: 2px 0 10px rgba(0, 0, 0, 0.2);
    }

    .sidebar a {
        display: block;
        color: #fff;
        padding: 15px 25px;
        text-decoration: none;
        font-size: 18px;
        transition: background 0.3s ease;
    }

    .sidebar a:hover {
        background-color: rgba(186, 104, 200, 0.9); /* slightly darker hover */
    }

    /* Main Content */
    .main {
        margin-left: 240px;
        margin-top: 100px;
        padding: 40px;
        color: white; /* soft dark purple for text */
    }

    .main h1 {
        font-size: 36px;
        margin-bottom: 20px;
    }

    .main p {
        font-size: 20px;
    }
</style>

</head>
<body>

<div class="header">
    EV Charging Station 
</div>

<div class="sidebar">
    <a href="adminlogin.jsp">Admin</a>
    <a href="loginuser.jsp">Charging Station</a>
    <a href="userlogin.jsp">User Login</a>
</div>

<div class="main">
    <h1>Welcome</h1>
</div>

</body>
</html>
