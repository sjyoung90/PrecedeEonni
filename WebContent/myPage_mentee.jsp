<%@page import="com.sun.xml.internal.fastinfoset.util.StringArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sql_connection.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%
String role = (String)session.getAttribute("role");
String id = (String)session.getAttribute("currentID");
String name ="";
String college="";
String major="";
String intro="";
String phone="";
System.out.println("String "+id);
//SELECT name, photo, phone FROM member WHERE stNumber = (SELECT mentor_st FROM favorite WHERE mentee_st=20091207)
String infoSt = "SELECT	* FROM member WHERE stNumber="+Integer.parseInt(id)+";";
String favoriteSt="SELECT name, photo, phone FROM member WHERE stNumber = any(SELECT mentor_st FROM favorite WHERE mentee_st="+id+");";
System.out.println(infoSt);
//SELECT name, photo, phone FROM member WHERE stNumber = any(SELECT mentor_st FROM favorite WHERE mentee_st=20091207);
ArrayList<String> fNum = new ArrayList<String>();
ArrayList<String> fName = new ArrayList<String>();
ArrayList<String> fPhone = new ArrayList<String>();
ArrayList<String> fPhoto = new ArrayList<String>();
int stnum;
String imgPath="/PresedeEonni/uploaded_image/";

rs = stmt.executeQuery(infoSt);
System.out.println("infoSt실행");
if(rs.next()){
	name = rs.getString("name");
	college = rs.getString("college");
	major = rs.getString("major");
	intro = rs.getString("intro");
	phone = rs.getString("phone");
}

String s[]= new String[11];
for(int i = 0 ; i < s.length;i ++)	s[i] = "";

if(college=="1")	s[0]="selected";
else if(college=="2")	s[1]="selected";
else if(college=="3")	s[2]="selected";
else if(college=="4")	s[3]="selected";
else if(college=="5")	s[4]="selected";
else if(college=="6")	s[5]="selected";
else if(college=="7")	s[6]="selected";
else if(college=="8")	s[7]="selected";
else if(college=="9")	s[8]="selected";
else if(college=="10")	s[9]="selected";
else	s[10] = "selected";


	rs = stmt.executeQuery(favoriteSt);
	while(rs.next()){
		fPhone.add(rs.getString("phone"));
		fPhoto.add(rs.getString("photo"));
		fName.add(rs.getString("name"));
	}	


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/form_style.css" />
<title>내정보 보기</title>
<script src="js/jquery-1.8.1.js"></script>
<script src="js/fancybox/source/jquery.fancybox.js"></script>
<script src="js/fancybox/lib/jquery.mousewheel-3.0.6.pack.js"></script>
<script>
/*
$(document).ready(function() {
		var img_index=0;
		var imgSize =$('.myInfo').css('width');
		$('.myInfo').each(function(index){
			$(this).attr('data-index',index);
		});

		$('.leftButton').click(function(){
			
			
			if(img_index=='1') {moveSliderByImg(-1,imgSize);}
			img_index=parseInt(img_index)+1;
			
			var offset = $(".slide").offset();
			offset.left="-=100%";
			$('.slide').animate({left:"-=100%"},"slow");
			$(".slide").offset(offset);
			
		});
		
		$('.rightButton').click(function(){
			
			if(img_index=='0') {moveSliderByImg(4,imgSize);}
			img_index=parseInt(img_index)-1;
			
			var offset = $(".slide").offset();
			offset.left="+=100%";
			$('.slide').animate({left:"+=100%"},"slow");
			
			$(".slide").offset(offset);
		});
		
		function moveSliderByImg(index,imgSize){
			var willMoveLeft = -(parseInt(index) * parseInt(imgSize));
			$('.slide').animate({left:willMoveLeft},"slow");
			img_index = index;
		}
	
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
*/


