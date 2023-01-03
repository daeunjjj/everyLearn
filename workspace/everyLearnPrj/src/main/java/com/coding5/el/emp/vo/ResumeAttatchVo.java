package com.coding5.el.emp.vo;

import java.util.List;

import lombok.Data;

@Data
public class ResumeAttatchVo {
	
	// 추가정보(첨부파일)
	private String attachNo;
	private String resumeNo;
	private String originName;
	private String changeName;
	private String filePath;
	
	private List<ResumeAttatchVo> ravList;
	
}
