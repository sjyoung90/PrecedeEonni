package model.join;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class insMentee {
	public int	insertMemberToDB(int id, String pw, String name, String r, int college, 
			int major, String	photo, int phone, String intro, String[] wayList, Connection insMemConn){
		String role = null;
		if(r.equals("mentee"))	role="동생";
		else	System.out.println("동생이 아님");
		String inMemSt = "INSERT INTO member(stNumber, password, name, role, photo, phone, college, major, intro)" +
				"VALUES ("+id+", '"+pw+"', '"+name+"', '"+role+"', '"+photo+"', "+phone+", '"+college+"', '"+major+"', '"+intro+"');";
		System.out.println("insertMentee : "+inMemSt);
		//String	inFieldSt;
		String commitSt = "commit;";
		
		int checkIn = 0;	//member 테이블에 잘 삽입되었는지
		int checkIn2 = 0;	//mentee_field 테이블에 잘 삽입되었는지
		//int checkIn3 = 0;	//각 mentor 테이블에 잘 삽입되었는지
		
		try{
			Statement sqlst = (Statement) insMemConn.createStatement();
			checkIn = sqlst.executeUpdate(inMemSt);

			/* insMEnteeField로 대체
			for(int i = 0;i < wayList.length;i ++){
				inFieldSt = "INSERT mentee_field(f_id, stNumber) VALUES("+Integer.parseInt(wayList[i])+","+id+");";
				//System.out.println(inFieldSt);
				checkIn2 = sqlst.executeUpdate(inFieldSt);
			}
			*/
			if(checkIn == 1){	//정상 삽입
				insMenteeField inMF = new insMenteeField();
				checkIn2 = inMF.insertMenteeField(id, wayList, insMemConn);	//checkIn2 == wayList.length
				if(checkIn2 == wayList.length){
					sqlst.execute(commitSt);
					checkIn ++;
				}
			}
			//sqlst.close();
			return checkIn;			
		} catch(SQLException e){
			e.printStackTrace();
		}
		return 0;
	}
}
