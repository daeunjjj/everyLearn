package com.coding5.el.faq.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding5.el.faq.dao.FaqDao;
import com.coding5.el.faq.vo.CateVo;
import com.coding5.el.faq.vo.FaqVo;
import com.coding5.el.notice.service.NoticeServiceImpl;
import com.coding5.el.notice.vo.PageVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FaqServiceImpl implements FaqService {

	@Autowired private FaqDao faqDao;
	@Autowired private SqlSessionTemplate sst;
	
	@Override	//글작성
	public int write(FaqVo vo) throws Exception {
		return faqDao.write(sst, vo);
	}

	@Override	//관리자 전용 리스트
	public List<FaqVo> adminList(PageVo pageVo) throws Exception {
		return faqDao.adminList(sst, pageVo);
	}

	@Override	//사용자 전용 리스트
	public List<FaqVo> getFaqList() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override	//글 갯수 카운트
	public int getFaqCnt() throws Exception {
		return faqDao.getFaqCnt(sst);
	}

	@Override	//카테고리 리스트
	public List<CateVo> cateList() throws Exception {
		return faqDao.cateList(sst);
	}
	
	@Override
	public int deleteFaq(String str) throws Exception {
		//faq 삭제
		String[] delArr = str.split(",");
		return faqDao.deleteFaq(sst, delArr);
	}

	@Override
	public int editFaq(FaqVo vo) throws Exception {
		//faq 수정
		return faqDao.editFaq(sst, vo);
	}

	@Override
	public FaqVo selectDetail(String no) throws Exception {
		//faq 상세 조회
		return faqDao.selectDetail(sst, no);
	}
	
	@Override	//일반 회원 질문 리스트
	public List<FaqVo> getMemberFaqList() throws Exception {
		return faqDao.getMemberFaqList(sst);
	}

	@Override	//기업 회원 질문 리스트
	public List<FaqVo> getEmpFaqList() throws Exception {
		return faqDao.getEmpFaqList(sst);
	}
	

	

	

	

	

}
