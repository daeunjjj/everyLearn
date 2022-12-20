package com.coding5.el.admin.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.coding5.el.admin.dao.AdminDao;
import com.coding5.el.admin.vo.AdminVo;
@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private SqlSessionTemplate sst;
	
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private BCryptPasswordEncoder pwdEnc;
	
	// 로그인
	@Override
	public AdminVo login(AdminVo vo) {
		
		AdminVo dbAdmin = adminDao.selectOneAdminById(sst, vo.getId());
		
		if(dbAdmin == null) return null;

		
		String rawPassword = vo.getPwd();
		String encodedPassword = dbAdmin.getPwd();
		
		if(!pwdEnc.matches(rawPassword, encodedPassword)) return null;
		
		return dbAdmin;
		
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
	
	// 관리자 등록
	@Override
	public int join(AdminVo vo) {
		
		// 암호화
		vo.encode(pwdEnc);
		
		return adminDao.insertAdminOne(sst,vo);
	}
	
	// 관리자 내정보 수정
	@Override
	public int myInfoModify(AdminVo vo) {
		
		vo.encode(pwdEnc);
		
		return 0;
	}

}
