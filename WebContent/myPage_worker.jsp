<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sql_connection.jsp" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" type="text/css" href="css/form_style.css" />
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
});
</script>
<title>내정보보기::직장인언니</title>
</head>
    <script>

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
        	}else if(form.company.value == ""){
        		alert("회사명을 입력하세요.");
        		form.company.focus();
        		 return false;
        	}else if(form.dept.value == ""){
        		alert("소속부서를 입력하세요.");
        		form.dept.focus();
        		 return false;
        	}else if(form.position.value == ""){
        		alert("직급을 입력하세요.");
        		form.position.focus();
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
	</script>
</head>
<%
String role = (String)session.getAttribute("role");
int id = Integer.parseInt((String)session.getAttribute("currentID"));
String name ="";
String college="20";
String major="";
String intro="";
String phone="";
String company="";
String dept="";
String position="";

String[] offLine = new String[2];
offLine[0]="";
offLine[1]="";
System.out.println("String "+id);

String 	infoSt = "SELECT	* FROM member WHERE stNumber="+id+";";
String	workerSt = "SELECT	* FROM worker WHERE worker_st="+id+";";
String	mentorSt = "SELECT	offLine FROM mentor WHERE mentor_st="+id+";";
String favoriteMentee="SELECT name, photo, phone FROM member WHERE stNumber = any(SELECT mentee_st FROM favorite WHERE mentor_st="+id+");";
String imgPath="/PresedeEonni/uploaded_image/";

ArrayList<String> fName = new ArrayList<String>();
ArrayList<String> fPhone = new ArrayList<String>();
ArrayList<String> fPhoto = new ArrayList<String>();

System.out.println(infoSt);
rs = stmt.executeQuery(infoSt);
System.out.println("myPage_worker : rs");

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
	else	System.out.println("myPage_worker : offLine Error");
}
rs = stmt.executeQuery(workerSt);
if(rs.next()){
	company = rs.getString("company");
	dept = rs.getString("dept");
	position = rs.getString("position");
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
else	System.out.println("myPage_worker : college Error");


	
rs = stmt.executeQuery(favoriteMentee);
while(rs.next()){
	fPhone.add(rs.getString("phone"));
	fPhoto.add(rs.getString("photo"));
	fName.add(rs.getString("name"));
}	

	
	


%>
<body onload="setMajor();">
	<br>
	<div class="slide">
	<div class="form">
    <form action="modifyEN_w" method="post" name="mentor_join" enctype="multipart/form-data"  onSubmit= "return valid();">    
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
            <th id="td7" class="current"> 직장명 </th>
            <td><input type="text" id="company" name="company" value="<%=company %>"/></td>
            <th id="td8" class="current"> 소속부서 </th>
            <td><input type="text" id="dept" name="dept" value="<%=dept %>"/></td>
            <th id="td6" class="current"> 직급 </th>
            <td><input type="text" id="position" name="position" value="<%=position %>"/></td>
            </tr>
        
        <tr>
            <th id="td10"> 오프라인 여부<br></th>
            <td> <input type="radio" name="off-line"value="yes" <%=offLine[0] %>/> 예
                <input type="radio" name="off-line"value="no" <%=offLine[1] %>/> 아니오  
                &nbsp;<font color="red" size="1">(후배와 교류할 때 오프라인으로 할 것인지 체크해주세요.) <font color="red"><b>*<b></font>
            </td>
            <th id="td6">휴대전화번호(숫자만입력)</th>
            <td>
            	<input type="text" maxlength="11" name="phone" value="<%=phone %>" />
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
            	<textarea  id="intro" name="intro" cols="52" rows="5"><%=intro %></textarea>
            </td>
        </tr>
        <tr align="center" height=100px>
            <td colspan="6"> <input type="submit" value="수정하기"/>
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
    <div class="leftButton">
            	  <
    </div>
    <div class="rightButton">
              		>
    </div>
</body>

</body>
</html>