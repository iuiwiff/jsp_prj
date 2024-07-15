<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.board.BoardDAO"%>
<%@page import="kr.co.sist.user.board.BoardDomain"%>
<%@page import="kr.co.sist.user.board.SearchVO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSONArray"%>
<%
//1. 데이터와 부가적인 정보를 저장할 JSONObject 생성
JSONObject jsonObj = new JSONObject();

//2. 부가적인 정보를 추가
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");
jsonObj.put("pubDate", sdf.format(new Date())); //언제 만들어졌는지
jsonObj.put("producer", "박시현"); //누가

//3. 데이터를 추가하기 위한 JSONArray 생성
JSONArray jsonArr = new JSONArray();

//board테이블에 검색 결과를 JSONOject에 저장하고 > JSONObject을 JSONArray에 추가
SearchVO sVO = new SearchVO();
sVO.setField("0");
sVO.setKeyword("오늘"); //검색 키워드
sVO.setStartNum(1);
sVO.setEndNum(20);
BoardDAO bDAO = BoardDAO.getInstance();
try {
	List<BoardDomain> list = bDAO.selectBoard(sVO);
	JSONObject jsonTemp = null;
	//4. JSONArray에 값 설정
	for( BoardDomain bVO : list) {
		//JSONObject 생성
		jsonTemp = new JSONObject();
		//JSONObject 값 할당
		jsonTemp.put("num", bVO.getNum());
		jsonTemp.put("title", bVO.getTitle());
		jsonTemp.put("id", bVO.getId());
		jsonTemp.put("cnt", bVO.getCnt());
		//JSONObject을 JSONArray 추가
		jsonArr.add(jsonTemp);
	}//end for
	/////////////////부가적인 정보//////////////////////
	jsonObj.put("result", "SUCCESS");
	jsonObj.put("dataSize", list.size());
	/////////////////사용하기 위한 데이터////////////////
	jsonObj.put("data", jsonArr);
	
} catch(SQLException se) {
	jsonObj.put("result", "FAIL");
	se.printStackTrace();
}//end catch

//4. 문자열로 받기
String jsonStr = jsonObj.toJSONString();
%>
<%= jsonStr %>
