package com.coding5.el.member.service;


import com.coding5.el.member.vo.MemberVo;

public interface MemberService {
	//회원가입
	public int join(MemberVo vo);

	public MemberVo login(MemberVo vo);

	//아이디 중복
	public String idDup(String memberId);

	//닉네임 중복
	public String nickDup(String memberNick);

	//아이디 찾기
	public String idFind(MemberVo findVo);
	
}
