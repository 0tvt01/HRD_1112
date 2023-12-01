<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
int custno = Integer.parseInt(request.getParameter("custno"));
String custname = request.getParameter("custname");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String joindate = request.getParameter("joindate");
String grade = request.getParameter("grade");
String city = request.getParameter("city");

Class.forName("oracle.jdbc.driver.OracleDriver");
// 3) DB 접속
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

// Update 쿼리
String sql = "update member_tbl_02 set custname=?, phone=?, address=?, joindate=?, grade=?, city=? where custno=?";
PreparedStatement ps = conn.prepareStatement(sql);
ps.setString(1, custname);
ps.setString(2, phone);
ps.setString(3, address);
ps.setString(4, joindate);
ps.setString(5, grade);
ps.setString(6, city);
ps.setInt(7, custno);

// Update 실행
ps.executeUpdate();

ps.close();
conn.close();
%>
<script>
    alert("회원정보가 성공적으로 업데이트되었습니다.");
    location.href = "index.jsp";
</script>
