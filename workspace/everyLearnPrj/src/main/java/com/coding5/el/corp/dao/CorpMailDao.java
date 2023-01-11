package com.coding5.el.corp.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.coding5.el.corp.vo.CorpVo;

public interface CorpMailDao {

	// 비밀번호 찾기
	int updateCertNum(SqlSessionTemplate sst, CorpVo vo);

}
