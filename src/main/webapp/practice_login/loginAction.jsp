<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Action</title>
<link rel="icon" href="http://192.168.10.230/jsp_prj/common/favicon.ico"/>
<!--bootstrap 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap 끝-->
<!--sist스타일시트 시작--> 
<link rel="stylesheet" href="http://192.168.10.230/jsp_prj/common/css/main.css" type="text/css" media="all" /> 
<link rel="stylesheet" href="http://192.168.10.230/jsp_prj/common/css/board.css" type="text/css" media="all" /> 
<!--sist스타일시트 끝-->

<!--jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->

<style type="text/css">


</style>
<script type="text/javascript">
	$(function() {
		
	});//ready
</script>
</head>
<body>
	<% 
	String userID = request.getParameter("userID");
	String password = request.getParameter("userPassword");
	
	String dbURL = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbUser = "scott";
	String dbPassword = "tiger";
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		//1. 드라이버 로딩
		Class.forName("oracle.jdbc.OracleDriver");
	
		//2. DB연결 얻기
		//3. 쿼리문 생성 객체 얻기
		con = DriverManager.getConnection(dbURL, dbUser, dbPassword);
		
		//4. 쿼리 실행 후 결과 얻기
		String sql = "select * from where userID=? and userPassword=?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, userID);
		pstmt.setString(2, password);
		pstmt.executeQuery();
		
		if(rs.next()) {
			out.println("로그인 성공");
		} else {
			out.println("로그인 실패. 다시 시도해 주세요.");
		}//end if
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
	//5. 연결 끊기
		if(rs != null) {
			try{
				rs.close();
			} catch (SQLException e){
				e.printStackTrace();
			}//end try
		}//end if
		if(pstmt != null) {
			try{
				pstmt.close();
			} catch (SQLException e){
				e.printStackTrace();
			}//end try
		}//end if
		if(con != null) {
			try{
				con.close();
			} catch (SQLException e){
				e.printStackTrace();
			}//end try
		}//end if
	}//end finally
	%>
	
	
</body>
</html>