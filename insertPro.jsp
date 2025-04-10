<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.swing.text.AbstractDocument.Content"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.*"%>

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
	try{ String sql = "insert into dongeui values(?, ?, ?)";
      PreparedStatement pstmt = con.prepareStatement(sql);
      pstmt.setString(1, id);
      pstmt.setString(2, name);
      pstmt.setString(3, password);
  	ResultSet rs = pstmt.executeQuery();
  	//5. 객체 해제
  	pstmt.close();
	rs.close();
	} catch(SQLException e){
     e.printStackTrace();
	}
	//3. 생성된 연결을 통해 SQL문 실행 의뢰 준비
	//4. SQL 실행
	
	//6. list.jsp로 이동	
	response.sendRedirect("list.jsp");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
</body>
</html>