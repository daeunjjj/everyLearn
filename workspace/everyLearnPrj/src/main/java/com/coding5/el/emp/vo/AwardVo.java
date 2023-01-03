package com.coding5.el.emp.vo;

import java.util.List;

import lombok.Data;

@Data
public class AwardVo {
	
	// 보유역량(수상)
	private String awardNo;
	private String resumeNo;
	private String awardName;
	private String awardDate;
	private String awardAgency;
	
	private List<AwardVo> avList;

}
