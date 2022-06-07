package com.min.vo;

import java.io.Serializable;

public class SubjectCodeVo implements Serializable {

	private static final long serialVersionUID = -8972094465876216589L;
	private String cod_code;
	private String cod_name;
	private String cod_tag;
	public String getCod_code() {
		return cod_code;
	}
	public void setCod_code(String cod_code) {
		this.cod_code = cod_code;
	}
	public String getCod_name() {
		return cod_name;
	}
	public void setCod_name(String cod_name) {
		this.cod_name = cod_name;
	}
	public String getCod_tag() {
		return cod_tag;
	}
	public void setCod_tag(String cod_tag) {
		this.cod_tag = cod_tag;
	}
	@Override
	public String toString() {
		return "SubjectCodeVo [cod_code=" + cod_code + ", cod_name=" + cod_name + ", cod_tag=" + cod_tag + "]";
	}
	public SubjectCodeVo(String cod_code, String cod_name, String cod_tag) {
		super();
		this.cod_code = cod_code;
		this.cod_name = cod_name;
		this.cod_tag = cod_tag;
	}
	public SubjectCodeVo() {
	}
	
}
