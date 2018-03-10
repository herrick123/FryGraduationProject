package com.mengma.mis.core.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * MD5加码 生成32位md5码 
 * @author 黄青山
 *
 */
public class MD5Util {
	private static final Logger log = LoggerFactory.getLogger(MD5Util.class);
    public static String string2MD5(String password){  
    	String result = password;
    	try {  
            // 1,获取MD5摘要算法的MessageDigest对象  
            MessageDigest instance = MessageDigest.getInstance("MD5");  
            // 2,对字符串加密,返回字节数组  
            byte[] digest = instance.digest(password.getBytes());  
            StringBuffer sb = new StringBuffer();  
            for (byte b : digest) {  
                // 3,获取字节的低八位有效值  
                int i = b & 0xff;  
                // 4,将整数转为16进制  
                String hexString = Integer.toHexString(i);  
                // 5,如果是1位的话,补0  
                if (hexString.length() < 2) {  
                    hexString = "0" + hexString;  
                }  
                // 6,把密文添加到缓存中  
                sb.append(hexString);  
                result = sb.toString();
            }  
            } catch (NoSuchAlgorithmException e) {  
            	MisLog.error(log, "加密失败",e);
            }  
    	return result;
    }  
}
