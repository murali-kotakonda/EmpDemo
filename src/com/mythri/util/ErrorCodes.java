package com.mythri.util;

public enum ErrorCodes {
	//common places for all error codes
	ERROR1("Error1","age is invalid."),
	ERROR2("Error2","LoginName already exists."),
	ERROR3("Error3","Name doesnt exists."),
	ERROR4("Error4","There are existing employess for the department Id."),
	ERROR5("Error5","You have exceded Maximum no of attempts.Please contact Admin"),
	ERROR6("Error6","Your account is inActive.Please contact Admin."),
	ERROR7("Error7","Invalid Login.");
	
	private String errorCode;
	private String desc;
	
	private ErrorCodes(String errorCode, String desc) {
		this.errorCode = errorCode;
		this.desc = desc;
	}

	public String getErrorCode() {
		return errorCode;
	}

	public String getDesc() {
		return desc;
	}
}
