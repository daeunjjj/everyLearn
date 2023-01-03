package com.coding5.el.faq.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.coding5.el.faq.vo.CateVo;
import com.coding5.el.faq.vo.FaqVo;
import com.coding5.el.notice.vo.PageVo;


public interface FaqDao {
	
	//글 작성
	int write(SqlSessionTemplate sst, FaqVo vo) throws Exception;

	//리스트
	List<FaqVo> adminList(SqlSessionTemplate sst, PageVo pageVo) throws Exception;

	//글 갯수 카운트
	int getFaqCnt(SqlSessionTemplate sst) throws Exception;

	//카테고리 리스트
	List<CateVo> cateList(SqlSessionTemplate sst) throws Exception;

	//공지 삭제
	int deleteFaq(SqlSessionTemplate sst, String[] delArr) throws Exception;
	
	//공지 수정
	int editFaq(SqlSessionTemplate sst, FaqVo vo) throws Exception;

	//공지 상세 조회
	FaqVo selectDetail(SqlSessionTemplate sst, String no) throws Exception;

	//일반 회원 질문 리스트
	List<FaqVo> getMemberFaqList(SqlSessionTemplate sst);

	//기업 회원 질문 리스트
	List<FaqVo> getEmpFaqList(SqlSessionTemplate sst);
	

}
