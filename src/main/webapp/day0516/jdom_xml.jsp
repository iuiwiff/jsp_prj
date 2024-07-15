<%@page import="java.io.FileOutputStream"%>
<%@page import="org.jdom2.output.Format"%>
<%@page import="org.jdom2.output.XMLOutputter"%>
<%@page import="org.jdom2.Element"%>
<%@page import="org.jdom2.Document"%>
<%@ page language="java" contentType="application/xml; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSP에서 XML을 생성하여 출력" trimDirectiveWhitespaces="true"%>
    <%
    //1.XML: 문서객체 생성
    Document doc= new Document();	//<?XML version="1.0" encoding="UTF-8"?>
    
    //2.최상위 부모노드 생성
    Element rootNode= new Element("msgs");	//<msgs>
    
    //3.자식노드 생성
    Element subNode= new Element("msg");	//<msg>
    
    //자식노드가 문자열을 가져야 한다마ㅕㄴ 설정
    subNode.setText("안녕 XML: JDOM2 Parser를 사용한 XML생성");	//<msg>안녕...</msg>
    
    Element subNode2= new Element("msg");
    subNode2.setText("오늘은 목요일 입니다.");//<msg>오늘은...</msg>
    
    //4.자식노드를 부모노드에 배치
    rootNode.addContent(subNode);	//<msgs><msg>안녕...</msg></msgs>
    rootNode.addContent(subNode2);
    
    //5.부모노드를 XML문서 객체 배치
    //System.out.println(subNode);
    doc.addContent(rootNode);
    
    //6.XML문서객체를 출력
    XMLOutputter xOut=new XMLOutputter();
    xOut.setFormat(Format.getPrettyFormat());
    xOut.output(doc, System.out);	//생성된 XML을 console로 출력
    
    FileOutputStream fos=new FileOutputStream("C:/dev/workspace/jsp_prj/src/main/webapp/day0516/hello.xml");
    xOut.output(doc,fos);
    xOut.output(doc,out);	//생성된 XML
    %>

