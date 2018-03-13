package com.core.exception;


import com.core.constant.GlobalCodeConstant;

public class UpdateException extends BaseException {

	private static final long serialVersionUID = -3917545404811010530L;
	
	public Integer getErrorCode(){
		return GlobalCodeConstant.UPDATE_ERROR_CODE;
	}

    public String getErrorMsg(){
        return GlobalCodeConstant.UPDATE_ERROR_CODE_NAME;
    }

    public UpdateException(){
        super();
    }

    public UpdateException(String msg,Throwable e){
        super(msg,e);
    }

    public UpdateException(String msg){
        super(msg);
    }

    public UpdateException(Throwable e){
        super(e);
    }

}
