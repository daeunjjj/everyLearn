package com.coding5.el.faq.dao;

import java.util.List;

import com.coding5.el.faq.vo.CateVo;
import com.coding5.el.faq.vo.FaqVo;


public interface FaqDao {
	
	//카테고리
	List<CateVo> cateList() throws Exception;
	
	//공지 작성
	int write(FaqVo vo) throws Exception;

	//공지 리스트
	List<FaqVo> getFaqList() throws Exception;

	//공지 삭제
	int deleteFaq(String[] delArr) throws Exception;
	
	//공지 수정
	int editFaq(FaqVo vo) throws Exception;

	//공지 상세 조회
	FaqVo selectDetail(String no) throws Exception;

	

}
