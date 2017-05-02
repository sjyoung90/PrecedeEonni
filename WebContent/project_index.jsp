<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>앞서가는 언니 :: 성신여대 멘토링 사이트</title>
<link rel="stylesheet" type="text/css" href="css/project_style.css">
<link rel="stylesheet" type="text/css" href="js/fancybox/source/jquery.fancybox.css?v=2.1.2" media="screen" />
<script src="js/jquery-1.8.1.js"></script>
<script src="js/jquery.placeholder.js"></script>
<script src="js/jquery.autogrowtextarea.js"></script>
<script src="js/jquery.masonry.min.js"></script>
<script src="js/fancybox/source/jquery.fancybox.js?v=2.1.3"></script>
<script src="js/fancybox/lib/jquery.mousewheel-3.0.6.pack.js"></script>
<script>
	$(document).ready(function() {		
		$('.topnav').hover(function() {
           		$('.subnav1').slideToggle('fast');
			$('.subnav2').slideToggle('fast');
			$('.subnav3').slideToggle('fast');
       		 });
		
		$('a[rel=fancybox]').fancybox({
			maxWidth	: 600,
			maxHeight	: 600,
			fitToView	: false,
			width		: '400',
			height		: '250',
			autoSize	: false,
			closeClick	: false,
			openEffect	: 'fade',
			closeEffect	: 'none'
		});

		$('.login_assign').click(function(){
			$.fancybox.close();
		});
		
		$('.logout').click(function(){
			<%--
			if(session.getAttribute("currentID") != null)
				session.setAttribute("currentID", null);
			--%>
			window.location.reload();	//새로고침
		});
		
    });
</script>
</head>
<body>
	<header>
    	
    	<hgroup><a href="main_slide.html" target="mainFrame"><img src="image/logo.png" class="logo" border="0"></a><!--<h1 class="front">앞서가는</h1><h1 class="eoni">언니</h1>--></hgroup>
        <nav role="navigation">
        	<ul class="topnav">
            			<li>
	                <a href="main_slide.html" target="mainFrame">앞서가는언니?</a>
                    <ul class="subnav1">
                    	<li class="subnav_content"><a href="menu/whatIsThis.html" target="mainFrame">이곳은</a></li>
                       <li class="subnav_content"> <a href="menu/weAre.html" target="mainFrame">우리는</a></li>
                    </ul>
                </li>
                <li>
                	<a href="menu/eoniProfile.html" target="mainFrame">언니찾기</a>
                    <ul class="subnav2">
                    	<li class="subnav_content"><a href="mentors.jsp" target="mainFrame">언니보기</a></li>
                        <li class="subnav_content"><a href="WorldCup_start.html" target="mainFrame">언니를찾아줘</a></li>
                    </ul>
                </li>
                <li>
    <%
	String	action = null;
	String	role = null;
	role = (String)session.getAttribute("role");
	String	way = null;
	way = (String)session.getAttribute("way");
	if(role == null)	action="main_slide.html";
	else if(role.equals("동생"))	action = "myPage_mentee.jsp";
	else{ 
		if(way.equals("취업"))	action="myPage_worker.jsp";	
		else if(way.equals("창업"))	action="myPage_biz.jsp";
		else if(way.equals("대학원"))	action="myPage_postGraduate.jsp";
	}
	System.out.println(action);
	%>
              	  <a href='#'>달려가는나</a>
                 	<ul class="subnav3">
                    	<li class="subnav_content"><a href="<%=action %>" target="mainFrame">나</a></li>
                        <li class="subnav_content"> <a href="trace1.jsp" target="mainFrame">발자취</a></li>
                        <li class="subnav_content"> <a href="our_room.jsp" target="mainFrame">우리방</a></li>
                    </ul>
                </li>
                <!--<li><a href="menu/review.html" target="mainFrame">후기게시판</a></li>
                <li><a href="menu/shareData.html" target="mainFrame">한발짝더</a></li>-->

            </ul>
        </nav>
        <div class="menu_line">
        </div>
        <div class="loginNassign">
        <%    	
        //String id = (String)session.getAttribute("currentID");
        //System.out.println(id);
       // if(id == null)	id ="";
        if(session.getAttribute("currentID") == null){
        	out.println("<a rel=\"fancybox\" href=\"#login_popup\">로그인</a> | <a href=\"join_main.html\" target=\"mainFrame\">회원가입</a>");
        }else{
        	out.print(session.getAttribute("currentID")+" | ");
        	out.print(session.getAttribute("teamID"));
        	out.println("<a class=\"logout\" href=\"logout.jsp\">로그아웃</a>");
        }
        %>
        </div>
    </header>
    <div role="main" class="container">
    	<article>
    		<section>
            <!--Iframe-->
            <iframe src="main_slide.html" name="mainFrame" frameborder="0" seamless>
             </iframe> 
    		</section>
    	</article>
    </div>
	<footer><img src="image/facebook_logo.png"><strong> copyRightⓒ 성신여대 IT학부<br>윤하와 아이들 | 김지민. 내윤하. 박단비. 정다운</strong></footer>


	<!--fancybox_login-->
	<div id="login_popup">
	   <h1>로그인</h1>
	   <div class="login_form">
	   <form method="post" action="login">
            <table class="login_popup_table">
            	<tr>
                	<td><strong>아이디</strong></td>
			<td><input type="text" name="stu_number"></td>
			<td rowspan="2"><input type="submit" value="로그인"></td>
                </tr>
                <tr>
                	<td><strong>비밀번호</strong></td>
			<td><input type="password" name="password"></td>
                </tr>
            </table>
	   </form>
       </div>
   
	ID/PW찾기       |       <a href="join_main.html" target="parent.mainFrame" class="login_assign">회원가입</a>
	
	</div>

	<!-- fancybox_login_success
	<div id="loginSuccess_popup">
		<h1>
		<%--	out.print(session.getAttribute("currentID"));	--%>환영합니다.
		</h1>
	</div>
	-->
</body>
</html>