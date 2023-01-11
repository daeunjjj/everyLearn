package com.coding5.el.qna.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.coding5.el.notice.vo.PageVo;
import com.coding5.el.qna.vo.QnaVo;

@Repository
public class QnaDaoImpl implements QnaDao {

	@Override
	public int insertMemberWrite(SqlSessionTemplate sst, QnaVo vo) throws Exception {
		System.out.println("dao" + vo);
		return sst.insert("qnaMapper.insertMemberWrite", vo);
	}

	@Override
	public int answerAdminWrite(SqlSessionTemplate sst, QnaVo vo) throws Exception {
		return sst.insert("qnaMapper.insertAdminWrite", vo);
	}

	@Override
	public int getQnaCommCnt(SqlSessionTemplate sst) throws Exception {
		return sst.selectOne("qnaMapper.getQnaCommCnt");
	}

	@Override
	public List<QnaVo> getQnaList(SqlSessionTemplate sst, PageVo pageVo) throws Exception {
		return sst.selectList("qnaMapper.getQnaList", pageVo);
	}

}
