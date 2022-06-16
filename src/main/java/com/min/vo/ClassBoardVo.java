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
public class ClassBoardVo implements Serializable {

	private static final long serialVersionUID = 1353347422470289134L;
	private int cbo_seq;
	private String cbo_cla_num;
	private String cbo_cate;
	private String cbo_ins_id;
	private String cbo_title;
	private String cbo_content;
	private String cbo_regdate;
	private String cbo_youtubeadd;
	private int cbo_doc_seq;
}
