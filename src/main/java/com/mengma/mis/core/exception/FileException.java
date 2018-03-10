package com.mengma.mis.core.exception;


import com.mengma.mis.core.constant.GlobalCodeConstant;

public class FileException extends BaseException{
private static final long serialVersionUID = 12323456632098678L;
	
	public Integer getErrorCode(){
		return GlobalCodeConstant.FILE_ERROR_CODE;
	}

    public String getErrorMsg(){
        return GlobalCodeConstant.FILE_ERROR_CODE_NAME;
    }

    public FileException(){
        super();
    }

    public FileException(String msg,Throwable e){
        super(msg,e);
    }

    public FileException(String msg){
        super(msg);
    }

    public FileException(Throwable e){
        super(e);
    }

}
