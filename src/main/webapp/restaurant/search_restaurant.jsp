<%@page import="java.util.Date"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.co.sist.user.restaurant.RestaurantVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="day0510.RestaurantDAO"%>
<%@ page language="java" contentType="application/json"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
    info="식당조회"%>
<%
	RestaurantDAO rDAO = RestaurantDAO.getInstance();
	JSONObject jsonObj = new JSONObject();
	try {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss EEEE");
		List<RestaurantVO> list = rDAO.selectAllRestaurant();
		jsonObj.put("resultFlag", true);
		jsonObj.put("dataSize", list.size());
		jsonObj.put("putDate", sdf.format(new Date()));
		
		JSONArray jsonArr = new JSONArray();
		JSONObject jsonTemp = null;
		
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for(RestaurantVO rVO : list) {
			//조회값이 존재하면 JSONObject 생성하여 값을 넣고
			jsonTemp = new JSONObject(); //{   }
			jsonTemp.put("name", rVO.getName()); // name: ~~~
			jsonTemp.put("menu", rVO.getMenu()); // menu: ~~~
			jsonTemp.put("lat", rVO.getLat()); // lat: ~~~
			jsonTemp.put("lng", rVO.getLng()); // lng: ~~~
			jsonTemp.put("date", sdf2.format(rVO.getInput_date())); // date: ~~~
			
			//값을 가진 JSONObject을 JSONArray에 추가
			jsonArr.add(jsonTemp);
		}//end for
		
		//모든 값을 가진 jsonArr를 JSONObject를 추가
		jsonObj.put("data", jsonArr);
		
	} catch(SQLException se) {
		jsonObj.put("resultFlag", false);
		se.printStackTrace();
	}//end catch

%>
<%= jsonObj.toJSONString() %>