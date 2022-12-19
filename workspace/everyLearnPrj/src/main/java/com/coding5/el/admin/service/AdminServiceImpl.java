package com.coding5.el.admin.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding5.el.admin.dao.AdminDao;
import com.coding5.el.admin.vo.AdminVo;
@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private SqlSessionTemplate sst;
	
	@Autowired
	private AdminDao adminDao;
	
	// 로그인
	@Override
	public AdminVo login(AdminVo vo) {
		
		return adminDao.selectOneAdminById(sst, vo.getId());
	}
	
	// 아이디 중복체크
	@Override
	public String dupCheckId(String id) {
		AdminVo adminMember = adminDao.selectOneAdminById(sst, id);
		
		String result = "";
		
		if(adminMember != null) {
			return result;
		}
		
		return result = "able";
	}

}