$(document).ready(function() {
	var img_index=0;
	var imgSize =$('.form').css('width');
	$('.form').each(function(index){
		$(this).attr('data-index',index);
	});
	
	$('.rightButton').click(function(){
		
		
		if(img_index=='1') {moveSliderByImg(-1,imgSize);}
		img_index=parseInt(img_index)+1;
		
		var offset = $(".slide").offset();
		offset.left="-=100%";
		$('.slide').animate({left:"-=100%"},"slow");
		$(".slide").offset(offset);
		
	});
	
	$('.leftButton').click(function(){
		
		if(img_index=='0') {moveSliderByImg(2,imgSize);}
		img_index=parseInt(img_index)-1;
		
		var offset = $(".slide").offset();
		offset.left="+=100%";
		$('.slide').animate({left:"+=100%"},"slow");
		
		$(".slide").offset(offset);
	});
	
	function moveSliderByImg(index,imgSize){
		var willMoveLeft = -(parseInt(index) * parseInt(imgSize));
		$('.slide').animate({left:willMoveLeft},"slow");
		img_index = index;
	}
	
        function setMajor() {
            var valArray;
            with (document.mentee_join) {
                if (college.value == "0") {
                    valArray = new Array("국어국문학과", "영어영문학과", "독어독문학과", "불어불문학과", "일어일문학과", "중어중문학과", "사학과");
                    makeOptions(valArray);
                }
                else if (college.value == "1") {
                    valArray = new Array("정치외교학과", "심리학과", "지리학과", "경제학과", "경영학과", "미디어커뮤니케이션학과");
                    makeOptions(valArray);
                }
                else if (college.value == "2") {
                    valArray = new Array("법학과");
                    makeOptions(valArray);
                }
                else if (college.value == "3") {
                    valArray = new Array("수학과", "통계학과", "생명과학·화학부", "미디어정보학부", "컴퓨터정보학부", "IT학부");
                    makeOptions(valArray);
                }
                else if (college.value == "4") {
                    valArray = new Array("의류학과", "식품영양학과", "생활문화소비자학과", "사회복지학과", "스포츠레저학과");
                    makeOptions(valArray);
                }
                else if (college.value == "5") {
                    valArray = new Array("교육학과", "사회교육과", "윤리교육과", "한문교육과", "유아교육과");
                    makeOptions(valArray);
                }
                else if (college.value == "6") {
                    valArray = new Array("동양화과", "서양화과", "조소과", "공예과", "산업디자인과");
                    makeOptions(valArray);
                }
                else if (college.value == "7") {
                    valArray = new Array("성악과", "기악과", "작곡과");
                    makeOptions(valArray);
                }
                else if (college.value == "8") {
                    valArray = new Array("자율전공학부");
                    makeOptions(valArray);
                }
                else if (college.value == "9") {
                    valArray = new Array("간호학과", "글로벌의과학과");
                    makeOptions(valArray);
                }
                else if (college.value == "10") {
                    valArray = new Array("문화예술학과", "미디어영상연기학과", "현대실용음악학과", "무용예술학과", "메이크업디자인학과");
                    makeOptions(valArray);
                }
            }
        }

        function makeOptions(valArray) {
            with (document.mentee_join) {
                major.options.length = 0;
                for (i = 0; i < valArray.length; i++)
                    major.options[i] = new Option(valArray[i], i);
            }
        }

        function check_num(obj) {
            var sum = 0;

            for (var i = 0; i < obj.elements.length; i++) {
                var chk = obj.elements[i];

                if (chk.checked == true) {
                    sum += 1;
                }
                if (sum > 3) {
                    alert("3개까지만 선택가능합니다.");
                    chk.checked = false;
                }
            }
        }


        function return_main() {
            location.href = "join_main.html";
        }
        function valid(){
        	var form = document.me_mentee;
        	//alert(form.intro.vale);
        	if(form.stu_number.value == ""){
        		alert("학번을 입력하세요.");
        		form.stu_number.focus();
       			 return false; 
        	}else if(form.name.value == ""){
        		alert("이름 입력하세요.");
        		form.name.focus();
        		 return false;
        	}else if(form.password.value == ""){
        		alert("비밀번호를 입력하세요.");
        		form.password.focus();
        		 return false;
        	}else if(form.password.value != form.check_password.value){
        		alert("비밀번호를 올바르게 입력하세요.");
        		form.password.focus();
        		 return false;
        	}else if(form.phone.value == ""){
        		alert("휴대폰번호를 입력하세요.");
        		form.phone.focus();
        		 return false;
        	}else if(form.addfile.value == ""){
        		alert("사진을 올려주세요.");
        		form.addfile.focus();
        		 return false;
        	}else if(form.intro.value == ""){
        		alert("자기소개를 입력하세요.");
        		form.intro.focus();
        		 return false;
        	}else{	
        		var conf=   false;
        		for(var i=0;i<form.way.length;i++){
        			if(form.way[i].checked == true){
        		   		conf=true;
   					}  
        		}
        		if(conf == false){
        			alert("관심분야를 선택하세요");
        			form.way[0].focus();
        			//return conf;
        		}
        		return conf;
        	}
        }
});
</script>
</head>
<body onload="setMajor();">
	<br>
	<div class="slide">
	<div class="form">
   <form action="modifyDS" method="post" name="me_mentee" enctype="multipart/form-data"  onSubmit= "return valid();">
   <center>
    <table id="mentee">
    <tr>
        <th id="td1"> 학번(ID)</th>
        <td><input type="text" id="id" name="stu_number" readOnly = "readOnly" value="<%=id %>"/> </td>
        <th id="td7"> 역할</th>
        <td><input type="text" id="role" name="role" readOnly = "readOnly" value="<%=role %>"/></td>
    </tr>
    <tr>
            <th id="td2"> 이름 </th>
            <td> <input type="text" id="name" name="name" value="<%=name %>"/> </td>
    </tr>
    <tr>
            <th id="td3"> 비밀번호 </th>
            <td> <input type="password" id="password" name="password"/> </td>
            <th id="td4"> 비밀번호 확인 </th>
            <td> <input type="password" id="check_password"/> </td>
      </tr>
      <tr>
            <th id="td5"> 단과대 </th>
              <td><select name="college" onchange="setMajor();">
                <option id="humanities" value="0" <%=s[0] %>>인문과학대학</option>
                <option id="social" value="1" <%=s[1] %>>사회과학대학</option>
                <option id="law"  value="2" <%=s[2] %>>법과대학</option>
                <option id="science" value="3" <%=s[3] %>>자연과학대학</option>
                <option id="ecology" value="4" <%=s[4] %>>생활과학대학</option>
                <option id="education" value="5" <%=s[5] %>>사범대학</option>
                <option id="art" value="6" <%=s[6] %>>미술대학</option>
                <option id="music" value="7" <%=s[7] %>>음악대학</option>
                <option id="open_major" value="8" <%=s[8] %>>자율전공학부</option>
                <option id="nursing" value="9" <%=s[9] %>>간호대학</option>
                <option id="culture" value="10" <%=s[10] %>>융합문화예술대학</option>
                </select>
              </td>
            <th id="td5"> 전공(제1전공) </th>
            <td><select name="major"></select></td>
       </tr>
       <tr>
            <th id="td9"> 희망분야 <br> <font size="1">(최대 3개까지 선택 가능) </font></th>
        	<td>
                <!-- <input type="checkbox" name="way" value="1" onclick="check_num(this)"/>기업체
                <input type="checkbox" name="way" value="1" onclick="check_num(this)"/>공사/공기업
                <input type="checkbox" name="way" value="1" onclick="check_num(this)"/>연구소
                <input type="checkbox" name="way" value="1" onclick="check_num(this)"/>전문직 <br>
                <input type="checkbox" name="way" value="1" onclick="check_num(this)"/>정부기관-->
                <input type="checkbox" name="way" value="2" onclick="check_num(this)"/>창업
                <input type="checkbox" name="way" value="3" onclick="check_num(this)"/>대학원
                <input type="checkbox" name="way" value="1" onclick="check_num(this)"/>취업
            </td>
            <th id="td6">휴대전화번호(숫자만입력)</th>
            <td>
            	<input type="text" maxlength="11" name="phone" value="<%=phone %>"/>
            </td>
        </tr>
        <tr>
            <th>사진</th>
            <td>
                <input name="addfile" type="file"/>
            </td>
        </tr>
        <tr>
            <th>자기소개</th>
            <td><textarea  id="intro" name="intro" cols="52" rows="5"><%=intro %></textarea></td>
        </tr>
        <tr align="center" height=100px>
            <td colspan="4"> 
            	<input type="submit" value="수정하기" />
                <input type="reset" value="돌아가기" onclick="return_main()"/>
            </td>
        </tr>
        </table>
       </center>
      		</form>
		</div>
       	<div class="form">

       		관심있는 언니 보기<br><br>
       		<%
       			for(int i=0;i<fPhone.size();i++){
       		%>
       		<div class="favorite">
       		<img src="<%=imgPath %><%=fPhoto.get(i) %>" class="mentorImage"><br><br>
       		언니이름 : <%=fName.get(i) %><br><br>
       		언니번호 :<%=fPhone.get(i) %><br><br>
       		<button>팀신청하기</button>
       		</div>
       		<%
       			}
       		%>

       	</div>
       	   
</div>
     <div class="leftButton">
            	  <
    </div>
    <div class="rightButton">
              		>
    </div>
</body>
</html>