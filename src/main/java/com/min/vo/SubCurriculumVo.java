package com.min.vo;

public class SubCurriculumVo {
	
	/*
	 * SUB_CURRICULUM TABLE Vo
	 * cur_num 커리큘럼 번호
	 * cur_sub_num 과목번호
	 * cur_detail 커리큘럼 기타내용
	 * cur_subcontent 커리큘럼 상세내용
	 * cur_version 커리큘럼 버전
	 * cur_time 커리큘럼 시간
	 * cur_level 커리큘럼 난이도
	 * cur_file 커리큘럼 첨부파일
	 */
	private String cur_num;
	private String cur_sub_num;
	private String cur_detail;
	private String cur_subcontent;
	private String cur_version;
	private String cur_time;
	private String cur_level;
	private String cur_file;
	public String getCur_num() {
		return cur_num;
	}
	public void setCur_num(String cur_num) {
		this.cur_num = cur_num;
	}
	public String getCur_sub_num() {
		return cur_sub_num;
	}
	public void setCur_sub_num(String cur_sub_num) {
		this.cur_sub_num = cur_sub_num;
	}
	public String getCur_detail() {
		return cur_detail;
	}
	public void setCur_detail(String cur_detail) {
		this.cur_detail = cur_detail;
	}
	public String getCur_subcontent() {
		return cur_subcontent;
	}
	public void setCur_subcontent(String cur_subcontent) {
		this.cur_subcontent = cur_subcontent;
	}
	public String getCur_version() {
		return cur_version;
	}
	public void setCur_version(String cur_version) {
		this.cur_version = cur_version;
	}
	public String getCur_time() {
		return cur_time;
	}
	public void setCur_time(String cur_time) {
		this.cur_time = cur_time;
	}
	public String getCur_level() {
		return cur_level;
	}
	public void setCur_level(String cur_level) {
		this.cur_level = cur_level;
	}
	public String getCur_file() {
		return cur_file;
	}
	public void setCur_file(String cur_file) {
		this.cur_file = cur_file;
	}
	public SubCurriculumVo(String cur_num, String cur_sub_num, String cur_detail, String cur_subcontent,
			String cur_version, String cur_time, String cur_level, String cur_file) {
		super();
		this.cur_num = cur_num;
		this.cur_sub_num = cur_sub_num;
		this.cur_detail = cur_detail;
		this.cur_subcontent = cur_subcontent;
		this.cur_version = cur_version;
		this.cur_time = cur_time;
		this.cur_level = cur_level;
		this.cur_file = cur_file;
	}
	public SubCurriculumVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "SubCurriculumVo [cur_num=" + cur_num + ", cur_sub_num=" + cur_sub_num + ", cur_detail=" + cur_detail
				+ ", cur_subcontent=" + cur_subcontent + ", cur_version=" + cur_version + ", cur_time=" + cur_time
				+ ", cur_level=" + cur_level + ", cur_file=" + cur_file + "]";
	}
	
	

}
