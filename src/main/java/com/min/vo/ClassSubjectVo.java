package com.min.vo;

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
public class ClassSubjectVo {
	public int csu_seq;
	public String csu_sub_num;
	public String csu_cla_num;
}
