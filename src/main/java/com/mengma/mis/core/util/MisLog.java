package com.mengma.mis.core.util;

import org.slf4j.Logger;

public class MisLog {
	
	public MisLog(){
		super();
	}
	
	public static void debug(Logger log, String message) {
        if(log.isDebugEnabled()){
            log.debug(message);
        }
    }

    public static void warn(Logger log,String message) {
        if(log.isWarnEnabled()){
            log.warn(message);
        }
    }

    public static void info(Logger log,String message) {
        if(log.isInfoEnabled()){
            log.info(message);
        }
    }

    public static void error(Logger log,String message) {
        if(log.isErrorEnabled()){
            log.error(message);
        }
    }

    public static void error(Logger log,String message,Exception e) {
        if(log.isErrorEnabled()){
            log.error(message + e.getMessage(),e);
        }
    }
}
