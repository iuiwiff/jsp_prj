<%@page import="day0520.CreateXML"%>
<%@ page language="java" contentType="application/xml; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
    info=""%>
<%
CreateXML cXML = new CreateXML();
cXML.createDept(2, out);
%>
