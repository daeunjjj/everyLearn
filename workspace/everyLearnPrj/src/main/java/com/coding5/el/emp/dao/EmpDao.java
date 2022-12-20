package com.coding5.el.emp.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.coding5.el.emp.vo.EmpVo;

public interface EmpDao {

	// 회원가입
	public int insertEmpMember(SqlSessionTemplate sst, EmpVo vo);

	// 로그인
	public EmpVo selectOneEmpMember(SqlSessionTemplate sst, EmpVo vo);

}
