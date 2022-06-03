package com.min.vo;

import java.io.Serializable;

public class TagVo implements Serializable {

	private static final long serialVersionUID = 6803176712430898707L;
	private String sub_num;
	private String cla_num;
	private String tag;

	public TagVo() {
	}

	public String getSub_num() {
		return sub_num;
	}

	public void setSub_num(String sub_num) {
		this.sub_num = sub_num;
	}



	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getCla_num() {
		return cla_num;
	}

	public void setCla_num(String cla_num) {
		this.cla_num = cla_num;
	}

	public TagVo(String sub_num, String cla_num, String tag) {
		super();
		this.sub_num = sub_num;
		this.cla_num = cla_num;
		this.tag = tag;
	}

	@Override
	public String toString() {
		return "TagVo [sub_num=" + sub_num + ", cla_num=" + cla_num + ", tag=" + tag + "]";
	}


	


	

}
