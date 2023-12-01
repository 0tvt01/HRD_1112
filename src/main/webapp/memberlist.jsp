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
    String sql="select * from member_tbl_02";
    PreparedStatement ps=conn. prepareStatement(sql);
    ResultSet rs=ps.executeQuery();
    List<Member> list=new ArrayList<Member>();
    while(rs.next()){
    	Member member=new Member();
    	member.setCustno(rs.getInt("custno"));
    	member.setCustname(rs.getString("custname"));
    	member.setPhone(rs.getString("phone"));
    	member.setAddress(rs.getString("address"));
    	member.setJoindate(rs.getDate("joindate"));
    	member.setGrade(rs.getString("grade"));
    	member.setCity(rs.getString("city"));
    	list.add(member);
    	
    }
    rs.close();ps.close();conn.close();
    
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
        <th>전화번호</th>
        <th>주소</th>
        <th>가입일자</th>
        <th>고객등급</th>
        <th>거주지역</th>  
</tr>
 <%for(Member m:list){ %>
 <tr>
        <td><a href="update.jsp?custno=<%=m.getCustno()%>"><%=m.getCustno() %></a></td>
        <td><%=m.getCustname() %></td>
        <td><%=m.getPhone() %></td>
        <td><%=m.getAddress() %></td>
        <%
           SimpleDateFormat sdf=new SimpleDateFormat("yyyy년MM월dd일");
        
        %>
        <td><%=sdf.format(m.getJoindate()) %></td>
        <%-- <td><%=m.getJoindate() %></td> --%>
     <%--   // <td><%=(m.getGrade().charAt(0)=='A'?"VIP":"일반") %></td> --%>
           <td><%=(m.getGrade().equals("A")?"VIP":m.getGrade().equals("B")?"직원":"일반") %></td>
        <td><%=m.getCity() %></td>
   </tr>
<%} %>
</table>

</p>
</section>

<footer>HRDKOREA Copyright@2016 All nights</footer>
</body>
</html>