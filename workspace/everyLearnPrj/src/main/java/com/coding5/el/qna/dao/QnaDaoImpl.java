package com.coding5.el.qna.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.coding5.el.qna.vo.QnaVo;

@Repository
public class QnaDaoImpl implements QnaDao {

	@Override
	public int insertMemberWrite(SqlSessionTemplate sst, QnaVo vo) throws Exception {
		System.out.println("dao" + vo);
		return sst.insert("qnaMapper.insertMemberWrite", vo);
	}

	@Override
	public int insertAdminWrite(SqlSessionTemplate sst, QnaVo vo) throws Exception {
		// TODO Auto-generated method stub
		return sst.insert("qnaMapper.insertAdminWrite", vo);
	}

}
