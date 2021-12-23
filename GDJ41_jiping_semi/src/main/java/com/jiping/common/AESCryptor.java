package com.jiping.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.nio.charset.Charset;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;

public class AESCryptor {
	
	private static SecretKey key;
	private String path;
	
	public AESCryptor() {
		this.path = AESCryptor.class.getResource("./").getPath();
		this.path = path.substring(0,this.path.indexOf("classes"));
		File keyFile = new File(path + "/bslove.bs");
		if(keyFile.exists()) {
			try {
				this.key = (SecretKey)new ObjectInputStream(new FileInputStream(keyFile)).readObject();
			}catch(IOException|ClassNotFoundException e) {
				e.printStackTrace();
			}
		}else {
			getGeneratorKey();
		}
	}
	
	private void getGeneratorKey() {
		
		SecureRandom random = new SecureRandom();
		KeyGenerator keygen = null;
		
		try {
			keygen = KeyGenerator.getInstance("AES");
			keygen.init(128,random);
			this.key = keygen.generateKey();
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		File f = new File(path + "/bslove.bs");
		try(ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(f))) {
			oos.writeObject(this.key);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public static String encrypt(String str) throws InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException {
		
		Cipher cipher = Cipher.getInstance("AES");
		cipher.init(Cipher.ENCRYPT_MODE, AESCryptor.key);
		
		byte[] enctemp = str.getBytes(Charset.forName("utf-8"));
		byte[] encResult = cipher.doFinal(enctemp);
		String strEncode = Base64.getEncoder().encodeToString(encResult);
		
		return strEncode;
	}
	
	public static String decrypt(String encStr) throws InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException {
		Cipher cipher = Cipher.getInstance("AES");
		cipher.init(Cipher.DECRYPT_MODE,AESCryptor.key);
		
		byte[] decodeBase = Base64.getDecoder().decode(encStr.getBytes(Charset.forName("UTF-8")));
		byte[] oriVal = cipher.doFinal(decodeBase);
		
		return new String(oriVal);
	}
}
