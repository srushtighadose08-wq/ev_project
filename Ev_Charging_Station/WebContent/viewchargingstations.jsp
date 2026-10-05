<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="databaseco.DbConnection" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Charging Station Dashboard</title>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">

<style>
    body {
        font-family: 'Inter', sans-serif;
        background: #f5f3ff;
        margin: 0;
        padding: 20px;
    }

    h2 {
        text-align: center;
        color: #6a1b9a;
        margin-bottom: 30px;
        font-size: 32px;
    }

    .container {
        width: 95%;
        max-width: 1200px;
        margin: auto;
        background-color: #fff;
        padding: 25px;
        border-radius: 12px;
        box-shadow: 0 8px 16px rgba(106, 27, 154, 0.15);
        overflow-x: auto;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        font-size: 15px;
    }

    th, td {
        padding: 12px 16px;
        text-align: center;
        border-bottom: 1px solid #e0d7ec;
    }

    th {
        background-color: #b39ddb;
        color: #ffffff;
        font-weight: 600;
    }

    tr:hover {
        background-color: #f3e5f5;
    }

    a.btn {
        padding: 6px 12px;
        border-radius: 6px;
        font-weight: 500;
        color: #fff;
        text-decoration: none;
        font-size: 13px;
        transition: background-color 0.3s;
    }

    .approve {
        background-color: #4caf50;
    }

    .approve:hover {
        background-color: #388e3c;
    }

    .disapprove {
        background-color: #f57c00;
    }

    .disapprove:hover {
        background-color: #e65100;
    }

    .delete {
        background-color: #e53935;
    }

    .delete:hover {
        background-color: #b71c1c;
    }

    @media (max-width: 768px) {
        table {
            font-size: 13px;
        }

        th, td {
            padding: 8px 10px;
        }
    }
</style>
</head>
<body>

<h2>Charging Station Dashboard</h2>

<div class="container">
<%
	Connection con = DbConnection.connect();
	try {
		PreparedStatement pstmt = con.prepareStatement("select * from chargingstation ");
		ResultSet rs = pstmt.executeQuery();
%>

<table>
  <tr>
    <th>Station Name</th>
    <th>Address</th>
    <th>City</th>
    <th>Taluka</th>
    <th>District</th>
    <th>Open Time</th>
    <th>Close Time</th>
    <th>Mobile</th>
    <th>Latitude</th>
    <th>Longitude</th>
    <th>Power</th>
    <th>Password</th>
    <th>Status</th>
    <th>Approve</th>
    <th>Disapprove</th>
    <th>Delete</th>
  </tr>
  
<% while(rs.next()) { %>
<tr>
    <td><%=rs.getString(1) %></td>
    <td><%=rs.getString(2) %></td>
    <td><%=rs.getString(3) %></td>
    <td><%=rs.getString(4) %></td>
    <td><%=rs.getString(5) %></td>
    <td><%=rs.getString(6) %></td>
    <td><%=rs.getString(7) %></td>
    <td><%=rs.getString(8) %></td>
    <td><%=rs.getString(9) %></td>
    <td><%=rs.getString(10) %></td>
    <td><%=rs.getString(11) %></td>
    <td><%=rs.getString(12) %></td>
    <td><%=rs.getString(13) %></td>
    <td><a href="approve_station.jsp?station_name=<%=rs.getString(1)%>" class="btn approve">Approve</a></td>
    <td><a href="disapprove_station.jsp?station_name=<%=rs.getString(1)%>" class="btn disapprove">Disapprove</a></td>
    <td><a href="deletedirect.jsp?station_name=<%=rs.getString(1)%>" class="btn delete">Delete</a></td>
</tr>	
<% }
} catch(Exception e) {
    e.printStackTrace();	
}
%>
</table>
</div>

</body>
</html>
