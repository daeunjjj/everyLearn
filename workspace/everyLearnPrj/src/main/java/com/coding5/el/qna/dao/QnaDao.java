package com.coding5.el.qna.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.coding5.el.qna.vo.QnaVo;

public interface QnaDao {

	int write(SqlSessionTemplate sst, QnaVo vo) throws Exception;

}
