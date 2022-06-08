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
public class MessageBoardVo implements Serializable {
	private static final long serialVersionUID = 3283147620152681216L;
	private int mes_seq;
	private String mes_sender;
	private String mes_recipient;
	private String mes_content;
	private String mes_cate;
	private int mes_reffer;
	private String mes_regdate;
	private String mes_read;
}
