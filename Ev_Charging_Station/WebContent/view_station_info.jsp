<%@ page import="java.sql.*" %>
<%@ page import="databaseco.DbConnection" %>
<%
    String stationName = (String) session.getAttribute("station_name");
    if (stationName == null) {
        response.sendRedirect("station_login.jsp");
        return;
    }

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
%>

<html>
<head>
    <title>View Charging Station Info</title>
    <style>
        body {
            font-family: "Segoe UI", sans-serif;
            background-color: #f3e5f5;
            padding: 40px;
        }

        .container {
            max-width: 800px;
            margin: auto;
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(106, 27, 154, 0.3);
        }

        h2 {
            text-align: center;
            color: #6a1b9a;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        td {
            padding: 12px 15px;
            border: 1px solid #ccc;
        }

        td.label {
            font-weight: bold;
            background-color: #ede7f6;
            color: #4a148c;
            width: 30%;
        }

        .btn {
            display: inline-block;
            background-color: #8e24aa;
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
            text-decoration: none;
            margin-top: 25px;
        }

        .btn:hover {
            background-color: #6a1b9a;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Charging Station Information</h2>

<%
    try {
        con = DbConnection.connect();
        ps = con.prepareStatement("SELECT * FROM chargingstation WHERE station_name = ?");
        ps.setString(1, stationName);
        rs = ps.executeQuery();

        if (rs.next()) {
%>
    <table>
        <tr><td class="label">Station Name</td><td><%= rs.getString("station_name") %></td></tr>
        <tr><td class="label">Address</td><td><%= rs.getString("address") %></td></tr>
        <tr><td class="label">City</td><td><%= rs.getString("city") %></td></tr>
        <tr><td class="label">Taluka</td><td><%= rs.getString("taluka") %></td></tr>
        <tr><td class="label">District</td><td><%= rs.getString("district") %></td></tr>
        <tr><td class="label">Open Time</td><td><%= rs.getString("open_time") %></td></tr>
        <tr><td class="label">Close Time</td><td><%= rs.getString("close_time") %></td></tr>
        <tr><td class="label">Mobile</td><td><%= rs.getString("mobile") %></td></tr>
        <tr><td class="label">Latitude</td><td><%= rs.getString("latitude") %></td></tr>
        <tr><td class="label">Longitude</td><td><%= rs.getString("longitude") %></td></tr>
        <tr><td class="label">Power</td><td><%= rs.getString("power") %></td></tr>
        <tr><td class="label">Status</td><td><%= rs.getString("approve_status") %></td></tr>
    </table>

    <div style="text-align:center;">
        <a href="stationdashborad.jsp" class="btn"> Back to Dashboard</a>
    </div>
<%
        } else {
%>
    <p style="text-align: center; color: red;">No data found for station: <%= stationName %></p>
<%
        }
    } catch (Exception e) {
%>
    <p style="text-align: center; color: red;">Error: <%= e.getMessage() %></p>
<%
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>
</div>

</body>
</html>
