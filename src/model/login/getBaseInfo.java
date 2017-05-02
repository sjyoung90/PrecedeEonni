package model.login;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Hashtable;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class getBaseInfo {
	public String[] getInfoForSession(int id, String role, Connection conn){
		System.out.println("getInfoForSession");
		//int checkIn = 0;
		Statement sqlst;
		String s[] = new String[3];	//s[0]은 team_id, s[1]은 way, s[2]는 f_id
		ResultSet rs;
		if(role.equals("동생")){
			//String menteeSt = "SELECT f_id From mentee_field WHERE mentee_st = "+id+";";
			String teamSt = "SELECT team_id FROM mentee_team WHERE mentee_st ="+id+";";
					//"SELECT f_id, team_id	FROM mentee_field f JOIN mentee_team t" +
					//"	WHERE t.mentee_st = f.mentee_st AND f.mentee_st = "+id+";";
			//System.out.println(menteeSt);
			System.out.println(teamSt);
			/*
			 * SELECT f_id, team_id	
FROM presede.mentee_field f JOIN presede.mentee_team t	
WHERE t.mentee_st = f.mentee_st AND f.mentee_st ='20091216';
			 * */
			try {
				sqlst = (Statement) conn.createStatement();
				//rs = sqlst.executeQuery(menteeSt);
				//s[2]=rs.getString("f_id");
				rs = sqlst.executeQuery(teamSt);
				if(rs.next()){
					s[0]=rs.getString("team_id");
				}else{
					
					System.out.println(role);
					s[0]= "";
				}
				//sqlst.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}else{	//언니
			String mentorSt = "SELECT way From mentor WHERE mentor_st = "+id+";";
			String teamSt = "SELECT team_id FROM mentee_team WHERE mentee_st ="+id+";";
/*SELECT team_id, way FROM presede.mentor m JOIN presede.team t
WHERE t.mentor_st = m.mentor_st AND m.mentor_st =20081111;*/
			System.out.println("get base info:언니");
			System.out.println(role);
			System.out.println(mentorSt);
			try {
				sqlst = (Statement) conn.createStatement();
				rs = sqlst.executeQuery(mentorSt);
				System.out.println("getBaseInfo : rs");
				if(rs.next()){
					System.out.println("getBaseInfo : rs.next");
					s[1]=rs.getString("way");
					//result.put("way", (String)rs.getString("way"));
					System.out.println("getBaseInfo : "+rs.getString("way"));
				}
				/*
				if(rs == null)	System.out.println("getBaseInfo : mentorSt문제");
				else{ 
					System.out.println("getBaseInfo : ");
					result.put("way", rs.getString("way"));
					System.out.println("getBaseInfo : "+rs.getString("way"));
				}*/
				rs = sqlst.executeQuery(teamSt);
				if(rs.next()){
					s[0]=rs.getString("team_id");
				}else{
					
					System.out.println(role);
					s[0]= "";
				}
				sqlst.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return s;
	}
}
