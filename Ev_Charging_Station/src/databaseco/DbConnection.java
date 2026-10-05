package databaseco;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {

	         static Connection con = null;
			 public static Connection connect()
			{
				try {

					Class.forName("com.mysql.jdbc.Driver");
					
					con=DriverManager.getConnection("jdbc:mysql://localhost:3306/evchargingstation","root","");
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return con;
			}
		
}
