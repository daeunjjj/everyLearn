package com.coding5.el.emp.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.coding5.el.emp.dao.EmpDao;
import com.coding5.el.emp.vo.EmpVo;

@Service
public class EmpServiceImpl implements EmpService {

	@Autowired
	private BCryptPasswordEncoder enc;
	
	@Autowired
	private SqlSessionTemplate sst;
	
	@Autowired
	private EmpDao dao;
	
	// 회원가입
	@Override
	public int join(EmpVo vo) {
		
		// 비밀번호 암호화
		String pwd = vo.getPwd();
		String newPwd = enc.encode(pwd);
		vo.setPwd(newPwd);
		
		return dao.insertEmpMember(sst, vo);
	}

	// 로그인
	@Override
	public EmpVo login(EmpVo vo) {
		return dao.selectOneEmpMember(sst, vo);
	}

}
