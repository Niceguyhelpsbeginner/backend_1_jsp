<%@page import="javax.sql.DataSource"%>
<%@page import="org.mariadb.jdbc.client.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*" %>
<%


request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String name= request.getParameter("name");
String password = request.getParameter("pwd");





Context initCtx = new InitialContext();
Context envCtx = (Context) initCtx.lookup("java:comp/env");
DataSource ds = (DataSource)envCtx.lookup("jdbc/seongjin");
Connection con = ds.getConnection();
	//1. DB 연동 드라이버 로드

	
	//2. 연결 객체 생성


	//3. 생성된 연결을 통해 SQL문 실행 의뢰 준비
	String sql = "UPDATE MEMBER SET NAME=?, PWD=? WHERE ID=?";
	

	
	//4. SQL 실행

	
	//5. 객체 해제

	%>

	<script>
		let ans = alert("변경되었습니다!");
		if (!ans){
			location.href='list.jsp';
		}
	</script>



