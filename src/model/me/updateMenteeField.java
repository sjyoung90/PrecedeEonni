package model.me;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class updateMenteeField {
	public int updateMenteeFieldToDB(int id, String[] wayList, Connection conn){
		int r2=0;
		String insertSt = null;
		String deleteSt ="DELETE FROM mentee_field WHERE mentee_st="+id+";";
		try {
			Statement sqlst = (Statement) conn.createStatement();
			//ResultSet rs = sqlst.executeQuery("SELECT count(*) FROM mentee_field WHERE mentee_st="+id+";");
			//rs.getInt("count(*)");
			int r = sqlst.executeUpdate(deleteSt);
			System.out.println(deleteSt);
			System.out.println(r+"개 삭제 성공");
			
			for(int i = 0;i < wayList.length;i ++){
				insertSt = "INSERT INTO mentee_field(f_id, mentee_st) VALUES("+Integer.parseInt(wayList[i])+", "+id+");";
				System.out.println(insertSt);
				r2 += sqlst.executeUpdate(insertSt);
				
			}
			return r2;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

}
