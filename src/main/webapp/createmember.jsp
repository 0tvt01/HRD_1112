<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    int custno=0;
    //데이터베이스 등록, db라이브러리 업로드, db접속, sql실행
    
    Class.forName("oracle.jdbc.driver.OracleDriver");
    //3)db접속
    Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
    String sql="select member_custno_seq.nextval from dual";
    PreparedStatement ps=conn. prepareStatement(sql);
    ResultSet rs=ps.executeQuery();
    if(rs.next()){
    	custno=rs.getInt("nextval");
    }
    rs.close();ps.close();conn.close();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
    margin:auto; 
    text-align:auto;
}
*{
 /*  border: 1px solid red;  */
  margin:0;
  padding:0;
 
}
header{
text-align: center;
padding:30px;
background-color: rgba(0,0,255,0.8);
color: white;
font-size: 25px;
}
nav{
  background-color: rgba(200,70,255,0.4);
  padding:8px;
}

li {
  display: inline-block;
  margin-right: 50px; 
  color: white;
  padding:9px;
}
h2{
 font-size: 20px;
 text-align: center;
 padding: 10px;
}
section{
height: 500px;
background-color: rgba(0,0,0,0.1);
color:black;
}
footer {
  height: 90px;
  text-align: center;
  line-height: 90px;   
  color: white; 
  background-color: rgba(0,0,255,0.8);
}
li a{
  color:white;
  text-decoration:none;
}
</style>
<script>
function valuechek(){
	var custname=document.getElementById("custname");
	var phone=document.getElementById("phone");
	var address=document.getElementById("address");
	var joindate=document.getElementById("joindate");
	var grade=document.getElementById("grade");
	var city=document.getElementById("city");
	if(custname.value==""){
		alert("회원성명이 입력되어있지않습니다")
		custname.focus();
		return false;
	}
	if(phone.value==""){
		alert("회원전화가 입력되어있지않습니다")
		phone.focus();
		return false;
	}
	if(address.value==""){
		alert("주소가 입력되어있지않습니다")
		address.focus();
		return false;
	}
	if(joindate.value==""){
		alert("가입일자가 입력되어있지않습니다")
		joindate.focus();
		return false;
	}
	if(grade.value==""){
		alert("고객등급이 입력되어있지않습니다")
		grade.focus();
		return false;
	}
	if(city.value==""){
		alert("거주도시가 입력되어있지않습니다")
		city.focus();
		return false;
	}
}
</script>
</head>
<body>
<header>쇼핑물 회원관리 ver1.0</header>

<nav>
<ul>
<li><a href="createmember.jsp">회원등록</a></li>
<li><a href="memberlist.jsp">회원목록조회/수정</a></li>
<li><a href="sales.jsp">회원매출 조회</a></li>
<li><a href="index.jsp">홈으로</a></li>
</ul>
</nav>



<section>

<h2>홈쇼핑 회원등록</h2>
<p>
<form action="creatememberproc.jsp" method="post" onsubmit="return valuechek()">
<table border="1">
<tr>
     <td>회원번호(자동발생)</td>
     <td><input type="text" id="custno" name="custno" value="<%=custno%>"></td>
</tr>
<tr>
       <td>회원성명</td>
       <td><input type="text" id="custname" name="custname"></td>
</tr>
<tr>
       <td>회원전화</td>
       <td><input type="text" id="phone" name="phone"></td>
</tr>
<tr>
       <td>회원주소</td>
       <td><input type="text" id="address" name="address"></td>
</tr>
<tr>
       <td>가입일자</td>
       <td><input type="text" id=" joindate" name=" joindate"></td>
</tr>
<tr>
       <td>고객등급[A:VIP,B:일반,C:직원]</td>
       <td><input type="text" id=" grade" name=" grade"></td>
</tr>
<tr>
       <td>도시코드</td>
       <td><input type="text" id="city" name="city"></td>
</tr>
<tr>
       <td></td>
       <td>
       <input type="submit" value="등록">
       <input type="button" value="조회" onclick="javascript:location.href='memberlist.jsp'">
       </td>
       
</tr>
</table>
</form>
</p>
</section>

<footer>HRDKOREA Copyright@2016 All nights</footer>
</body>
</html>