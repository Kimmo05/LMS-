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
public class DocumentVo {
	public int doc_seq;
	public String doc_file;
	public String doc_originname;
	public String doc_savename;
	public String doc_path;
	public String doc_extention;
}
