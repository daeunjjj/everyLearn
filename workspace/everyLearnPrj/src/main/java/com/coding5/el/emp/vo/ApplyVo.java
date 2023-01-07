package com.coding5.el.emp.vo;

import lombok.Data;

@Data
public class ApplyVo {

	private String no;
	private String memberNo;
	private String empNo;
	private String status;
	
	
	// 회원 정보
	private String name;
	private String phone;
	private String email;
	
}
