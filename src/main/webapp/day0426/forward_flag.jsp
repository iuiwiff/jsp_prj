<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String serverName=request.getServerName();

	String url="kor.jsp";
	String language="한국어";
	if(!"localhost".equals(serverName)){
		url="eng.jsp";
		language="english";
	}
%>


<jsp:forward page="<%= url %>"/>