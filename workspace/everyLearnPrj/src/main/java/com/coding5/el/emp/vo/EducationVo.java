package com.coding5.el.emp.vo;

import java.util.List;

import lombok.Data;

@Data
public class EducationVo {
	
	// 경력(학력)
	private String educationNo;
	private String resumeNo;
	private String status;
	private String education;
	private String schoolName;
	private String major;
	private String enterSchool;
	private String graduate;
	
	private List<EducationVo> evList;
	
}
