package com.coding5.el.corp.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.coding5.el.corp.dao.CorpDao;
import com.coding5.el.corp.vo.CorpVo;

@Service
public class CorpServiceImpl implements CorpService {

	@Autowired
	private BCryptPasswordEncoder enc;
	
	@Autowired
	private SqlSessionTemplate sst;
	
	@Autowired
	private CorpDao dao;
	
	// 회원가입
	@Override
	public int join(CorpVo vo) {
		
		// 비밀번호 암호화
		String pwd = vo.getPwd();
		String newPwd = enc.encode(pwd);
		vo.setPwd(newPwd);
		
		return dao.insertCorpMember(sst, vo);
	}

	// 로그인
	@Override
	public CorpVo login(CorpVo vo) {
		return dao.selectOneCorpMember(sst, vo);
	}

}
