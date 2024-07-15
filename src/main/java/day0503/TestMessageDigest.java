package day0503;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.tomcat.util.codec.binary.Base64;

import kr.co.sist.util.cipher.DataDecrypt;
import kr.co.sist.util.cipher.DataEncrypt;

public class TestMessageDigest {

	public static void main(String[] args) throws GeneralSecurityException {
		String msg = "1234"; //Plain Text
		
		try {
			//1. MessageDigest 생성
			MessageDigest md = MessageDigest.getInstance("MD5");
			//2. 암호화 알고리즘에 의한 암호화 수행
			md.update(msg.getBytes());
			
			byte[] temp=md.digest();
			System.out.println(new String( temp )); //사람이 알아 볼 수 없다. => encoding
			Base64 base = new Base64();
			String cipherText = new String( base.encode(temp) ); //사람이 알아볼 수 있는 8859_1로 생성
			System.out.println(cipherText);
			
			//sist_util 패키지에서 제공하는 암호화 사용
			String p_t = "test";
			String c_t = DataEncrypt.messageDigest("MD5", p_t);
			System.out.println("일반문자열 : " + p_t);
			System.out.println("암호화문자열 : " + c_t);
			
			//복호화가 가능한 암호화
			String name="김동섭";
			String key="gdyb21LQTcIANtvYMT7QVQ==";
			
			//암호화
			DataEncrypt de = new DataEncrypt(key);
			String encryptText = de.encryption(name);
			System.out.println("암호화 문자열 : " + encryptText);
			
			//복호화
			DataDecrypt dd = new DataDecrypt(key);
			String decryptText = dd.decryption(encryptText);
			System.out.println("복호화 문자열 : " + decryptText);
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
}
