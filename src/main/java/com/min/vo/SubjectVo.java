package com.min.vo;

public class SubjectVo {
	

	/*
	 * Subject Table Vo
	 * sub_num 과목 번호      
	 * sub_title 과목명
	 * sub_content 과목설명
	 * sub_keyword 과목키워드
	 * sub_cod_code 과목 카테고리코드
	 * sub_tag 과목태그
	 * sub_reg_code 과목 등록자코드
	 * sub_reg_id 과목 등록자ID
	 * sub_ins 과목 담당강사
	 * sub_regdate 과목 등록일
	 * sub_score 과목 평점
	 * sub_status 과목 승인상태
	 * sub_rejection 과목 반려사유
	 */
	private String sub_num;
	private String sub_title;
	private String sub_content;
	private String sub_keyword;
	private String sub_cod_code;
	private String sub_tag;
	private String sub_reg_code;
	private String sub_reg_id;
	private String sub_ins;
	private String sub_regdate;
	private String sub_score;
	private String sub_status;
	private String sub_rejection;
	public String getSub_num() {
		return sub_num;
	}
	public void setSub_num(String sub_num) {
		this.sub_num = sub_num;
	}
	public String getSub_title() {
		return sub_title;
	}
	public void setSub_title(String sub_title) {
		this.sub_title = sub_title;
	}
	public String getSub_content() {
		return sub_content;
	}
	public void setSub_content(String sub_content) {
		this.sub_content = sub_content;
	}
	public String getSub_keyword() {
		return sub_keyword;
	}
	public void setSub_keyword(String sub_keyword) {
		this.sub_keyword = sub_keyword;
	}
	public String getSub_cod_code() {
		return sub_cod_code;
	}
	public void setSub_cod_code(String sub_cod_code) {
		this.sub_cod_code = sub_cod_code;
	}
	public String getSub_tag() {
		return sub_tag;
	}
	public void setSub_tag(String sub_tag) {
		this.sub_tag = sub_tag;
	}
	public String getSub_reg_code() {
		return sub_reg_code;
	}
	public void setSub_reg_code(String sub_reg_code) {
		this.sub_reg_code = sub_reg_code;
	}
	public String getSub_reg_id() {
		return sub_reg_id;
	}
	public void setSub_reg_id(String sub_reg_id) {
		this.sub_reg_id = sub_reg_id;
	}
	public String getSub_ins() {
		return sub_ins;
	}
	public void setSub_ins(String sub_ins) {
		this.sub_ins = sub_ins;
	}
	public String getSub_regdate() {
		return sub_regdate;
	}
	public void setSub_regdate(String sub_regdate) {
		this.sub_regdate = sub_regdate;
	}
	public String getSub_score() {
		return sub_score;
	}
	public void setSub_score(String sub_score) {
		this.sub_score = sub_score;
	}
	public String getSub_status() {
		return sub_status;
	}
	public void setSub_status(String sub_status) {
		this.sub_status = sub_status;
	}
	public String getSub_rejection() {
		return sub_rejection;
	}
	public void setSub_rejection(String sub_rejection) {
		this.sub_rejection = sub_rejection;
	}
	public SubjectVo(String sub_num, String sub_title, String sub_content, String sub_keyword, String sub_cod_code,
			String sub_tag, String sub_reg_code, String sub_reg_id, String sub_ins, String sub_regdate,
			String sub_score, String sub_status, String sub_rejection) {
		super();
		this.sub_num = sub_num;
		this.sub_title = sub_title;
		this.sub_content = sub_content;
		this.sub_keyword = sub_keyword;
		this.sub_cod_code = sub_cod_code;
		this.sub_tag = sub_tag;
		this.sub_reg_code = sub_reg_code;
		this.sub_reg_id = sub_reg_id;
		this.sub_ins = sub_ins;
		this.sub_regdate = sub_regdate;
		this.sub_score = sub_score;
		this.sub_status = sub_status;
		this.sub_rejection = sub_rejection;
	}
	public SubjectVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	/*
	 * SUB_CODE TABLE Vo
	 * cod_code 태그 카테고리 분류 코드
	 * cod_name 태그 카테고리 이름
	 * cod_tag 카테고리별 해시태그
	 */
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
	public SubjectVo(String cod_code, String cod_name, String cod_tag) {
		super();
		this.cod_code = cod_code;
		this.cod_name = cod_name;
		this.cod_tag = cod_tag;
	}
	@Override
	public String toString() {
		return "SubjectVo [sub_num=" + sub_num + ", sub_title=" + sub_title + ", sub_content=" + sub_content
				+ ", sub_keyword=" + sub_keyword + ", sub_cod_code=" + sub_cod_code + ", sub_tag=" + sub_tag
				+ ", sub_reg_code=" + sub_reg_code + ", sub_reg_id=" + sub_reg_id + ", sub_ins=" + sub_ins
				+ ", sub_regdate=" + sub_regdate + ", sub_score=" + sub_score + ", sub_status=" + sub_status
				+ ", sub_rejection=" + sub_rejection + ", cod_code=" + cod_code + ", cod_name=" + cod_name
				+ ", cod_tag=" + cod_tag + "]";
	}


	
	

}

