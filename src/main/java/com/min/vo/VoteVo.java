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
public class VoteVo implements Serializable{
	private static final long serialVersionUID = 6759607719140795125L;
	private String vot_cla_num;
	private String vot_sub_num;
	private String vot_ins_id;
	private String vot_voter;
}
