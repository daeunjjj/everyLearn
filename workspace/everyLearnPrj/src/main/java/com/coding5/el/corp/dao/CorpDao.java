package com.coding5.el.corp.dao;

import org.mybatis.spring.SqlSessionTemplate;

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



}
