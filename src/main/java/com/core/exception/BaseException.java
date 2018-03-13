package com.core.exception;


import com.core.constant.GlobalCodeConstant;

public class BaseException extends RuntimeException {
	
	private static final long serialVersionUID = 1123243567654L;
	
	public Integer getErrorCode(){
		return GlobalCodeConstant.BASE_ERROR_CODE;
	}

    public String getErrorMsg(){
        return GlobalCodeConstant.BASE_ERROR_CODE_NAME;
    }

    public BaseException(){
        super();
    }

    public BaseException(String msg,Throwable e){
        super(msg,e);
    }

    public BaseException(String msg){
        super(msg);
    }

    public BaseException(Throwable e){
        super(e);
    }

}
