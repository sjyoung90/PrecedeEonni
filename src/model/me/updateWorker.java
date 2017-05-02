package model.me;

import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class updateWorker {
	public int updateWorkerToDB(String upMember, String upMentor, String upWorker, Connection conn){
		try{
			Statement sqlst = (Statement) conn.createStatement();
			
			int row = sqlst.executeUpdate(upMember);
			System.out.println("updateWorkerToDB upMember : "+upMember);
			System.out.println("updateWorkerToDB upMentor : "+upMentor);
			System.out.println("updateWorkerToDB upWorker : "+upWorker);
			row += sqlst.executeUpdate(upMentor);
			System.out.println("updateWorkerToDB upMentor : "+upMentor);
			
			row += sqlst.executeUpdate(upWorker);
			System.out.println("updateWorkerToDB upWorker : "+upWorker);
			System.out.println(row);
			//sqlst.close();
			return row;			//row = 1
		} catch(SQLException e){
			e.printStackTrace();
		}
		return 0;
	}
}
