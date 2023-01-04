package com.coding5.el.faq.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.coding5.el.faq.vo.CateVo;
import com.coding5.el.faq.vo.FaqVo;
import com.coding5.el.notice.dao.NoticeDaoImpl;
import com.coding5.el.notice.vo.PageVo;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class FaqDaoImpl implements FaqDao {

	
	@Override	//글작성
	public int write(SqlSessionTemplate sst, FaqVo vo) throws Exception {
		return sst.insert("faqMapper.insertFaq", vo);
	}

	@Override	//리스트
	public List<FaqVo> getAdminList(SqlSessionTemplate sst, PageVo pageVo) {
		return sst.selectList("faqMapper.getAdminList", pageVo);
	}

	@Override	//글 갯수 카운트
	public int getFaqCnt(SqlSessionTemplate sst) {
		return sst.selectOne("faqMapper.getFaqCnt");
	}

	@Override	//카테고리 리스트
	public List<CateVo> cateList(SqlSessionTemplate sst) throws Exception {
		return sst.selectList("faqMapper.cateList");
	}
	
	@Override	//일반 회원 질문 리스트
	public List<FaqVo> getMemberFaqList(SqlSessionTemplate sst) {
		return sst.selectList("faqMapper.getMemberFaqList");
	}

	@Override	//기업 회원 질문 리스트
	public List<FaqVo> getEmpFaqList(SqlSessionTemplate sst) {
		return sst.selectList("faqMapper.getEmpFaqList");
	}


	@Override
	public int deleteFaq(SqlSessionTemplate sst, String[] delArr) throws Exception {
		// 삭제하기
		return sst.update("faqMapper.deleteFaq", delArr);
	}

	@Override
	public int editFaq(SqlSessionTemplate sst, FaqVo vo) throws Exception {
		// 수정하기
		return sst.update("faqMapper.editFaq", vo);
	}

	@Override
	public FaqVo selectDetail(SqlSessionTemplate sst, String no) throws Exception {
		// 상세조회
		return sst.selectOne("faqMapper.selectDetail", no);
	}

	

}
