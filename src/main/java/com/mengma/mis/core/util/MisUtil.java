package com.mengma.mis.core.util;

import java.util.ArrayList;
import java.util.List;

public class MisUtil {
	
	/**
	 * 将数组对象转换成List集合
	 * @param params
	 * @return
	 */
	public static List<String> arrayTransList(String params[]){
		List<String> list = new ArrayList<String>();
		if(params != null){
			for(String param : params){
				list.add(param);
			}
		}
		
		return list;
	}

}
