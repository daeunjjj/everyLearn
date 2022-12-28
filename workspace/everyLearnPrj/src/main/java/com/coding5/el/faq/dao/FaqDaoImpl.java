package com.coding5.el.faq.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.coding5.el.faq.vo.CateVo;
import com.coding5.el.faq.vo.FaqVo;
import com.coding5.el.notice.dao.NoticeDaoImpl;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class FaqDaoImpl implements FaqDao {

	@Autowired private SqlSessionTemplate sst;
	
	@Override
	public List<CateVo> cateList() throws Exception {
		// 카테고리
		return sst.selectList("faqMapper.selectCateList");
	}
	
	@Override
	public int write(FaqVo vo) throws Exception {
		// faq 글쓰기
		return sst.insert("faqMapper.insertFaq", vo);
	}

	@Override
	public List<FaqVo> getFaqList() throws Exception {
		// faq 리스트
		return sst.selectList("faqMapper.getFaqList");
	}

	@Override
	public int deleteFaq(String[] delArr) throws Exception {
		// 삭제하기
		return sst.update("faqMapper.deleteFaq", delArr);
	}

	@Override
	public int editFaq(FaqVo vo) throws Exception {
		// 수정하기
		return sst.update("faqMapper.editFaq", vo);
	}

	@Override
	public FaqVo selectDetail(String no) throws Exception {
		// 상세조회
		return sst.selectOne("faqMapper.selectDetail", no);
	}

	

}
