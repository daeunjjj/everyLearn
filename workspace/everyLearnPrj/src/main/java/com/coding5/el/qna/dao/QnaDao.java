package com.coding5.el.qna.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.coding5.el.notice.vo.PageVo;
import com.coding5.el.qna.vo.QnaVo;

public interface QnaDao {

	int insertMemberWrite(SqlSessionTemplate sst, QnaVo vo) throws Exception;

	int answerAdminWrite(SqlSessionTemplate sst, QnaVo vo) throws Exception;

	int getQnaCnt(SqlSessionTemplate sst) throws Exception;

	List<QnaVo> getQnaList(SqlSessionTemplate sst, PageVo pageVo) throws Exception;

	QnaVo selectDetail(SqlSessionTemplate sst, String no) throws Exception;

}
