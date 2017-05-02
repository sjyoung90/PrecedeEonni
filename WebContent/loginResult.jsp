<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="js/fancybox/source/jquery.fancybox.css?v=2.1.2" media="screen" />
<script src="js/fancybox/source/jquery.fancybox.js?v=2.1.3"></script>
<script src="js/fancybox/lib/jquery.mousewheel-3.0.6.pack.js"></script>
<title>login result</title>
<%
//resultToJSP 1이면 정상로그인 
//resultToJSP 2이면 비번틀림
//resultToJSP 3이면 회원가입해주세요
	request.setCharacterEncoding("utf-8");
	String result = null;
	int a = (Integer)request.getAttribute("loginResult");
	
	switch(a){
	case 1 : result = "환영합니다^^*";
		break;
	case 2 : result = "비밀번호를 확인해주세요ㅜㅜ";
		break;
	case 3 : result = "회원가입먼저해주세요^^*";
		break;
	case 0 : result = "오류";
		break;
	}
%>
<script type="text/javascript">
/*
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
	*/
	$('.ok').click(function(){
		$.fancybox.close();
		location.href="project_index.jsp";
	});
	
</script>
</head>
<body>
	<div id="loginResult">
	   <h1>로그인 결과</h1>
	   <div class="loginResult_form">
	   <!-- <form method="get" action="login"> -->
            <table class="login_popup_table">
            	<tr>
                	<td><strong><%=result %></strong></td>
					<td><input type="button" class="ok" value="확인"></td>
                </tr>
           
            </table>
	   <!-- </form> -->
       </div>
	</div>

</body>
</html>