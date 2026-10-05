<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="databaseco.DbConnection" %>

<%
    String stationName = request.getParameter("station_name");
    Connection con = null;
    PreparedStatement pstmt = null;

    try {
        con = DbConnection.connect();

        String sql = "UPDATE chargingstation SET approve_status = ? WHERE station_name = ?";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, "approved");
        pstmt.setString(2, stationName);

        int updated = pstmt.executeUpdate();

        if (updated > 0) {
%>
            <script>
                alert("Station '<%=stationName%>' approved successfully.");
                window.location.href = "viewstations.jsp"; // Replace with your actual page
            </script>
<%
        } else {
%>
            <script>
                alert("Approval failed or station not found.");
                window.history.back();
            </script>
<%
        }
    } catch(Exception e) {
        e.printStackTrace();
%>
        <script>
            alert("Error occurred: <%=e.getMessage()%>");
            window.history.back();
        </script>
<%
    } finally {
        try { if(pstmt != null) pstmt.close(); } catch(Exception e) {}
        try { if(con != null) con.close(); } catch(Exception e) {}
    }
%>
</body>
</html>