package com.coding5.el.faq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding5.el.faq.dao.FaqDao;
import com.coding5.el.faq.vo.CateVo;
import com.coding5.el.faq.vo.FaqVo;
import com.coding5.el.notice.service.NoticeServiceImpl;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FaqServiceImpl implements FaqService {

	@Autowired private FaqDao faqDao;
	
	@Override
	public List<CateVo> cateList() throws Exception {
		//카테고리
		return faqDao.cateList();
	}
	
	@Override
	public int write(FaqVo vo) throws Exception {
		//글쓰기
		return faqDao.write(vo);
	}

	@Override
	public List<FaqVo> getFaqList() throws Exception {
		//faq 리스트
		return faqDao.getFaqList();
	}
	
	@Override
	public int deleteFaq(String str) throws Exception {
		//faq 삭제
		String[] delArr = str.split(",");
		return faqDao.deleteFaq(delArr);
	}

	@Override
	public int editFaq(FaqVo vo) throws Exception {
		//faq 수정
		return faqDao.editFaq(vo);
	}

	@Override
	public FaqVo selectDetail(String no) throws Exception {
		//faq 상세 조회
		return faqDao.selectDetail(no);
	}

	

	

	

}
