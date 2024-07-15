<%@page import="java.util.Iterator" %>
<%@page import="java.util.Set" %>
<%@page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<ul></ul>
	<%
	Map<String, String> map = System.getenv();
	Set<String> key = map.keySet();
	
	Iterator<String> ita = key.iterator();
	
	String tempKey = "";
	while(ita.hasNext()) {
		tempKey = ita.next();
	%>
	<li><%=tempKey %> : <%=System.getenv(tempKey) %></li>
	<%
	}
	%>
</ul>