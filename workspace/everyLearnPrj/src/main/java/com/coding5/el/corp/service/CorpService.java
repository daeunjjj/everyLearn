package com.coding5.el.corp.service;

import com.coding5.el.corp.vo.CorpVo;

public interface CorpService {

	// 회원가입
	public int join(CorpVo vo);

	// 로그인
	public CorpVo login(CorpVo vo);

	// 기업 마이페이지(회사정보)
	public CorpVo selectMypage(CorpVo vo);
	
	// 기업 마이페이지(회사정보 입력)
	public int updateCorpInfo(CorpVo vo);


}
