<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
Statement stmt=null;
ResultSet rs=null;
String result_st=null;

try{
	Class.forName("com.mysql.jdbc.Driver");
}catch(Exception e){
	System.out.println(e.getMessage());
	e.printStackTrace();
}


try{
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/presede","root","1224");
	stmt=conn.createStatement();
	

}catch(SQLException ex){
	System.out.println("SQLException : " + ex.getMessage());
	System.out.println("SQLState : " + ex.getSQLState());
	System.out.println("VendorError : " + ex.getErrorCode());
}

%>