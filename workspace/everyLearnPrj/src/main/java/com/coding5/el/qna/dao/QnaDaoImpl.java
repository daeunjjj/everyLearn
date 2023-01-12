package com.coding5.el.qna.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.coding5.el.notice.vo.PageVo;
import com.coding5.el.qna.vo.QnaVo;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class QnaDaoImpl implements QnaDao {

	@Override
	public int insertMemberWrite(SqlSessionTemplate sst, QnaVo vo) throws Exception {
		return sst.insert("qnaMapper.insertMemberWrite", vo);
	}

	@Override
	public int answerAdminWrite(SqlSessionTemplate sst, QnaVo vo) throws Exception {
		System.out.println("dao::" + vo);
		return sst.update("qnaMapper.updateAdminWrite", vo);
	}

	@Override
	public int getQnaCnt(SqlSessionTemplate sst) throws Exception {
		return sst.selectOne("qnaMapper.getQnaCnt");
	}

	@Override
	public List<QnaVo> getQnaList(SqlSessionTemplate sst, PageVo pageVo) throws Exception {
		return sst.selectList("qnaMapper.getQnaList", pageVo);
	}

	@Override
	public QnaVo selectDetail(SqlSessionTemplate sst, String no) throws Exception {
		return sst.selectOne("qnaMapper.selectDetail", no);
	}

}
