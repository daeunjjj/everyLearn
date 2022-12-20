package com.coding5.el.admin.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.coding5.el.admin.vo.AdminVo;

public interface AdminDao {
	// 관리자 아이디 하나 가져오기
	public AdminVo selectOneAdminById(SqlSessionTemplate sst, String id);
	
	// 관리자 하나 등록
	public int insertAdminOne(SqlSessionTemplate sst, AdminVo vo);
	
}
