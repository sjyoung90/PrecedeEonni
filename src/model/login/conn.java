package model.login;

import java.sql.DriverManager;
import java.sql.SQLException;


import com.mysql.jdbc.Connection;

public class conn {
	public Connection getConn(){
    	Connection conn = null;
	
		try {
			conn=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/presede","root","1224");
			if (conn != null) return conn;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("connection fail");
			e.printStackTrace();
		}
		return null;

	}
}
