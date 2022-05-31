package com.min.vo;

public class CouponVo {
	
	private String cou_code	      ;
	private String cou_tra_id     ;
	private String cou_name       ;
	private int cou_per        ;
	private String cou_delflag    ;
	private String cou_date       ;
	public String getCou_code() {
		return cou_code;
	}
	public void setCou_code(String cou_code) {
		this.cou_code = cou_code;
	}
	public String getCou_tra_id() {
		return cou_tra_id;
	}
	public void setCou_tra_id(String cou_tra_id) {
		this.cou_tra_id = cou_tra_id;
	}
	public String getCou_name() {
		return cou_name;
	}
	public void setCou_name(String cou_name) {
		this.cou_name = cou_name;
	}
	public int getCou_per() {
		return cou_per;
	}
	public void setCou_per(int cou_per) {
		this.cou_per = cou_per;
	}
	public String getCou_delflag() {
		return cou_delflag;
	}
	public void setCou_delflag(String cou_delflag) {
		this.cou_delflag = cou_delflag;
	}
	public String getCou_date() {
		return cou_date;
	}
	public void setCou_date(String cou_date) {
		this.cou_date = cou_date;
	}
	@Override
	public String toString() {
		return "CouponVo [cou_code=" + cou_code + ", cou_tra_id=" + cou_tra_id + ", cou_name=" + cou_name + ", cou_per="
				+ cou_per + ", cou_delflag=" + cou_delflag + ", cou_date=" + cou_date + "]";
	}
	public CouponVo(String cou_code, String cou_tra_id, String cou_name, int cou_per, String cou_delflag,
			String cou_date) {
		super();
		this.cou_code = cou_code;
		this.cou_tra_id = cou_tra_id;
		this.cou_name = cou_name;
		this.cou_per = cou_per;
		this.cou_delflag = cou_delflag;
		this.cou_date = cou_date;
	}
	public CouponVo() {
		super();
	}
	
	
	
	
}
