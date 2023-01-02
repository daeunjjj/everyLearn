package com.coding5.el.faq.vo;

import lombok.Data;

@Data
public class FaqVo {
	private String no;
	private String category;	// 1.일반회원		2.기업회원
	private String admin;
	private String title;
	private String content;
	private String enrollDate;
	private String modifyDate;
	private String del;
}
