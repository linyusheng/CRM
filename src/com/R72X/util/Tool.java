package com.R72X.util;

import java.security.MessageDigest;
import java.util.Random;

public class Tool {
	/**
	 * 获取num位的帐号
	 */
	public static String getAccount(double num){
		Random random=new Random();
		int bigin=(int)Math.pow(10.0, num-1);
		String account=""+(bigin+random.nextInt((int)bigin*9));
		
		return account;
	}
	
	/**
	 * 用MD5加密一个字符串
	 */
	public static String getMD5String(String input){		
		MessageDigest md5;
		String inStr=input;
		
		try{
			md5=MessageDigest.getInstance("MD5");			
		}
		catch(Exception e){
			System.out.print(e.toString());
			e.printStackTrace();
			return null;
		}
		
		char[] charArray=inStr.toCharArray();
		byte[] byteArray=new byte[charArray.length];
		for(int i=0;i<charArray.length;i++){
			byteArray[i]=(byte)charArray[i];
		}
		byte[] md5Bytes=md5.digest(byteArray);
		
		StringBuffer hexValue=new StringBuffer();
		
		for(int i=0;i<md5Bytes.length;i++){
			int val=((int)md5Bytes[i])&0xff;
			if(val<16)hexValue.append("0");
			hexValue.append(Integer.toHexString(val));
		}
		
		return hexValue.toString();		
	}
}
