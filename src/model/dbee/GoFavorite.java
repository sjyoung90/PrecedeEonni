package model.dbee;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpSession;

public class GoFavorite {
	
	public void saveFavorite(int id, Connection con,String stu_picture){
	 Statement stmt=null;
	 ResultSet rs=null;
	 String result_st=null;
	 String result; 
	 String st0 = "SELECT stNumber From member  WHERE photo="; 
	 //String st1 = "INSERT INTO favorite (mentor_st) VALUES('"++"')";
	
	 
	 try{
	 Class.forName("com.mysql.jdbc.Driver");
	 }catch(Exception e){
	 System.out.println(e.getMessage());
	 e.printStackTrace();
	 }
	 

		 try{
			 stmt=con.createStatement();
			 rs=stmt.executeQuery(st0+"'"+ stu_picture+ "'");
			 
			 while(rs.next()){
				 String stu_number = rs.getString(1);
				
				 int realStNum=Integer.parseInt(stu_number);
				 String st1 = "INSERT INTO favorite (mentor_st, mentee_st) VALUES("+realStNum+","+id+");";
				 System.out.println(stu_number);
				 int i = stmt.executeUpdate(st1);
			 }
			 	//rs.close();
			 	//stmt.close(); 
			
		 }catch(SQLException ex){
		 System.out.println("SQLException : " + ex.getMessage());
		 System.out.println("SQLState : " + ex.getSQLState());
		 System.out.println("VendorError : " + ex.getErrorCode());
		 }
		 
	

}
	}
