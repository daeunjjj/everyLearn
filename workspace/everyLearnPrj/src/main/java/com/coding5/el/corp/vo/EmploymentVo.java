package com.coding5.el.corp.vo;

import lombok.Data;

@Data
public class EmploymentVo {

	private String no;
	private String corpNo;
	private String category;
	private String title;
	private String responsibility;
	private String qualification;
	private String preferential;
	private String salary;
	private String benefits;
	private String introduce;
	private String sector;
	private String address;
	private String career;
	private String deadline;
	private String wishCnt;
	private String enrollDate;
	private String modifyDate;
	private String deleteYN;
	
	// 채용 공고 상태
	private String status;
	
}
