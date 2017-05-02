<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ include file="sql_connection.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/trace.css">
<script src="http://code.jquery.com/jquery-1.7.1.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>Insert title here</title>
<style> 
</style>

<script> 
$(document).ready(function(){  
  	
  
  
  /*각 timeline_part에 index속성 부여*/
  
  $(".timeline_part").each(function(index){
	  $(this).attr("index",index);	
  });
  
  /*각 timeline_dot 클릭시 timeline_board 보임*/

  $(".timeline_dot").hover(function(){
  	
  	  $(this).next().css("opacity","1");   
  
  
  },function(){
  
  	  $(this).next().css({"opacity":"0"})
  
  });
  
  /*마우스 hover시 timeline_part 색깔 */
  /*this는 ..""없이 써야함..*/
  
    $(".timeline_part").hover(function(){
    $(this).css("background-color","#999");
    },function(){
    $(this).css("background-color","#000");
		
  });
  
  /*.timeline_dot 위치 EACH FUNCTION   LEFT+5씩*/

});    
</script>

<!--스크롤-->
<script type="text/javascript">
	
		var dragFlag = false;
		var x, pre_x;


		$(function () {
			$('.slide').mousedown(
				function (e) {
					
					dragFlag = true;
					var obj = $(this);					
					
					x = obj.scrollLeft();
					
					pre_x = e.screenX;

				}
			);

			$('.slide').mousemove(
				function (e) {
					if (dragFlag) {
						var obj = $(this);
						
						obj.scrollLeft(x - e.screenX + pre_x);												
						
					}

				}
			);

			$('.slide').mouseup(
				function () {
					dragFlag = false;
				}


			);

			

		});
		
	</script>

</head>
<body>

<%
//String writing_id = request.getParameter("writing_id");
//int real_id = Integer.parseInt(writing_id);
int stNumber = Integer.parseInt((String)session.getAttribute("currentID"));
//로그인한 사람의 stNumber 가져오기!!


String trace_statement = "select count(*) as count from team_writing where stNumber="+stNumber;
//stmt = conn.createStatement();
rs = stmt.executeQuery(trace_statement);   
//int count = rs.getInt("count");
rs.next();
String t_count = rs.getString("count");
int count = Integer.parseInt(t_count);

String trace_statement2 = "SELECT * FROM team_writing WHERE stNumber="+stNumber+" ORDER BY w_date";
rs = stmt.executeQuery(trace_statement2);

String title = null;
String content = null;

/*if(rs.next()){
	title=rs.getString("w_title");
	content=rs.getString("w_content");
}*/
%>
  
<div class="slide">
<div class="timeline">

<!--timeline period-->
<div class="timeline_period">
 <div>2012.01</div> <div>2012.02</div> <div>2012.03</div>
 <div>2012.04</div>
 <div>2012.05</div>
 <div>2012.06</div>
 <div>2012.07</div>
 <div>2012.08</div>
 <div>2012.09</div>
 <div>2012.10</div>
 <div>2012.11</div>
 <div><a>2012.12</a></div> 
</div>

<!--real timeline-->
<div class="timeline_parts">
<!--<div class="timeline_part">-->
 <!--지칭은 timeline_part의 index로 찾아서 selector 기호이용-->
<!-- <div class="timeline_dot"></div>
    <div class="timeline_board"  style="background-color:#0C9"></div>
    <div class="timeline_dot"}></div>
    <div class="timeline_board"></div>
</div>
<div class="timeline_part"></div>
<div class="timeline_part"></div>
<div class="timeline_part"></div>
<div class="timeline_part"></div>
<div class="timeline_part">
  <div class="timeline_dot"}></div>
    <div class="timeline_board"></div>
</div>
<div class="timeline_part"></div>
<div class="timeline_part"></div>
<div class="timeline_part"></div>
<div class="timeline_part"></div>-->
<%
for(int i=0; i < count; i++){
%>
<div class="timeline_part">
	<div class="timeline_dot"></div>
    <div class="timeline_board"  style="background-color:#0C9">
    <% if(rs.next()){
    	title=rs.getString("w_title");
    	content=rs.getString("w_content");
    } %>
	<h1><%=stNumber %></h1>
		<%=content %>
    </div>
    <div class="timeline_board"></div>
</div>
<%
}
%>
<!--<div class="timeline_part"></div>
</div>-->
</div>
</div>
</div>


</body>
</html>