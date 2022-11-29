<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%!// 변수 선언
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String uid = "stsboot";
	String pwd = "7777";
	String url = "jdbc:oracle:thin:@11.11.11.33:1521:ORCL";
	String sql = "select * from emp";%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC를 이용한 데이터베이스 테이블 만들기</title>
</head>
<body>
	<%
		try {
		// 데이터베이스를 접속하기 위한 드라이버 SW 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		// 데이터베이스에 연결하는 작업 수행
		conn = DriverManager.getConnection(url, uid, pwd);
		// 쿼리를 생성gkf 객체 생성
		stmt = conn.createStatement();
		// 쿼리 생성
		rs = stmt.executeQuery(sql);
	%>
	<table border="1">
		<tr>
			<td>1</td>
			<td>2</td>
			<td>3</td>
			<td>4</td>
		</tr>
		<%
			while (rs.next()) {
				String myname = rs.getString("ENAME");
				if(myname.equals("KING")){
					for(int i=0; i<4; i++){	
		%>
		<tr>
			<td><%=rs.getString("EMPNO")%></td>
			<td><%=rs.getString("ENAME")%></td>
			<td><%=rs.getString("JOB")%></td>
			<td><%=rs.getString("MGR")%></td>
		</tr>
		<%}}
		%>
		<tr>
			<td><%=rs.getString("EMPNO")%></td>
			<td><%=rs.getString("ENAME")%></td>
			<td><%=rs.getString("JOB")%></td>
			<td><%=rs.getString("MGR")%></td>
		</tr>
	<%
		}
	} catch (Exception e) {
	e.printStackTrace();
	} finally {
	try {
	if (rs != null) {
		rs.close();
	}
	if (stmt != null) {
		stmt.close();
	}
	if (conn != null) {
		conn.close();
	}
	} catch (Exception e) {
	e.printStackTrace();
	}
	}
	%>
	</table>
</body>
</html>