<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ include file="sql_connection.jsp"%>
<%
	String writing_id = request.getParameter("writing_id");
	int real_id = Integer.parseInt(writing_id);
	String author=null;
	String content=null;
	//int real_id = Integer.parseInt(writing_id);
	String query_statement = "select * from team_writing where writing_id="+real_id+"";
	rs=stmt.executeQuery(query_statement);
	if(rs.next()){
		author=rs.getString("stNumber");
		content=rs.getString("w_content");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table class="our_room_popup_table">
                <tr>
                	<td class="author"><%=author %></td>
                </tr>
                <tr>
                    <td class="content"><%=content %></td>
                </tr>
    </table>
</body>
</html>