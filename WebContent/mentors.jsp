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
<title>언니 보기</title>
    <link rel="stylesheet" type="text/css" href="css/mentors_style.css" />
    
</head>
<body>

<%
	//Class.forName("com.mysql.jdbc.Driver");
	//ServletContext sc = getServletContext();
	//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor","root","401");

	String sqlst = "SELECT member.stNumber, member.name, member.photo, mentor.way FROM member, mentor WHERE member.stNumber = mentor.mentor_st";
	
	//ResultSet rs = null;
	//Statement st = null;
	String photo, stNum, way, name;
	ArrayList<String> mentor_photo = new ArrayList<String>();
	ArrayList<String> mentor_num = new ArrayList<String>();
	ArrayList<String> mentor_way = new ArrayList<String>();
	ArrayList<String> mentor_name = new ArrayList<String>();
	String imgPath="/PresedeEonni/uploaded_image/";
	try {
		//stmt = conn.createStatement();
		rs = stmt.executeQuery(sqlst);
		
		//ArrayList<String> total_list = new ArrayList<String>();
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
	
	String sql_favorite = "SELECT distinct mentor.mentor_st FROM mentor, favorite WHERE mentor.mentor_st = favorite.mentor_st";
	
	ResultSet rs2 = null;
	//Statement st2 = null;
	String stNum2;
	ArrayList<String> favorite_mentor = new ArrayList<String>();
	
	try{
		//st2 = con.createStatement();
		rs2 = stmt.executeQuery(sql_favorite);
		
		while(rs2.next()){
			stNum2 = (String)rs2.getString("mentor.mentor_st");
			favorite_mentor.add(stNum2);
		}
		rs2.close();
	}
	catch (SQLException e2) {
		// TODO Auto-generated catch block
		System.out.println("fail");
		e2.printStackTrace();
	}
	%>

	<div class="slide">
		<%for(int i=0;i<mentor_num.size();i++){ 
		%>
		<div class="main_epilogue">
			<%
				if(favorite_mentor.contains(mentor_num.get(i)))
				{%>
				<img src="image/yellow_star.png">
				<%
				} else {
					%>
					<a href="favorite_mentor.jsp?num=<%=mentor_num.get(i)%>">
					<img src="image/white_star.png" alt="등록" onclick="return confirm('관심멘토로 등록하시겠습니까?'); ">
					</a>
					
				<%
				
				}		
			%>
			<%-- if  --%>
			<img src="<%=imgPath %><%=mentor_photo.get(i) %>" class="imgSource"><br>
			<%=mentor_num.get(i) %> <br>
			<%=mentor_name.get(i) %> <br>
			<%=mentor_way.get(i) %> <br>
		</div>
		<%
		}%>
		</div>
	
</body>
</html>