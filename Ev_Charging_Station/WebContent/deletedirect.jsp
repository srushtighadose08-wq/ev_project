<%@ page import="java.sql.*" %>
<%@ page import="databaseco.DbConnection" %>
<%
    String stationName = request.getParameter("station_name");
    String msg = "";

    if (stationName != null && !stationName.trim().equals("")) {
        try {
            Connection con = DbConnection.connect();
            PreparedStatement ps = con.prepareStatement("DELETE FROM chargingstation WHERE station_name = ?");
            ps.setString(1, stationName.trim());
            int i = ps.executeUpdate();
            con.close();

            if (i > 0) {
                msg = "Station '" + stationName + "' deleted successfully.";
            } else {
                msg = "Station '" + stationName + "' not found.";
            }
        } catch (Exception e) {
            msg = "Error: " + e.getMessage();
        }
    } else {
        msg = "Invalid station name.";
    }

    // Redirect back to main page with message (optional)
    response.sendRedirect("charging_station.jsp?message=" + java.net.URLEncoder.encode(msg, "UTF-8"));
%>
