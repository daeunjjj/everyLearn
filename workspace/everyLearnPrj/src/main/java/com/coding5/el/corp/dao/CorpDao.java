package com.coding5.el.corp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.coding5.el.common.page.PageVo;
import com.coding5.el.corp.vo.CorpVo;
import com.coding5.el.corp.vo.EmploymentVo;

public interface CorpDao {

	// 회원가입
	public int insertCorpMember(SqlSessionTemplate sst, CorpVo vo);

	// 로그인
	public CorpVo selectOneCorpMember(SqlSessionTemplate sst, CorpVo vo);

	// 기업 마이페이지(회사정보 화면)
	public CorpVo selectOneCorpInfo(SqlSessionTemplate sst, CorpVo vo);
	
	// 기업 마이페이지(회사정보 수정)
	public int updateCorpInfo(SqlSessionTemplate sst, CorpVo vo);

	// 기업 채용 공고 만들기
	public int insertJobPost(SqlSessionTemplate sst, EmploymentVo vo);

	// 아이디 중복체크
	public CorpVo checkId(SqlSessionTemplate sst, String id);

	// 체용중 페이징
	public int selectHiringCnt(SqlSessionTemplate sst, String corpNo);

	// 채용중 페이지 리스트
	public List<EmploymentVo> selectHiringList(SqlSessionTemplate sst, PageVo pv, String corpNo);

	// 채용 공고 지우기
	public int updateJobPost(SqlSessionTemplate sst, String no);

	// 채용마감 페이징
	public int selectDeadlineCnt(SqlSessionTemplate sst, String corpNo);

	// 채용마감 리스트
	public List<EmploymentVo> getDeadlineList(SqlSessionTemplate sst, PageVo pv, String corpNo);

	// 채용 전체보기 페이징
	public int selectTotalCnt(SqlSessionTemplate sst, String corpNo);

	// 채용 전체보기 리스트
	public List<EmploymentVo> getTotalList(SqlSessionTemplate sst, PageVo pv, String corpNo);



}
