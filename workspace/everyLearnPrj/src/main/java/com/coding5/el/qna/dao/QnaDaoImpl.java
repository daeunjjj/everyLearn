package com.coding5.el.qna.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.coding5.el.qna.vo.QnaVo;

@Repository
public class QnaDaoImpl implements QnaDao {

	@Override
	public int insertMemberWrite(SqlSessionTemplate sst, QnaVo vo) throws Exception {
		return sst.insert("qnaMapper.insertQna", vo);
	}

}
