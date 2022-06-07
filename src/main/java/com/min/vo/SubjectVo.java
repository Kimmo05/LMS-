package com.min.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@Getter
@Setter
@NoArgsConstructor
@ToString
public class SubjectVo implements Serializable{
	private static final long serialVersionUID = 2616021316532445218L;
	private String sub_num;
	private String sub_title;
	
	private SubjectCurVo subjectcurVo;

//	@Override
//	public String toString() {
//		return "SubjectVo [sub_num=" + sub_num + ", sub_title=" + sub_title + ", subjectcurVo=" + subjectcurVo + "]";
//	}
	
	
}
