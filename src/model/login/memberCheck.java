package model.login;

import java.sql.*;
//import com.mysql.jdbc.*;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class memberCheck {	//학번받아서 DB에 받아온 학번에 대한 정보 가져오기
	public ResultSet checkUser(int id, Connection loginConn){
		String st = "SELECT password, role FROM member WHERE stNumber ="+id+";";
		
		System.out.println(st);
		try{
			Statement sqlst = (Statement) loginConn.createStatement();
			ResultSet result = sqlst.executeQuery(st);
		
			//sqlst.close();
			return result;			
		} catch(SQLException e){
			e.printStackTrace();
		}
		
		return	null;
	}
}

