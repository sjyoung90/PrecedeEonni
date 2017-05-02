<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.ArrayList" %>

                <%@ include file="sql_connection.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>동생 보기</title>
    <link rel="stylesheet" type="text/css" href="css/mentees_style.css" />
    
</head>
<body>

<%
	//Class.forName("com.mysql.jdbc.Driver");
	//ServletContext sc = getServletContext();
	//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/presede","root","1224");

	String sqlst = "SELECT member.stNumber, member.name, member.photo, mentee.grade FROM member, mentee WHERE member.stNumber = mentee.mentee_st";
	
	//ResultSet rs = null;
	//Statement st = null;
	String photo, stNum, name, grade;
	ArrayList<String> mentee_photo = new ArrayList<String>();
	ArrayList<String> mentee_num = new ArrayList<String>();
	ArrayList<String> mentee_name = new ArrayList<String>();
	ArrayList<String> mentee_grade = new ArrayList<String>();
	String imgPath="/PresedeEonni/uploaded_image/";
	try {
		//stmt = conn.createStatement();
		rs = stmt.executeQuery(sqlst);
		
		//ArrayList<String> total_list = new ArrayList<String>();
		while(rs.next()) { // existing user
			stNum = (String)rs.getString("member.stNumber");
			mentee_num.add(stNum);
			name = (String)rs.getString("member.name");
			mentee_name.add(name);
			photo = (String)rs.getString("member.photo");
			mentee_photo.add(photo);
			//grade = rs.getString("mentee.grade");
			//mentee_grade.add(grade);
			
		}
	}
	catch (SQLException e1) {
		// TODO Auto-generated catch block
		System.out.println("fail");
		e1.printStackTrace();
	}
	
%>
	<%for(int i=0;i<mentee_num.size();i++){ 
		%>
	<div class="main_epilogue">

		<div class="slide">
			<img src="<%=imgPath %><%=mentee_photo.get(i) %>" class="imgSource"><br>
			<%=mentee_num.get(i) %> <br>
			<%=mentee_name.get(i) %> <br>
			<!--  <%--=mentee_grade.get(i) --%> 학년<br>-->
		</div>
	</div>

	<%
	}
		%>
</body>
</html>