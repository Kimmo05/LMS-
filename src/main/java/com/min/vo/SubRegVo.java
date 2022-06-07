package com.min.vo;

public class SubRegVo {
	
	/*
	 * SUB_REGISTER TABLE Vo
	 * reg_code 등록자 코드
	 * reg_auth 등록자 권한
	 * reg_id 등록자 ID
	 */
	private String reg_code;
	private String reg_auth;
	private String reg_id;
	public String getReg_code() {
		return reg_code;
	}
	public void setReg_code(String reg_code) {
		this.reg_code = reg_code;
	}
	public String getReg_auth() {
		return reg_auth;
	}
	public void setReg_auth(String reg_auth) {
		this.reg_auth = reg_auth;
	}
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public SubRegVo(String reg_code, String reg_auth, String reg_id) {
		super();
		this.reg_code = reg_code;
		this.reg_auth = reg_auth;
		this.reg_id = reg_id;
	}
	public SubRegVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "SubRegVo [reg_code=" + reg_code + ", reg_auth=" + reg_auth + ", reg_id=" + reg_id + "]";
	}
	
	

}
