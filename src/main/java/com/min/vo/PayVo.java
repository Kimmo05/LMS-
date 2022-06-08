package com.min.vo;

public class PayVo {
	
	private String pay_num            ;
	private String pay_tra_buyer      ;
	private String pay_cla_num        ;
	private int pay_price          ;
	private String pay_method         ;
	private String pay_pg             ;
	private String pay_status         ;
	private String pay_date           ;
	private String pay_content        ;
	private int pay_raw            ;
	private int pay_discount       ;
	private String pay_candate        ;
	private String pay_cancate        ;
	private String pay_cancontent     ;
	private String pay_ucounum        ;
	private int pay_umilage        ;
	public String getPay_num() {
		return pay_num;
	}
	public void setPay_num(String pay_num) {
		this.pay_num = pay_num;
	}
	public String getPay_tra_buyer() {
		return pay_tra_buyer;
	}
	public void setPay_tra_buyer(String pay_tra_buyer) {
		this.pay_tra_buyer = pay_tra_buyer;
	}
	public String getPay_cla_num() {
		return pay_cla_num;
	}
	public void setPay_cla_num(String pay_cla_num) {
		this.pay_cla_num = pay_cla_num;
	}
	public int getPay_price() {
		return pay_price;
	}
	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	public String getPay_pg() {
		return pay_pg;
	}
	public void setPay_pg(String pay_pg) {
		this.pay_pg = pay_pg;
	}
	public String getPay_status() {
		return pay_status;
	}
	public void setPay_status(String pay_status) {
		this.pay_status = pay_status;
	}
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	public String getPay_content() {
		return pay_content;
	}
	public void setPay_content(String pay_content) {
		this.pay_content = pay_content;
	}
	public int getPay_raw() {
		return pay_raw;
	}
	public void setPay_raw(int pay_raw) {
		this.pay_raw = pay_raw;
	}
	public int getPay_discount() {
		return pay_discount;
	}
	public void setPay_discount(int pay_discount) {
		this.pay_discount = pay_discount;
	}
	public String getPay_candate() {
		return pay_candate;
	}
	public void setPay_candate(String pay_candate) {
		this.pay_candate = pay_candate;
	}
	public String getPay_cancate() {
		return pay_cancate;
	}
	public void setPay_cancate(String pay_cancate) {
		this.pay_cancate = pay_cancate;
	}
	public String getPay_cancontent() {
		return pay_cancontent;
	}
	public void setPay_cancontent(String pay_cancontent) {
		this.pay_cancontent = pay_cancontent;
	}
	public String getPay_ucounum() {
		return pay_ucounum;
	}
	public void setPay_ucounum(String pay_ucounum) {
		this.pay_ucounum = pay_ucounum;
	}
	public int getPay_umilage() {
		return pay_umilage;
	}
	public void setPay_umilage(int pay_umilage) {
		this.pay_umilage = pay_umilage;
	}
	@Override
	public String toString() {
		return "PayVo [pay_num=" + pay_num + ", pay_tra_buyer=" + pay_tra_buyer + ", pay_cla_num=" + pay_cla_num
				+ ", pay_price=" + pay_price + ", pay_method=" + pay_method + ", pay_pg=" + pay_pg + ", pay_status="
				+ pay_status + ", pay_date=" + pay_date + ", pay_content=" + pay_content + ", pay_raw=" + pay_raw
				+ ", pay_discount=" + pay_discount + ", pay_candate=" + pay_candate + ", pay_cancate=" + pay_cancate
				+ ", pay_cancontent=" + pay_cancontent + ", pay_ucounum=" + pay_ucounum + ", pay_umilage=" + pay_umilage
				+ "]";
	}
	public PayVo(String pay_num, String pay_tra_buyer, String pay_cla_num, int pay_price, String pay_method,
			String pay_pg, String pay_status, String pay_date, String pay_content, int pay_raw, int pay_discount,
			String pay_candate, String pay_cancate, String pay_cancontent, String pay_ucounum, int pay_umilage) {
		super();
		this.pay_num = pay_num;
		this.pay_tra_buyer = pay_tra_buyer;
		this.pay_cla_num = pay_cla_num;
		this.pay_price = pay_price;
		this.pay_method = pay_method;
		this.pay_pg = pay_pg;
		this.pay_status = pay_status;
		this.pay_date = pay_date;
		this.pay_content = pay_content;
		this.pay_raw = pay_raw;
		this.pay_discount = pay_discount;
		this.pay_candate = pay_candate;
		this.pay_cancate = pay_cancate;
		this.pay_cancontent = pay_cancontent;
		this.pay_ucounum = pay_ucounum;
		this.pay_umilage = pay_umilage;
	}
	public PayVo() {
		super();
	}
	
	
}
