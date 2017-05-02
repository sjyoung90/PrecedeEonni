package model.join;

import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class insWorker {
	public int insertWorkerToDB(int id, String pw, String name, String r, int college, int major, 
			String photo, int phone, String intro, int w, 
			String ol, String company, String dept, String position, Connection joinConn){

		String 	role = null;
		String	way = null;
		boolean	offLine = false;
		if(r.equals("mentor"))	role="언니";
		else	System.out.println("insWorker - 언니가 아님");
		if(w == 1)	way="취업";	
		else System.out.println("insWorker - 취업이 아님");
		if(ol.equals("yes"))	offLine = true;
		String inMemSt = "INSERT INTO member(stNumber, password, name, role, photo, phone, college, major, intro)" +
				"VALUES ("+id+", '"+pw+"', '"+name+"', '"+role+"', '"+photo+"', "+phone+", '"+college+"', '"+major+"', '"+intro+"');";
		
		String commitSt = "commit;";
		
		int checkIn = 0;	//member 테이블에 잘 삽입되었는지
		int checkIn2 = 0;	//worker 테이블, mentor테이블에 잘 삽입되었는지:2이어야 함
		
		try{
			Statement sqlst = (Statement) joinConn.createStatement();
			checkIn = sqlst.executeUpdate(inMemSt);

			if(checkIn == 1){	//정상 삽입
				System.out.println("멤버 테이블 정상삽입");
				String inMentorSt = "UPDATE	mentor	SET	way = '"+way+"', offLine="+offLine+"	WHERE mentor_st ="+id+";";
				//String inWorkerSt = "UPDATE	worker	SET	company = '"+company+"', dept = '"+dept+"', position = '"+position+"'	WHERE worker_st ="+id+";";
				String	inWorkerSt ="INSERT INTO worker(worker_st, company, dept, position)" +
				"VALUES ("+id+", '"+company+"', '"+dept+"', '"+position+"');";
		
				System.out.println(inMentorSt);
				System.out.println(inWorkerSt);
				checkIn2 += sqlst.executeUpdate(inMentorSt);
				checkIn2 += sqlst.executeUpdate(inWorkerSt);
				
				if(checkIn2 == 2){
					System.out.println("멘토테이블/worker테이블 정상삽입");
					sqlst.execute(commitSt);
				}
			}
			//sqlst.close();		
		} catch(SQLException e){
			e.printStackTrace();
		}
		return checkIn + checkIn2;	//3이어야 정상삽입
	}

}
