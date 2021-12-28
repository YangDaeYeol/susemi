package com.jiping.common;

public class StringCustomUtils {
	public static String getStringOrNull(String param) {
		if(null == param || "".equals(param.trim())) {
			return null;
		}
		return param;
	}
	
	public static Integer getIntOrNull(String param) {
		int result = 0;
		if(null == param || "".equals(param.trim())){
			return result;
		}
			
		result = Integer.parseInt(param);
		return result;
	}
}
