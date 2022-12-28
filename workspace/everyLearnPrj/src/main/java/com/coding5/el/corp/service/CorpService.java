package com.coding5.el.corp.service;

import java.util.List;

import com.coding5.el.common.page.PageVo;
import com.coding5.el.corp.vo.CorpVo;
import com.coding5.el.corp.vo.EmploymentVo;

public interface CorpService {

	// 회원가입
	public int join(CorpVo vo);

	// 로그인
	public CorpVo login(CorpVo vo);

	// 기업 마이페이지(회사정보 화면)
	public CorpVo selectMypage(CorpVo vo);
	
	// 기업 마이페이지(회사정보 입력)
	public int updateCorpInfo(CorpVo vo);

	// 기업 채용 공고 만들기
	public int insertJobPost(EmploymentVo vo);

	// 아이디 중복체크
	public String checkId(String id);

	// 채용중 페이징
	public int selectHiringCnt(String corpNo);

	// 채용중 페이지 리스트
	public List<EmploymentVo> getList(PageVo pv, String corpNo);

	// 채용 공고 지우기
	public int deleteJobPost(String no);

	// 채용 마감 페이징
	public int selectDeadlineCnt(String corpNo);

	// 채용 마감 리스트
	public List<EmploymentVo> getDeadlineList(PageVo pv, String corpNo);


}
