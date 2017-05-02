<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<%
	String imgPath="/PresedeEonni/uploaded_image/";
	String[][] result = new String[8][2];
	result=(String[][])request.getAttribute("Result");
	//String imgChange[] = (String[])result.toArray(new String[result.size()]);
	//String realPath=imgPath+imgChange[i];
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>

<script language="javascript">
	var text= new Array();
	var test=new Array('<%=result[2][0]%>','<%=result[3][0]%>','<%=result[4][0]%>','<%=result[5][0]%>','<%=result[6][0]%>','<%=result[7][0]%>');
	var name=new Array('<%=result[2][1]%>','<%=result[3][1]%>','<%=result[4][1]%>','<%=result[5][1]%>','<%=result[6][1]%>','<%=result[7][1]%>');

	var i=0;
	function changeImg(imgIndex, name3, hiddenVal){
		
			var name_field=document.getElementById(name3);
			if(i<test.length){
			document[imgIndex].src="<%=imgPath %>"+test[i];
			name_field.innerHTML = ""+name[i];
			document.worldcupForm.imgName.value=document[hiddenVal].src.substring(51);

			
			i++;
			}
			else{
				document[imgIndex].src="<%=imgPath %>white.jpg";
				name_field.innerHTML = "<input type='submit' value='관심멘토 선택'>";
			}
			
			
	}

</script>
	<style type="text/css">
a:link {color:#FFFFFF;}    /* unvisited link */
a:visited {color:#FFFFFF;} /* visited link */
a:hover {color:#FFFFFF;}   /* mouse over link */
a:active {color:#FFFFFF;}
	.imgleft{
		width:400px;
		height:600px;	
	}
	
	.picture{
	float:left;
	}

	</style>
</head>
<body>

<form method="post" action="ReturnFavorite" name="worldcupForm">
<!--  onclick="alert('test');"-->
<div style="cursor:pointer" onclick="changeImg('img1','name2','img0');" class="picture">
		<img src="<%=imgPath %><%=result[0][0] %>" class="imgleft" name="img0"><br>
		<div id="name"><%=result[0][1] %></div>
	
</div>
<div style="cursor:pointer" onclick="changeImg('img0','name','img1');" class="picture">
		<img src="<%=imgPath %><%=result[1][0] %>" class="imgleft" name="img1"><br>
		<div id="name2"><%=result[1][1] %></div>
</div>
<input type="hidden" name="imgName" value="null">
</form>
</body>
</html>