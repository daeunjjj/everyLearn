package com.coding5.el.admin.service;

import org.springframework.stereotype.Service;

import com.coding5.el.admin.vo.AdminVo;

public interface AdminService {
	
	//로그인 
	public AdminVo login(AdminVo vo);
	
	// 아이디 중복 체크
	public String dupCheckId(String id);
}