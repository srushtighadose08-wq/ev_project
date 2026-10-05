<%@ page import="java.sql.*" %>
<%@ page import="databaseco.DbConnection" %>
<%
    String msg = "";

    if (request.getParameter("delete") != null) {
        String stationName = request.getParameter("station_name");

        if (stationName != null && !stationName.trim().equals("")) {
            try {
                Connection con = DbConnection.connect();
                PreparedStatement ps = con.prepareStatement("DELETE FROM chargingstation WHERE station_name = ?");
                ps.setString(1, stationName.trim());
                int i = ps.executeUpdate();
                msg = (i > 0) ? "✅ Station '" + stationName + "' deleted successfully." : "❌ Station not found.";
                con.close();
            } catch (Exception e) {
                msg = "⚠️ Error: " + e.getMessage();
            }
        } else {
            msg = "⚠️ Please enter a valid station name.";
        }
    }
%>
<html>
<head>
    <title>Delete Charging Station</title>
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
        input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            font-size: 16px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }
        input[type="submit"] {
            background-color: #e53935;
            color: white;
            border: none;
        }
        input[type="submit"]:hover {
            background-color: #c62828;
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
        <h2 style="text-align:center; color:#6a1b9a;">Delete Charging Station</h2>
        <label>Enter Station Name to Delete:</label>
        <input type="text" name="station_name" placeholder="e.g. ABC EV Station" required>
        <input type="submit" name="delete" value="Delete Station">
        <div class="msg"><%= msg %></div>
    </form>
</body>
</html>
