package com.min.vo;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
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

	/*
	 * SUB_REGISTER TABLE Vo
	 * reg_code 등록자 코드
	 * reg_auth 등록자 권한
	 * reg_id 등록자 ID
	 */
	private String reg_code;
	private String reg_auth;
	private String reg_id;


}
