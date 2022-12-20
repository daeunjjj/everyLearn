package com.coding5.el.emp.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.coding5.el.emp.vo.EmpVo;

@Repository
public class EmpDaoImpl implements EmpDao{

	// 회원가입
	@Override
	public int insertEmpMember(SqlSessionTemplate sst, EmpVo vo) {
		return sst.insert("empMapper.insertEmpMember", vo);
	}

	// 로그인
	@Override
	public EmpVo selectOneEmpMember(SqlSessionTemplate sst, EmpVo vo) {
		return sst.selectOne("empMapper.selectOneEmpMember", vo);
	}

}
