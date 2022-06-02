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
public class VoteVo {
	public String vot_cla_num;
	public String vot_sub_num;
	public String vot_ins_id;
	public String vot_voter;
}
