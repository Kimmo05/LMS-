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
public class ClassBoardVo {

	public int cbo_seq;
	public String cbo_cla_num;
	public String cbo_cate;
	public String cbo_ins_id;
	public String cbo_title;
	public String cbo_content;
	public String cbo_regdate;
	public String cbo_youtubeadd;
	public int cbo_doc_seq;
}
