package model.me;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class updateMentee {	//동생 정보 얻어오기
	public	int	updateMenteeToDB(String st, Connection conn){
		//String	selectMem = "SELECT * FROM member WHERE stNumber='"+id+"';";
		
		try{
			Statement sqlst = (Statement) conn.createStatement();
			System.out.println("updateMenteeToDB : "+st);
			int row = sqlst.executeUpdate(st);
			System.out.println(row);
			//sqlst.close();
			return row;			//row = 1
		} catch(SQLException e){
			e.printStackTrace();
		}
		return 0;
	}

}
