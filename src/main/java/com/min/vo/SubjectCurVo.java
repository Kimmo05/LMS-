package com.min.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
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
@AllArgsConstructor
public class SubjectCurVo implements Serializable{

	private static final long serialVersionUID = -5102827289239015456L;
	private String cur_time;
	
}
