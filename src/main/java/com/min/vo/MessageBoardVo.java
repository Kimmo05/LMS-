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
public class MessageBoardVo {
	public int mes_seq;
	public String mes_sender;
	public String mes_recipient;
	public String mes_content;
	public String mes_cate;
	public int mes_reffer;
	public String mes_regdate;
	public String mes_read;
}
