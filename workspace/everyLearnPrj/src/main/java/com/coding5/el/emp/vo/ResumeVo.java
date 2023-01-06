package com.coding5.el.emp.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ResumeVo {

	// 이력서
	private String no;
	private String memberNo;
	private String category;
	private String name;
	private String phone;
	private String email;
	private String address;
	private String detailAddress;
	private String link;
	private String introduce;
	private String enrollDate;
	private String modifyDate;
	private MultipartFile attach;
	private String attachName;
	

	
	
}


