package model.mentor;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class mentorLook{
	
	public int showMentor (){
		
		String sqlst = "SELECT member.stNumber, member.name, member.photo, mentor.way FROM member, mentor WHERE member.stNumber = mentor.mentor_st";
		
		String photo, stNum, way, name;
		ArrayList<String> mentor_photo = new ArrayList<String>();
		ArrayList<String> mentor_num = new ArrayList<String>();
		ArrayList<String> mentor_way = new ArrayList<String>();
		ArrayList<String> mentor_name = new ArrayList<String>();
		String imgPath="/PresedeEonni/uploaded_image/";
		try {
			rs = stmt.executeQuery(sqlst);
			
			while(rs.next()) { // existing user
				stNum = (String)rs.getString("member.stNumber");
				mentor_num.add(stNum);
				name = (String)rs.getString("member.name");
				mentor_name.add(name);
				photo = (String)rs.getString("member.photo");
				mentor_photo.add(photo);
				way = rs.getString("mentor.way");
				mentor_way.add(way);
				
			}
			rs.close();
		}
		catch (SQLException e1) {
			// TODO Auto-generated catch block
			System.out.println("fail");
			e1.printStackTrace();
		}
		}
		
	}

}
