package com.min.vo;

import java.io.Serializable;

public class TagVo implements Serializable {

	private static final long serialVersionUID = 6803176712430898707L;
	private String sub_num;
	private String classnumber;
	private String tag;

	public TagVo() {
	}

	public String getSub_num() {
		return sub_num;
	}

	public void setSub_num(String sub_num) {
		this.sub_num = sub_num;
	}

	public String getClassname() {
		return classnumber;
	}

	public void setClassname(String classname) {
		this.classnumber = classname;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	@Override
	public String toString() {
		return "TagVo [sub_num=" + sub_num + ", classname=" + classnumber + ", tag=" + tag + "]";
	}

	public TagVo(String sub_num, String classname, String tag) {
		super();
		this.sub_num = sub_num;
		this.classnumber = classname;
		this.tag = tag;
	}
	


	

}
