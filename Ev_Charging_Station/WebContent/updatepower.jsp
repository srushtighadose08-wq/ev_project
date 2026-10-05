<%@ page import="java.sql.*" %>
<%@ page import="databaseco.DbConnection" %>
<%
    String msg = "";

    if(request.getParameter("update") != null){
        String stationName = request.getParameter("station_name");
        String powerStr = request.getParameter("power");

        if (stationName != null && powerStr != null && !stationName.trim().equals("") && !powerStr.trim().equals("")) {
            try {
                int power = Integer.parseInt(powerStr.trim());
                stationName = stationName.trim();

                Connection con = DbConnection.connect();
                PreparedStatement ps = con.prepareStatement("UPDATE chargingstation SET power=? WHERE station_name=?");
                ps.setInt(1, power);
                ps.setString(2, stationName);
                int i = ps.executeUpdate();
                msg = (i > 0) ? "✅ Power updated successfully for " + stationName : "❌ No such station found.";
                con.close();
            } catch (Exception e) {
                msg = "⚠️ Error: " + e.getMessage();
            }
        } else {
            msg = "⚠️ Please enter both Station Name and Power value.";
        }
    }
%>
<html>
<head>
    <title>Update Station Power</title>
    <style>
        body {
            font-family: "Segoe UI", sans-serif;
            background-color: #f3e5f5;
            padding: 30px;
        }
        form {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            max-width: 400px;
            margin: auto;
            box-shadow: 0 0 10px rgba(106, 27, 154, 0.2);
        }
        input[type="text"], input[type="number"], input[type="submit"] {
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
        }
        input[type="submit"]:hover {
            background-color: #6a1b9a;
        }
        .msg {
            text-align: center;
            color: #4a148c;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <form method="post">
        <h2 style="text-align:center; color:#6a1b9a;">Update Power Remaining</h2>
        <label>Station Name:</label>
        <input type="text" name="station_name" placeholder="Enter station name" required>

        <label>New Power Value:</label>
        <input type="number" name="power" placeholder="Enter new power value" required>

        <input type="submit" name="update" value="Update Power">
        <div class="msg"><%= msg %></div>
    </form>
</body>
</html>
