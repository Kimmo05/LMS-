package com.min.vo;

public class UseDiscountVo {
	private int use_seq         ;
	private String use_pay_num     ;
	private String use_date        ;
	private String use_coupon      ;
	private int use_milage      ;
	private String use_tra_id      ;
	public int getUse_seq() {
		return use_seq;
	}
	public void setUse_seq(int use_seq) {
		this.use_seq = use_seq;
	}
	public String getUse_pay_num() {
		return use_pay_num;
	}
	public void setUse_pay_num(String use_pay_num) {
		this.use_pay_num = use_pay_num;
	}
	public String getUse_date() {
		return use_date;
	}
	public void setUse_date(String use_date) {
		this.use_date = use_date;
	}
	public String getUse_coupon() {
		return use_coupon;
	}
	public void setUse_coupon(String use_coupon) {
		this.use_coupon = use_coupon;
	}
	public int getUse_milage() {
		return use_milage;
	}
	public void setUse_milage(int use_milage) {
		this.use_milage = use_milage;
	}
	public String getUse_tra_id() {
		return use_tra_id;
	}
	public void setUse_tra_id(String use_tra_id) {
		this.use_tra_id = use_tra_id;
	}
	public UseDiscountVo(int use_seq, String use_pay_num, String use_date, String use_coupon, int use_milage,
			String use_tra_id) {
		super();
		this.use_seq = use_seq;
		this.use_pay_num = use_pay_num;
		this.use_date = use_date;
		this.use_coupon = use_coupon;
		this.use_milage = use_milage;
		this.use_tra_id = use_tra_id;
	}
	public UseDiscountVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "UseDiscountVo [use_seq=" + use_seq + ", use_pay_num=" + use_pay_num + ", use_date=" + use_date
				+ ", use_coupon=" + use_coupon + ", use_milage=" + use_milage + ", use_tra_id=" + use_tra_id + "]";
	}
	
	
}
