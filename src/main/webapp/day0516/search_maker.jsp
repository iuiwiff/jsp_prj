<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.car.CarDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%
JSONObject jsonObj = new JSONObject();
jsonObj.put("result", false);

String country = request.getParameter("country");
if (country == null) {
	country = "국산";
}else{
	if("1".equals(country)){
		country = "국산";	
	}else{
		country = "수입";
	}//end else
}//end if

CarDAO cDAO = CarDAO.getInstance();

try {
//cDAO.selectMaker(country);
	List<String> list = cDAO.selectMaker(country);
	jsonObj.put("result", true);

	JSONArray jsonArr = new JSONArray();
	JSONObject jsonTemp = null;
	for (String maker : list) {
		jsonTemp = new JSONObject();
		jsonTemp.put("maker", maker);
		jsonArr.add(jsonTemp);
	}//end for
	jsonObj.put("data", jsonArr);
	jsonObj.put("dataSize", list.size());
} catch (SQLException se) {
	se.printStackTrace();
}
%><%=jsonObj %>