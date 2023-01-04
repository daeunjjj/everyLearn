package com.coding5.el.request.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.coding5.el.request.vo.RequestVo;

public interface RequestDao {
	// 질문
	public List<RequestVo> selectQuestion(SqlSessionTemplate sst);
	// 요청
	public int insertRequest(SqlSessionTemplate sst, RequestVo vo);

	

}
