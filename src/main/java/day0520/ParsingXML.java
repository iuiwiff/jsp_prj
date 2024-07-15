package day0520;

import java.io.File;
import java.io.IOException;
import java.net.URL;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;

public class ParsingXML {
	
	public ParsingXML() throws JDOMException, IOException {
		//1. Builder 생성
		SAXBuilder builder = new SAXBuilder();
		
		//2. XML문서를 Document로 생성하여 얻기
	//	Document doc = builder.build(new File("C:/dev/workspace/jsp_prj/src/main/webapp/day0520/parsing.xml")); //Local
		
		Document doc = builder.build(new URL("http://localhost/jsp_prj/day0520/parsing.xml")); //Web
		
		//3. 최상위 부모노드 얻기
		Element rootNode = doc.getRootElement();
		
		//4. 자식노드 얻기
		Element msgNode = rootNode.getChild("msg");
		Element msg2Node = rootNode.getChild("msg2");
		//System.out.println( doc + " / " + rootNode + msgNode );
		
		//5. parsing
		String msg = msgNode.getValue();
		String msg2 = msg2Node.getValue();
		
		System.out.println( msg );
		System.out.println( msg2 );
	
	}//ParsingXML

	public static void main(String[] args) {
		
		try {
			new ParsingXML();
		} catch (JDOMException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}//main

}//class
