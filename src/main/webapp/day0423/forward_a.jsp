<%@page import="day0423.UrlVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info = "업무로직만 정의하는 JSP"%>
	<%
	//0. DB코드, 업무코드를 정의
	String name = "정명호";
	UrlVO[] data = { new UrlVO("1", "http://java.sun.com", "자바를 다운 받을 수 있는 URL"),
			new UrlVO("2", "http://oracle.com", "오라클을 다운 받을 수 있는 URL"),
			new UrlVO("3", "http://jquery.com", "jQuery library를 다운 받을 수 있음"),
			new UrlVO("4", "http://java.sun.com", "자바를 다운 받을 수 있는 URL")
	};
	//1. 업무처리 결과를 scope객체 할당 ( 디자인이 적용된 페이지에서 보여주기 위해)
	request.setAttribute("name", name);
	request.setAttribute("urlArr", data);
	
	//2. 이동할 페이지(view페이지) URI설정
	RequestDispatcher rd = request.getRequestDispatcher("forward_b.jsp");
	
	//3. 이동
	rd.forward(request, response);
	%>
		이쁜 디자인
		
</div>
</body>
</html>