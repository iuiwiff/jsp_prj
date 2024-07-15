<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.member.ProfileVO"%>
<%@page import="kr.co.sist.user.member.ProfileDAO"%>
<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="파일 업로드"%>
    
 <% 
 	JSONObject jsonObj = new JSONObject();
 	jsonObj.put("result", false);
 	jsonObj.put("msg", "올바르지 않은 요청방식");
 	if("POST".equals( request.getMethod() )) {
	 
 		File uploadDir = new File("C:/dev/workspace/jsp_prj/src/main/webapp/upload");
 		int maxSize = 1024*1024*30;
 		try {
 		MultipartRequest mr = new MultipartRequest(request, uploadDir.getAbsolutePath(),
 				maxSize, "UTF-8", new DefaultFileRenamePolicy());
 		
 		String fileName = mr.getFilesystemName("profileImg");
 		File uploadFile = new File(uploadDir.getAbsolutePath() + "/" + fileName);
 		
 		boolean flag = false;
 		int blockSize = 1024*1024*5; //5Mbyte인 파일만 처리
 		if( uploadFile.length() > blockSize ) {
 			uploadFile.delete();
 			flag = true;
 		}//end if
 		
 		String id = mr.getParameter("id"); //세션으로 대치
 		
 		ProfileDAO pDAO = ProfileDAO.getInstance();
 		
 		ProfileVO pVO = new ProfileVO(id, fileName, "");
 		int cnt = pDAO.updateImg(pVO);
 		jsonObj.put("result", cnt == 1);
 		jsonObj.put("msg", "이미지 업로드 성공");
 		jsonObj.put("fileName", fileName);
 		
 		}catch(IOException | SQLException ie) {
 			ie.printStackTrace();
 		}
 		
 	}//end if
 
 %><%= jsonObj.toJSONString() %>
    
