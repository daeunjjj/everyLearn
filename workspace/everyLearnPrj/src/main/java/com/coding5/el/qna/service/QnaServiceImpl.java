package com.coding5.el.qna.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding5.el.notice.vo.PageVo;
import com.coding5.el.qna.dao.QnaDao;
import com.coding5.el.qna.vo.QnaVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class QnaServiceImpl implements QnaService {
	
	@Autowired QnaDao qnaDao;
	@Autowired SqlSessionTemplate sst;

	@Override
	public int memberWrite(QnaVo vo) throws Exception {
		return qnaDao.insertMemberWrite(sst, vo);
	}

	@Override
	public int answerAdminWrite(QnaVo vo) throws Exception {
		System.out.println("service::" + vo);
		return qnaDao.answerAdminWrite(sst, vo);
	}

	//qna 갯수
	@Override
	public int getQnaCnt() throws Exception {
		return qnaDao.getQnaCnt(sst);
	}

	//qna 목록
	@Override
	public List<QnaVo> getQnaList(PageVo pageVo) throws Exception {
		return qnaDao.getQnaList(sst, pageVo);
	}

	//qna 디테일
	@Override
	public QnaVo selectDetail(String no) throws Exception {
		return qnaDao.selectDetail(sst, no);
	}

}
