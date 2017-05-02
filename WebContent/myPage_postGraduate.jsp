<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sql_connection.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%
String role = (String)session.getAttribute("role");
int id = Integer.parseInt((String)session.getAttribute("currentID"));
String name ="";
String college="20";
String major="";
String intro="";
String phone="";
String pg_college="";
String pg_grade="";
String pg_major="";

String[] offLine = new String[2];
offLine[0]="";
offLine[1]="";
System.out.println("String "+id);

String 	infoSt = "SELECT	* FROM member WHERE stNumber="+id+";";
String	postSt = "SELECT	* FROM postGraduate WHERE postG_st="+id+";";
String	mentorSt = "SELECT	offLine FROM mentor WHERE mentor_st="+id+";";
String favoriteMentee="SELECT name, photo, phone FROM member WHERE stNumber = any(SELECT mentee_st FROM favorite WHERE mentor_st="+id+");";
String imgPath="/PresedeEonni/uploaded_image/";

ArrayList<String> fName = new ArrayList<String>();
ArrayList<String> fPhone = new ArrayList<String>();
ArrayList<String> fPhoto = new ArrayList<String>();
System.out.println(infoSt);
rs = stmt.executeQuery(infoSt);

if(rs.next()){
	name = rs.getString("name");
	college = rs.getString("college");
	major = rs.getString("major");
	intro = rs.getString("intro");
	phone = rs.getString("phone");
}
rs = stmt.executeQuery(mentorSt);
if(rs.next()){
	if(rs.getInt("offLine") == 1)	offLine[0] ="checked";
	else if(rs.getInt("offLine") == 0)	offLine[1]="checked";
	else	System.out.println("myPage_postGraduate : offLine Error");
}
rs = stmt.executeQuery(postSt);
if(rs.next()){
	pg_college = rs.getString("pg_college");
	pg_major = rs.getString("pg_major");
	pg_grade = rs.getString("pg_grade");
}

String s[]= new String[11];
for(int i = 0 ; i < s.length;i ++)	s[i] = "";

if(college.equals("1"))	s[0]="selected";
else if(college.equals("2"))	s[1]="selected";
else if(college.equals("3"))	s[2]="selected";
else if(college.equals("4"))	s[3]="selected";
else if(college.equals("5"))	s[4]="selected";
else if(college.equals("6"))	s[5]="selected";
else if(college.equals("7"))	s[6]="selected";
else if(college.equals("8"))	s[7]="selected";
else if(college.equals("9"))	s[8]="selected";
else if(college.equals("10"))	s[9]="selected";
else if(college.equals("11"))	s[10] = "selected";
else	System.out.println("myPage_postGraduate : college Error");

rs = stmt.executeQuery(favoriteMentee);
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
 <title>내정보보기::대학원언니</title>
 <script src="js/jquery-1.8.1.js"></script>
    <script>
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
    		
    		if(img_index=='0') {moveSliderByImg(1,imgSize);}
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
            with (document.mentor_join) {
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
            with (document.mentor_join) {
                major.options.length = 0;
                for (i = 0; i < valArray.length; i++)
                    major.options[i] = new Option(valArray[i], i);
            }
        }

        function return_main() {
            location.href = "join_mentor_job.html";
        }
        function valid(){
        	var form = document.mentor_join;
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
        	}else if(form.pg_college.value == ""){
        		alert("재학중인 대학교를 올바르게 입력하세요.");
        		form.pg_college.focus();
        		 return false;
        	}else if(form.pg_major.value == ""){
        		alert("전공을 올려주세요.");
        		form.pg_major.focus();
        		 return false;
        	}else if(form.pg_grade.value == ""){
        		alert("현재 재학중인 학기를 올려주세요.");
        		form.pg_grade.focus();
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
        		var conf = false;
        		for(var i = 0;i < off-line.length;i ++){
        			if(form.off-line[i].checked == true){
        		   		conf=true;
   					}  
        		}
        		if(conf == false){
        			alert("오프라인만남 여부를 선택하세요");
        			form.off-line[0].focus();
        			//return conf;
        		}
        		return conf;
        	}
        }
    });
</script>
</head>
<body onload="setMajor();">
	<div class="slide">
	<div class="form">
    <form action="modifyEN_pg" method="post" name="mentor_join" enctype="multipart/form-data"  onSubmit= "return valid();">
    <center><table id="mentor">
    <tr>
        <th id="td1"> 학번(ID) </th>
        <td> <input type="text" id="stu_number" name="stu_number" readOnly = "readOnly" value="<%=id %>"/> </td>
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
            <td> <input type="password" id="check_password" name="check_password"/> </td>
            </tr>
        <tr>
            <th id="td5"> 출신학교 </th>
            <td><input type="text" value="성신여자대학교"></td>
            <br><th> 단과대 </th>
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
            <td>
                <select name="major">
                </select>
            </td>
            <th id="td6">휴대전화번호(숫자만입력)</th>
            <td>
            	<input type="text" maxlength="11" name="phone" value="<%=phone %>"/>
            </td>
         </tr>
        <tr>
            <th id="td7" class="current"> 현재 </th>
            <td> <input type="text" name="pg_college" value="<%=pg_college %>"/>대학교 대학원
                <input type="text" name="pg_grade" value="<%=pg_grade %>"/> 학기</td>
            <th id="td8" class="current"> 전공분야 </th>
            <td><input type="text" name="pg_major" value="<%=pg_major %>"/>
            <!--  
                <select name="post_major">
                    <option id="major1" > 인문 </option>
                    <option id="major2" > 사회과학 </option>
                    <option id="major3" > 교육 </option>
                    <option id="major4" > 법 </option>
                    <option id="major5" > 자연과학 </option>
                    <option id="major6" > 생활과학 </option>
                    <option id="major7" > 공학 </option>
                    <option id="major8" > 간호학 </option>
                    <option id="major9" > 의학 </option>
                    <option id="major10" > 미술 </option>
                    <option id="major11" > 음악 </option>
                    <option id="major12" > 체육 </option>
                    <option id="major13" > 예술 </option>
                </select>
             -->
            </td>
        </tr>
        
        <tr>
            <th id="td10"> 오프라인 여부<br>
                </th>
            <td> <input type="radio" name="off-line"value="yes" <%=offLine[0] %> /> 예
                <input type="radio" name="off-line"value="no" <%=offLine[1] %> /> 아니오 &nbsp;<font color="red" size="1">(후배와 교류할 때 오프라인으로 할 것인지 체크해주세요.) <font color="red"><b>*<b></font>
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
            <td>
            	<textarea  id="intro" name="intro" cols="52" rows="5"><%=intro %> 	</textarea>
            </td>
        </tr>
        <tr align="center" height="100px">
            <td colspan="4"> <input type="submit" value="수정하기"/>
                <input type="reset" value="돌아가기" onclick="return_main()"/>
                </td>
            </tr>

        </table></center>
    </form>
    </div>
    <div class="form">
    
    
    		나에게 관심있는 동생 보기<br><br>

   			<%
       			for(int i=0;i<fPhone.size();i++){
       		%>
       		<div class="favorite">
       		<img src="<%=imgPath %><%=fPhoto.get(i) %>" class="mentorImage"><br><br>
       		동생이름 : <%=fName.get(i) %><br><br>
       		동생번호 :<%=fPhone.get(i) %><br><br>
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