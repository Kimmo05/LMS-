package com.min.vo;

import lombok.AllArgsConstructor;
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
public class InstructorVo {
	private String ins_id;
	private String ins_name;
	private String ins_email;
	private String ins_carrer;
}
