package model.me;

import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class updateBiz {
	public int updateBizToDB(String upMember, String upMentor, String upBiz, Connection conn){
		try{
			Statement sqlst = (Statement) conn.createStatement();
			
			int row = sqlst.executeUpdate(upMember);
			System.out.println("updateWorkerToDB upMember : "+upMember);
			System.out.println("updateWorkerToDB upMentor : "+upMentor);
			System.out.println("updateWorkerToDB upWorker : "+upBiz);
			row += sqlst.executeUpdate(upMentor);
			System.out.println("updateWorkerToDB upMentor : "+upMentor);
			
			row += sqlst.executeUpdate(upBiz);
			System.out.println("updateWorkerToDB upWorker : "+upBiz);
			System.out.println(row);
			//sqlst.close();
			return row;			//row = 1
		} catch(SQLException e){
			e.printStackTrace();
		}
		return 0;
	}
}
