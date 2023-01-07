package com.coding5.el.corp.service;

import java.util.List;

import com.coding5.el.common.page.PageVo;
import com.coding5.el.corp.vo.CorpVo;
import com.coding5.el.corp.vo.EmploymentVo;
import com.coding5.el.emp.vo.ApplyVo;
import com.coding5.el.emp.vo.JobPostVo;

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

	// 채용 전체보기 페이징
	public int selectTotalCnt(String corpNo);

	// 채용 전체보기 리스트
	public List<EmploymentVo> getTotalList(PageVo pv, String corpNo);

	// 공고 세부조회
	public JobPostVo selectJobPost(CorpVo corpMember, String no);

	// 공고 조회(기업용)
	public EmploymentVo selectEmployment(CorpVo corpMember, String no);

	// 공고 수정
	public int editJobPost(EmploymentVo vo, CorpVo corpMember);

	// 회원 탈퇴
	public int quitCorpMember(CorpVo vo);

	// 지원자 현황 페이징
	public int selectApplyCnt(String empNo);
	
	// 지원자 현황
	public List<ApplyVo> applyList(PageVo pv, String empNo);



}
