package com.mengma.mis.core.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import java.net.InetAddress;

/**
 * @author ouyw
 *
 */
public class NetworkUtil {
	
	private static final Logger log = LoggerFactory.getLogger(NetworkUtil.class);

	/**
	 * 获取用户访问的IP
	 * @param request
	 * @return
	 */
	public static String getUserIp(HttpServletRequest request){
		if (request == null) {
            return null;
        }
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
            ip = request.getRemoteAddr();
        }
        return ip;
	}
	
	/**
	 * 返回主机名
	 * @return
	 */
	public static String getHostName(){
		InetAddress a;
        try {
            a = InetAddress.getLocalHost();
            return a.getHostName();
        } catch (Exception e) {
            MisLog.error(log,e.getMessage(),e);
        }
        return null;
	}
	
	/**
	 * 返回用户使用的操作系统
	 * @param request
	 * @return
	 */
	public static String getOsName(HttpServletRequest request){
		String userAgent = request.getHeader("user-agent").toLowerCase();
		String result = "";
    	if (userAgent.contains("windows")){
    		if (userAgent.contains("windows nt 6.4") ||
    				userAgent.contains("windows nt 10.0") || 
    				userAgent.contains("windows nt 10")){//Windows 10
    			result = "Windows 10";
    		} else if (userAgent.contains("windows nt 6.3")){//Windows 8.1
    			result = "Windows 8.1";
    		} else if (userAgent.contains("windows nt 6.2")){//Windows 8
				result = "Windows 8";
			} else if (userAgent.contains("windows nt 6.1")){//Windows 7
				result = "Windows 7";
			} else if (userAgent.contains("windows nt 6.0")){//Windows Vista
				result = "Windows Vista";
			} else if (userAgent.contains("windows nt 5.2")){//Windows XP x64 Edition
				result = "Windows XP x64 Edition";
			} else if (userAgent.contains("windows nt 5.1")){//Windows XP
				result = "Windows XP";
			} else if (userAgent.contains("windows nt 5.01")){//Windows 2000, Service Pack 1 (SP1)
				result = "Windows 2000 SP1";
			} else if (userAgent.contains("windows nt 5.0")){//Windows 2000
				result = "Windows 2000";
			} else if (userAgent.contains("windows nt 4.0")){//Microsoft Windows NT 4.0
				result = "Windows NT 4.0";
			} else if (userAgent.contains("windows 98; win 9x 4.90")){//Windows Millennium Edition (Windows Me)
				result = "Windows ME";
			} else if (userAgent.contains("windows 98")){//Windows 98
				result = "Windows 98";
			} else if (userAgent.contains("windows 95")){//Windows 95
				result = "Windows 95";
			} else if (userAgent.contains("windows ce")){//Windows CE
				result = "Windows CE";
			} 
		} else if (userAgent.contains("mac os x")){
			result = "MAC iPod";
		} else {
			result = "unknown OS";
		}
    	return result;
	}

}
