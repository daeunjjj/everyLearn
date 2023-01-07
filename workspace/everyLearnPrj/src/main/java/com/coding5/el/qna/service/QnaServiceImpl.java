package com.coding5.el.qna.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
