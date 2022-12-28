package com.coding5.el.corp.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CorpVo {

	private String no;
	private String id;
	private String pwd;
	private String companyName;
	private String companyAddress;
	private String detailAddress;
	private String name;
	private String phone;
	private String introduce;
	private String enrollDate;
	private String modifyDate;
	private String companyNum;
	private String quitYN;
	private String statusYN;
	private String sector;
	private String empNum;
	private String sales;
	private String homepage;
	private MultipartFile logo;
	private MultipartFile thumb;
	private String logoName;
	private String thumbName;
}
