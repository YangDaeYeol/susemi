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
			String encPw = getSHA512(oriPw);
			return encPw;
		}else {
			return super.getParameter(name);
		}
	}
	
	private String getSHA512(String oriPw) {
		String encPwd = ""; 
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
