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
    
</head>
<body>

<%
//HttpSession session = request.getSession();

	//Class.forName("com.mysql.jdbc.Driver");
	//ServletContext sc = getServletContext();
	//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/presede","root","1224");

	String mentor_num = request.getParameter("num");
	System.out.println(mentor_num);
	
	//String query1 = "SELECT stNumber FROM member WHERE role='동생'";
	
	//ResultSet rs = null;
	//Statement st = null;
	//Statement st2 = null;
	int id = Integer.parseInt((String)session.getAttribute("currentID"));
		try{
			//stmt = conn.createStatement();
			//st2 = conn.createStatement();
			//rs = stmt.executeQuery(query1);
			
			//while(rs.next()){
				
				//String mentee = (String)rs.getString(1);
				//int realStNum = Integer.parseInt(mentee);
				
				String input_query = "INSERT INTO favorite (mentee_st, mentor_st) VALUES(" + id + "," + mentor_num + ");";
				int i = stmt.executeUpdate(input_query);
			if(i == 1){
				System.out.println("favorite_mentor 삽입 성공");
			}else System.out.println("favorite_mentor 삽입 실패");
			
			
			//rs.close();
		}catch (SQLException e3) {
			// TODO Auto-generated catch block
			System.out.println("fail");
			e3.printStackTrace();
		}
		
		out.println("<SCRIPT>location.href='mentors.jsp';</SCRIPT>");


%>
</body>
</html>