package com.jiping.common.filter;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class PasswordEncryptorWrapper extends HttpServletRequestWrapper {

	public PasswordEncryptorWrapper(HttpServletRequest request) {
		super(request);
	}
	
	@Override
	public String getParameter(String name) {
		if(name.equals("password")||name.equals("password_new")) {
			String oriPw = super.getParameter(name);
			System.out.println(oriPw);
			String encPw = getSHA512(oriPw);
			System.out.println(encPw);
			return encPw;
		}else {
			return super.getParameter(name); //원본값을 반환
		}
	}
	
	private String getSHA512(String oriPw) {
		String encPwd = ""; //암호화된 문자열값 저장 변수
		MessageDigest md = null;
		
		try {
			md = MessageDigest.getInstance("SHA-512");
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		byte[] oribyte = oriPw.getBytes(Charset.forName("utf-8"));
		md.update(oribyte);
		
		encPwd = Base64.getEncoder().encodeToString(md.digest());
		
		return encPwd;
	}
}
