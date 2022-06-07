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
@ToString
@NoArgsConstructor
public class ClassSubjectVo implements Serializable{
	private static final long serialVersionUID = 4755831451846085658L;
	private int csu_seq;
	private String csu_sub_num;
	private String csu_cla_num;
}
