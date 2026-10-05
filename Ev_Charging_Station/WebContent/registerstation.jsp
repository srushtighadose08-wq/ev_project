<%@ page import="java.sql.*" %>
<%@ page import="databaseco.DbConnection"%>
<% 
    String msg = "";
    if(request.getParameter("submit") != null){
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String taluka = request.getParameter("taluka");
        String district = request.getParameter("district");
        String openTime = request.getParameter("open_time");
        String closeTime = request.getParameter("close_time");
        String mobile = request.getParameter("mobile");
        String lat = request.getParameter("latitude");
        String lon = request.getParameter("longitude");
        String password = request.getParameter("password");
        String power = request.getParameter("power");

        Connection con = DbConnection.connect();
        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO charging_station (name, address, city, taluka, district, open_time, close_time, mobile, latitude, longitude, password, power) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
        );
        ps.setString(1, name);
        ps.setString(2, address);
        ps.setString(3, city);
        ps.setString(4, taluka);
        ps.setString(5, district);
        ps.setString(6, openTime);
        ps.setString(7, closeTime);
        ps.setString(8, mobile);
        ps.setString(9, lat);
        ps.setString(10, lon);
        ps.setString(12, password);
        ps.setString(11, power); // using setString; you can also use setInt if power is numeric

        int i = ps.executeUpdate();
        msg = (i > 0) ? "Registered successfully!" : "Registration failed!";
    }
%>
<html>
<head>
    <title>Register Charging Station</title>
    <style>
        body {
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background: #f3e5f5;
            margin: 0;
            padding: 40px;
        }

        h2 {
            text-align: center;
            color: #6a1b9a;
            margin-bottom: 30px;
        }

        form {
            max-width: 500px;
            background: white;
            margin: auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(106, 27, 154, 0.2);
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 8px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: #8e24aa;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 6px;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #6a1b9a;
        }
    </style>
</head>
<body>

<h2>Register Charging Station</h2>
<form method="post">
    Name: <input type="text" name="name"><br>
    Address: <input type="text" name="address"><br>
    City: <input type="text" name="city"><br>
    Taluka: <input type="text" name="taluka"><br>
    District: <input type="text" name="district"><br>
    Open Time: <input type="text" name="open_time"><br>
    Close Time: <input type="text" name="close_time"><br>
    Mobile: <input type="text" name="mobile"><br>
    Latitude: <input type="text" name="latitude"><br>
    Longitude: <input type="text" name="longitude"><br>
    Password: <input type="password" name="password"><br>
    Power (kW): <input type="text" name="power"><br>
    <input type="submit" name="submit" value="Register">
</form>

</body>
</html>
