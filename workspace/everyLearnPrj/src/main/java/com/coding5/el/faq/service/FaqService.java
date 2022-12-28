package com.coding5.el.faq.service;

import java.util.List;

import com.coding5.el.faq.vo.CateVo;
import com.coding5.el.faq.vo.FaqVo;

public interface FaqService {
	
	//카테고리
	List<CateVo> cateList() throws Exception;
	
	//글쓰기
	int write(FaqVo vo) throws Exception;

	//자주 묻는 질문 리스트
	List<FaqVo> getFaqList() throws Exception;

	//자주 묻는 질문 삭제
	int deleteFaq(String str) throws Exception;
	
	//자주 묻는 질문 수정
	int editFaq(FaqVo vo) throws Exception;

	//자주 묻는 질문 상세 조회
	FaqVo selectDetail(String no) throws Exception;

}
