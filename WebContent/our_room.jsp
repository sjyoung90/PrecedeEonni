<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ include file="sql_connection.jsp"%>
<%
	String stNumber;
	String w_content[];
	
	int i=0;
	//while(rs.next()){
		//		w_content=rs.getArray("w_content");
			//	stNumber=rs.getString("stNumber");
				
				//i++;
	//}
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
<link rel="stylesheet" type="text/css" href="css/our_room_style.css">
<link rel="stylesheet" type="text/css" href="js/fancybox/source/jquery.fancybox.css?v=2.1.2" media="screen" />
<script src="js/jquery-1.8.1.js"></script>
<script src="js/jquery.placeholder.js"></script>
<script src="js/jquery.autogrowtextarea.js"></script>
<script src="js/jquery.masonry.min.js"></script>
<script src="js/fancybox/source/jquery.fancybox.js?v=2.1.3"></script>
<script src="js/fancybox/lib/jquery.mousewheel-3.0.6.pack.js"></script>
<script>
	$(document).ready(function() {
		$('input[placeholder], textarea[placeholder]').placeholder();
		$('.textInput').autoGrow();
		$('#masonry_container').masonry({
			itemSelector: '.article',
			columnWidth:110,
			isAnimated:true
		}); 

		$(".various").fancybox({
			maxWidth	: 800,
			maxHeight	: 600,
			fitToView	: false,
			width		: '40%',
			height		: '40%',
			autoSize	: false,
			closeClick	: false,
			openEffect	: 'none',
			closeEffect	: 'none'
		});

		$('a[rel=fancybox]').css('color','#FFF');
	
    });
	
</script>
<style>
	
</style>
</head>

<body>
<header>
	<form method="post" action="our_room_result.jsp" enctype="multipart/form-data">
		<table class="write_table">
            <tr>
            	<td colspan="2">
                 	<textarea  name="content" placeholder="궁금한 것을 질문하거나 인사를 나눠보세요:)" onKeyup="textareaSetLine(this)" class="textInput"></textarea>
                </td>
            </tr>
            <tr>
            	<td class="write_file_title">첨부하기</td>
                 <td class="write_file"><input type="file" value="파일첨부" name="our_room_fileUpload"></td>
            </tr>
            <tr>
            	<td class="notice_check"><input type="checkbox" name="notice_check" value="checked">공지로 등록하기</td>
            	<td class="submit_button"><input type="submit" value="게시"></td>
            </tr>
    	</table>
    </form>
    <br>
</header>
<article>
	<section>
    	<table class="search_box">
        	<tr>
            	<td><input type="text" placeholder="찾고싶은 글이 있나요?"></td>
    			<td><img src="/image/search_icon.png" class="search_icon"></td>
        	</tr>
        </table>
        <br>
        	<div id="masonry_container">
        		<% 
        			rs=stmt.executeQuery("select * from team_writing");
        			while(rs.next()){
        		%>
        		<!-- test.jsp?writing_id=<%=rs.getString("writing_id") %>  -->
        		<a class="various" data-fancybox-type="iframe" href="our_room_fancy.jsp?writing_id=<%=rs.getString("writing_id") %>">
       	 		<div class="article normal">
       	 		<br>&nbsp;&nbsp;<div class="list_writer"><%=rs.getString("stNumber") %><br> <%=rs.getString("w_date") %></div><br><br>&nbsp;&nbsp;
       	 		<div class="list_content"><%=rs.getString("w_content") %></div>
       	 		</div></a>
				<% 
        			}
       	 		%>
    		</div>
        <div class="notice">
        <%
       		 rs=stmt.executeQuery("select * from team_writing where notice_check='checked'");
        	if(rs.next()){
        %>
        <%=rs.getString("w_date") %><br><%=rs.getString("w_content") %>
 		<%
        	}
        	else{
 		%>
 		이곳은공지사항입니다. 중요한 글을 등록하세요!
 		<%
        	}
 		%>
        </div>    
    </section>
</article>
<article>
	<div id="our_room_popup">
            
        </div>
</article>
</body>
</html>
