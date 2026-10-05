<%@ page import="java.sql.*" %>
<%@ page import="databaseco.DbConnection" %>
<%
    String searchType = request.getParameter("type");
    String value = request.getParameter("value");
%>
<html>
<head>
    <title>Search Charging Stations</title>
    <style>
        body {
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f3e5f5;
            padding: 40px;
        }

        h2 {
            text-align: center;
            color: #6a1b9a;
        }

        .form-container {
            max-width: 900px;
            margin: auto;
            margin-bottom: 40px;
            background-color: #fff;
            padding: 20px 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(106, 27, 154, 0.2);
        }

        form {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
        }

        .input-group {
            flex: 1;
            min-width: 200px;
        }

        input[type="text"], select {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        input[type="submit"], .register-btn {
            background-color: #8e24aa;
            color: white;
            border: none;
            padding: 10px 25px;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            text-decoration: none;
        }

        input[type="submit"]:hover, .register-btn:hover {
            background-color: #6a1b9a;
        }

        .btn-container {
            display: flex;
            justify-content: flex-end;
            gap: 20px;
            margin-top: 20px;
        }

        .btn {
            padding: 6px 12px;
            border-radius: 5px;
            color: white;
            text-decoration: none;
            font-size: 14px;
        }

        .approve { background-color: #4caf50; }
        .disapprove { background-color: #f57c00; }
        .delete { background-color: #e53935; }

        table {
            width: 95%;
            margin: 30px auto;
            border-collapse: collapse;
            background-color: white;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: center;
        }

        th {
            background-color: #d1c4e9;
            color: #4a148c;
        }

        .section-title {
            text-align: center;
            margin-top: 50px;
            color: #4a148c;
        }
    </style>
</head>
<body>

<div style="text-align: left; margin-bottom: 20px;">
    <a href="charging_station.jsp" style="background-color: #8e24aa; color: white; padding: 10px 20px; text-decoration: none; border-radius: 6px;"> Back</a>
</div>

<h2>Search Charging Stations</h2>

<div class="form-container">
    <form method="get">
        <div class="input-group">
            <select name="type">
                <option value="city" <%= "city".equals(searchType) ? "selected" : "" %>>City</option>
                <option value="taluka" <%= "taluka".equals(searchType) ? "selected" : "" %>>Taluka</option>
                <option value="district" <%= "district".equals(searchType) ? "selected" : "" %>>District</option>
            </select>
        </div>

        <div class="input-group">
            <input type="text" name="value" placeholder="Enter search value" value="<%= value != null ? value : "" %>">
        </div>

        <div class="btn-container">
            <input type="submit" value="Search">
            <a href="registerstation.jsp" class="register-btn">Register New Station</a>
        </div>
    </form>
</div>

<%
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        con = DbConnection.connect();

        // ✅ Simplified & safe if condition
        if (searchType != null) {
            if (value != null) {
                value = value.trim();
                if (!value.equals("")) {
                    if (searchType.equals("city") || searchType.equals("taluka") || searchType.equals("district")) {
                        String sql = "SELECT * FROM chargingstation WHERE " + searchType + " LIKE ?";
                        ps = con.prepareStatement(sql);
                        ps.setString(1, "%" + value + "%");
                        rs = ps.executeQuery();

                        boolean hasResults = false;
%>
<h3 class="section-title">Search Results</h3>
<table>
    <tr>
        <th>Station Name</th><th>Address</th><th>City</th><th>Taluka</th><th>District</th>
        <th>Open Time</th><th>Close Time</th><th>Mobile</th><th>Latitude</th><th>Longitude</th>
        <th>Power</th><th>Password</th><th>Status</th>
        <th>Approve</th><th>Disapprove</th><th>Delete</th>
    </tr>
<%
                        while (rs.next()) {
                            hasResults = true;
%>
    <tr>
        <td><%= rs.getString(1) %></td><td><%= rs.getString(2) %></td><td><%= rs.getString(3) %></td>
        <td><%= rs.getString(4) %></td><td><%= rs.getString(5) %></td><td><%= rs.getString(6) %></td>
        <td><%= rs.getString(7) %></td><td><%= rs.getString(8) %></td><td><%= rs.getString(9) %></td>
        <td><%= rs.getString(10) %></td><td><%= rs.getString(11) %></td><td><%= rs.getString(12) %></td>
        <td><%= rs.getString(13) %></td>
        <td><a href="approve_station.jsp?station_name=<%=rs.getString(1)%>" class="btn approve">Approve</a></td>
        <td><a href="disapprove_station.jsp?station_name=<%=rs.getString(1)%>" class="btn disapprove">Disapprove</a></td>
        <td><a href="delete.jsp?station_name=<%=rs.getString(1)%>" class="btn delete">Delete</a></td>
    </tr>
<%
                        }

                        if (!hasResults) {
%>
    <tr><td colspan="16" style="text-align:center; color:red;">No matching results found.</td></tr>
<%
                        }
%>
</table>
<%
                        rs.close();
                        ps.close();
                    } else {
                        out.println("<p style='color:red; text-align:center;'>Invalid search type selected.</p>");
                    }
                }
            }
        }

        // ✅ Show all charging stations
        ps = con.prepareStatement("SELECT * FROM chargingstation");
        rs = ps.executeQuery();
%>
<h3 class="section-title">All Charging Stations</h3>
<table>
    <tr>
        <th>Station Name</th><th>Address</th><th>City</th><th>Taluka</th><th>District</th>
        <th>Open Time</th><th>Close Time</th><th>Mobile</th><th>Latitude</th><th>Longitude</th>
        <th>Power</th><th>Password</th><th>Status</th>
        <th>Approve</th><th>Disapprove</th><th>Delete</th>
    </tr>
<%
        while (rs.next()) {
%>
    <tr>
        <td><%= rs.getString(1) %></td><td><%= rs.getString(2) %></td><td><%= rs.getString(3) %></td>
        <td><%= rs.getString(4) %></td><td><%= rs.getString(5) %></td><td><%= rs.getString(6) %></td>
        <td><%= rs.getString(7) %></td><td><%= rs.getString(8) %></td><td><%= rs.getString(9) %></td>
        <td><%= rs.getString(10) %></td><td><%= rs.getString(11) %></td><td><%= rs.getString(12) %></td>
        <td><%= rs.getString(13) %></td>
        <td><a href="approve_station.jsp?station_name=<%=rs.getString(1)%>" class="btn approve">Approve</a></td>
        <td><a href="disapprove_station.jsp?station_name=<%=rs.getString(1)%>" class="btn disapprove">Disapprove</a></td>
        <td><a href="delete.jsp?station_name=<%=rs.getString(1)%>" class="btn delete">Delete</a></td>
    </tr>
<%
        }
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (ps != null) ps.close(); } catch (Exception e) {}
        try { if (con != null) con.close(); } catch (Exception e) {}
    }
%>
</table>

</body>
</html>
