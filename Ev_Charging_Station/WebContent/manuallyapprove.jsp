<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="databaseco.DbConnection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Manual Approve Charging Station</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3e5f5;
            padding: 50px;
        }

        .form-container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(106, 27, 154, 0.2);
            max-width: 400px;
            margin: auto;
        }

        h2 {
            text-align: center;
            color: #6a1b9a;
        }

        input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: #8e24aa;
            color: white;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #6a1b9a;
        }

        .message {
            text-align: center;
            margin-top: 20px;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Approve Charging Station</h2>

    <form method="post">
        <label for="station_name">Enter Station Name:</label>
        <input type="text" name="station_name" id="station_name" required>
        <input type="submit" value="Approve">
    </form>

<%
    if ("post".equalsIgnoreCase(request.getMethod())) {
        String stationName = request.getParameter("station_name");
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DbConnection.connect();
            String sql = "UPDATE chargingstation SET approve_status = ? WHERE station_name = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "approved");
            pstmt.setString(2, stationName);

            int rows = pstmt.executeUpdate();
            if (rows > 0) {
%>
                <div class="message" style="color: green;">Station "<%=stationName%>" approved successfully.</div>
<%
            } else {
%>
                <div class="message" style="color: red;">Station "<%=stationName%>" not found or already approved.</div>
<%
            }
        } catch (Exception e) {
            e.printStackTrace();
%>
            <div class="message" style="color: red;">Error: <%=e.getMessage()%></div>
<%
        } finally {
            try { if (pstmt != null) pstmt.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }
    }
%>
</div>

</body>
</html>
