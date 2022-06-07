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
public class DocumentVo implements Serializable{
	private static final long serialVersionUID = 923150860365694624L;
	private int doc_seq;
	private String doc_file;
	private String doc_originname;
	private String doc_savename;
	private String doc_path;
	private String doc_extention;
}
