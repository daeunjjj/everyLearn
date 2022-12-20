package com.coding5.el.emp.service;

import com.coding5.el.emp.vo.EmpVo;

public interface EmpService {

	// 회원가입
	public int join(EmpVo vo);

	// 로그인
	public EmpVo login(EmpVo vo);

}
