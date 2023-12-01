<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
a{
  color:white;
  
}
li a{
  color:white;
  text-decoration:none;
}

</style>
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
<pre>
<h2>쇼핑몰 회원관리프로그램</h2>
쇼핑올 회원정보와...
프로그램작성순서
1.회원정보테이블을 작성한다
2.매출정보 테이블을 생성한다
3.회원정보, 매출정보 테이블에 제시된 문제지의 참조데이터를 추가 생성한다
4.회원정보 입력 화면프로그램을 작성한다
5.회원정보 조회 프로그램을 작성한다
6.회원매출정보 조회 ㅣ프로그램을 작성한다
</pre>
</section>

<footer>HRDKOREA Copyright@2016 All nights</footer>
</body>
</html>