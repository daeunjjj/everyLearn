package com.coding5.el.qna.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.coding5.el.qna.vo.QnaVo;

public interface QnaDao {

	int insertMemberWrite(SqlSessionTemplate sst, QnaVo vo) throws Exception;

}
