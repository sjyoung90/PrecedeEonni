package model.join;

import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class insBiz {	//way == 2
	public int insertBizToDB(int id, String pw, String name, String r, int college, int major, 
			String photo, int phone, String intro, int w, 
			String ol, String company, String kind, String position, Connection joinConn){

		String 	role = null;
		String	way = null;
		boolean	offLine = false;
		if(r.equals("mentor"))	role="언니";
		else	System.out.println("insBiz - 언니가 아님");
		if(w == 2)	way="창업";	
		else System.out.println("insBiz - 창업이 아님");
		if(ol.equals("yes"))	offLine = true;
		String inMemSt = "INSERT INTO member(stNumber, password, name, role, photo, phone, college, major, intro)" +
				"VALUES ("+id+", '"+pw+"', '"+name+"', '"+role+"', '"+photo+"', "+phone+", '"+college+"', '"+major+"', '"+intro+"');";
		
		String commitSt = "commit;";
		
		int checkIn = 0;	//member 테이블에 잘 삽입되었는지
		int checkIn2 = 0;	//mentor테이블, business에 잘 삽입되었는지:2이어야 함
		
		try{
			Statement sqlst = (Statement) joinConn.createStatement();
			checkIn = sqlst.executeUpdate(inMemSt);

			if(checkIn == 1){	//정상 삽입
				System.out.println("멤버 테이블 정상삽입");
				String inMentorSt = "UPDATE	mentor	SET	way = '"+way+"', offLine="+offLine+"	WHERE mentor_st ="+id+";";
				String inBizSt = "INSERT INTO business(biz_st, company, kind, position)" +
				"VALUES ("+id+", '"+company+"', '"+kind+"', '"+position+"');";
				System.out.println(inMentorSt);
				System.out.println(inBizSt);
				checkIn2 += sqlst.executeUpdate(inMentorSt);
				checkIn2 += sqlst.executeUpdate(inBizSt);
				
				if(checkIn2 == 2){
					System.out.println("멘토테이블/business테이블 정상삽입");
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
