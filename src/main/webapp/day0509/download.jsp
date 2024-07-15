<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="application/octet-stream"
    pageEncoding="UTF-8"
    info="파일 다운로드"%>

    <%
    String downloadName=request.getParameter("fileName");
    //2. 응답헤더 변경 (사용자가 선택한 파일의 이름으로 다운로드 파일을 설정)
    //파일명이 한글인 경우 한글파일로 다운로드 되지 않는다. => URL에서 사용할 수 있도록 파일명을 encoding
    response.setHeader("Content-Disposition", "attachment;fileName=" + 
    URLEncoder.encode(downloadName, "UTF-8"));
    //3. 다운로드할 파일에 정보를 얻기
    File file =
    new File("C:/dev/workspace/jsp_prj/src/main/webapp/upload/" + downloadName);
    
    if(file.exists()){
        FileInputStream fis = null; //파일에서 읽기위한 스트림
        OutputStream os = null; //파일을 웹 브라우저로 출력하기 위한 스트림
        try{
        //4.IOStream연결
            fis = new FileInputStream(file.getAbsoluteFile());
        	os = response.getOutputStream();
        	//5. 파일의 내용을 읽어들여 스트림으로 기록
        	byte[] readData = new byte[512];
        	int readSize = 0;
        	
        	while( (readSize = fis.read(readData)) != -1) {
        		os.write(readData, 0, readSize);
        	}//end while
        	
        	//6. 분출
        	os.flush();
        	
        	//7. 출력스트림을 초기화 : HTML을 출력할 스트림이 File을 출력할 수 있게 초기화
        	out.clear();
        	
        	//8. 응답헤더를 다운로드 파일의 정보를 가지도록 재설정
        	out = pageContext.pushBody();
        	
        }finally{
            if(fis != null){fis.close();}
            if(os != null){os.close();}
        }

    }

    
    %>