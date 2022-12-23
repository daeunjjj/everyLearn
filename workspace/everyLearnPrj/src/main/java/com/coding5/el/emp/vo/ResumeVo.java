package com.coding5.el.emp.vo;

import lombok.Data;

@Data
public class ResumeVo {

	// 이력서
	private String no;
	private String member;
	private String adress;
	private String link;
	private String introduce;
	private String enrollDate;
	private String modifyDate;
	
	// 이력서 번호(공통)
	private String resumeNo;
	
	// 경력(학력)
	private String educatinNo;
	private String status;
	private String education;
	private String schoolName;
	private String major;
	private String enterSchool;
	private String graduate;
	
	// 경력(업무경험)
	private String carrerNo;
	private String type;
	private String company_name;
	private String team;
	private String position;
	private String joinCompany;
	private String leave;
	private String currentYN;
	
	// 보유역량(수상)
	private String awardNo;
	private String awardName;
	private String awardDate;
	private String awardAgency;
	
	// 보유역량(자격증)
	private String certificateNo;
	private String certificateName;
	private String certificateDate;
	private String certificateAgency;
	
	// 보유역량(언어)
	private String languageNo;
	private String language;
	private String languageLevel;
	
	// 추가정보(첨부파일)
	private String attachNo;
	private String originName;
	private String changeName;
	private String filePath;
	
}
