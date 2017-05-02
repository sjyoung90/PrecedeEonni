package model.join;

import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class insMenteeField {
	protected int insertMenteeField(int id, String[] wayList, Connection isMfConn){	
		String inFieldSt = null;
		Statement sqlst;
		int checkIn = 0; 
		
		try {
			sqlst = (Statement) isMfConn.createStatement();
			for(int i = 0;i < wayList.length;i ++){
				inFieldSt = "INSERT mentee_field(f_id, mentee_st) VALUES("+Integer.parseInt(wayList[i])+","+id+");";
				//System.out.println(inFieldSt);
				checkIn += sqlst.executeUpdate(inFieldSt);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return	checkIn;
	}

}
