package com.coding5.el.qna.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding5.el.notice.vo.PageVo;
import com.coding5.el.qna.dao.QnaDao;
import com.coding5.el.qna.vo.QnaVo;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Autowired QnaDao qnaDao;
	@Autowired SqlSessionTemplate sst;

	@Override
	public int memberWrite(QnaVo vo) throws Exception {
		return qnaDao.insertMemberWrite(sst, vo);
	}

	@Override
	public int adminWrite(QnaVo vo) throws Exception {
		return qnaDao.answerAdminWrite(sst, vo);
	}

	//qna 갯수
	@Override
	public int getQnaCommCnt() throws Exception {
		return qnaDao.getQnaCommCnt(sst);
	}

	//qna 목록
	@Override
	public List<QnaVo> getQnaList(PageVo pageVo) throws Exception {
		return qnaDao.getQnaList(sst, pageVo);
	}

}
