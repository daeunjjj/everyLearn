package com.coding5.el.emp.vo;

import java.util.List;

import lombok.Data;

@Data
public class CareerVo {

	// 경력(업무경험)
	private String careerNo;
	private String resumeNo;
	private String type;
	private String companyName;
	private String team;
	private String position;
	private String joinCompany;
	private String leave;
	private String currentYN;
	
	private List<CareerVo> cvList;
	
}
