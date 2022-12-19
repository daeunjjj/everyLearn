package com.coding5.el.member.service;


import com.coding5.el.member.vo.MemberVo;

public interface MemberService {
	//회원가입
	public int join(MemberVo vo);

	public MemberVo login(MemberVo vo);
	
}
