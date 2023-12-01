<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mylib.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    Class.forName("oracle.jdbc.driver.OracleDriver");
    //3)db접속
    Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");

    String sql="select t1.custno, t2.custname,"; 
    		sql+="decode(t2.grade, 'A','VIP','B','일반','C','직원') grade,sum(t1.price)"; 
    		sql+="from money_tbl_02 t1,member_tbl_02 t2"; 
    		sql+=" where t1.custno=t2.custno"; 
    		sql+=" group by (t1.custno,t2.custname,t2.grade)"; 
    		sql+=" order by sum(t1.price) desc"; 
    
    PreparedStatement ps=conn. prepareStatement(sql);
    ResultSet rs=ps.executeQuery();
    
    %>
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
table{
margin:auto;
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
<p>
<h2>회원목록조회/수정</h2>
<table border="1" width="60%">
<tr>
        <th>회원번호</th>
        <th>회원성명</th>
        <th>고객등급</th>
        <th>매출</th>  
</tr>
 <%while(rs.next()){ %>
 <tr>
        <td><%=rs.getInt(1) %></td>
        <td><%=rs.getString(2) %></td>
        <td><%=rs.getString(3) %></td>
        <td><%=rs.getInt(4)%></td>
       
   </tr>
<%}
 rs.close();ps.close();conn.close();
 %>
</table>

</p>
</section>

<footer>HRDKOREA Copyright@2016 All nights</footer>
</body>
</html>