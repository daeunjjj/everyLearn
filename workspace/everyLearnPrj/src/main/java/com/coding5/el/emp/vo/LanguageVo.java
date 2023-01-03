package com.coding5.el.emp.vo;

import java.util.List;

import lombok.Data;

@Data
public class LanguageVo {

	// 보유역량(언어)
	private String languageNo;
	private String resumeNo;
	private String language;
	private String languageLevel;
	
	private List<LanguageVo> lvList;
	
}
