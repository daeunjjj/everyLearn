package com.coding5.el.corp.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CorpVo {

	private String no;
	private String id;
	private String pwd;
	private String prePwd;
	private String authentication;
	private String companyName;
	private String companyAddress;
	private String detailAddress;
	private String name;
	private String phone;
	private String introduce;
	private String enrollDate;
	private String modifyDate;
	private String companyNum;
	private String quitYn;
	private String statusYn;
	private String sector;
	private String empNum;
	private String sales;
	private String homepage;
	private MultipartFile logoFile;
	private MultipartFile thumbFile;
	private String logo;
	private String thumb;
	private String deleteYn;
	private String period;
}
