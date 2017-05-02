<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ include file="sql_connection.jsp"%>
<%
	String filePath = "/uploaded_image/";
	String fileName = null;
	String content = null;
	String checkbox_data = null;
	int maxSize = 1024 * 1024 * 10;
	String team_id = null;
	String stNumber = null;
	
	int realteam,realst;

	//file upload
	File f = new File(filePath);
	if (!f.isFile()) {
		if (!f.isDirectory()) {
			f.mkdir();
		}
	}

	MultipartRequest mul = new MultipartRequest(request, filePath,
			maxSize, "UTF-8");

	if (mul.getParameter("notice_check") != null) {
		checkbox_data = mul.getParameter("notice_check");
	}
	if (mul.getFile("our_room_fileUpload") != null) { //if file exists
		f = mul.getFile("our_room_fileUpload");
		fileName = mul.getOriginalFileName("our_room_fileUpload");

	}

	content = mul.getParameter("content");
	team_id = (String) session.getAttribute("team_id");
	stNumber = (String) session.getAttribute("currentID");

	realteam=3;
	realst=Integer.parseInt(stNumber);
	
	stmt.executeUpdate("INSERT INTO team_writing (team_id, w_content, stNumber, w_file, notice_check) VALUES ("
			+ realteam
			+ ", '"
			+ content
			+ "', "
			+ realst
			+ ",'"
			+ fileName + "', '" + checkbox_data + "')");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	alert("success");
	location.href="our_room.jsp";
</script>
</body>
</html>