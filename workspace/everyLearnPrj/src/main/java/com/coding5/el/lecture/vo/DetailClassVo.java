package com.coding5.el.lecture.vo;


import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;



@NoArgsConstructor
@Data
public class DetailClassVo {

	private String no;
	private String classNo;
	private String chapter;
	
	private List<DetailClassVo> dcList;
}
