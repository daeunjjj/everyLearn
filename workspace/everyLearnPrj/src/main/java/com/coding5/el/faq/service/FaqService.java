package com.coding5.el.faq.service;

import java.util.List;

import com.coding5.el.faq.vo.CateVo;
import com.coding5.el.faq.vo.FaqVo;
import com.coding5.el.notice.vo.PageVo;

public interface FaqService {
	
	//글쓰기
	int write(FaqVo vo) throws Exception;
	
	//관리자 전용 리스트
	List<FaqVo> getAdminList(PageVo pageVo) throws Exception;
	
	//사용자 전용 리스트
	List<FaqVo> getFaqList();
	
	//글 갯수
	int getFaqCnt() throws Exception;
	
	//카테고리 리스트
	List<CateVo> cateList() throws Exception;

	//자주 묻는 질문 삭제
	int deleteFaq(String str) throws Exception;
	
	//자주 묻는 질문 수정
	int editFaq(FaqVo vo) throws Exception;

	//자주 묻는 질문 상세 조회
	FaqVo selectDetail(String no) throws Exception;

	//일반 회원 질문 리스트
	List<FaqVo> getMemberFaqList() throws Exception;
	
	//기업 회원 질문 리스트
	List<FaqVo> getEmpFaqList() throws Exception;


}
