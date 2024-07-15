<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="외부 라이브러리를 사용한 JSON"%>

<%
String name = "박시현";
int age = 20;
//1. JSONObject 생성
JSONObject jsonObj = new JSONObject();
//2. 값 할당
jsonObj.put("name", name);
jsonObj.put("age", age);
jsonObj.put("addr", "서울시 강남구 역삼동");
//3. 문자열 반환

String str = jsonObj.toJSONString(); //Map은 값이 순서대로 들어가지 않는다.
%>

<%=str %>

