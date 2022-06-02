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
public class ClassVo {
	public String cla_num;
	public String cla_title;
	public String cla_content;
	public int cla_maxpeo;
	public int cla_price;
	public int cla_dailytime;
	public String cla_startdate;
	public String cla_totaltime;
	public String cla_like;
	public String cla_status;
}
