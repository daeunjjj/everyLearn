package com.coding5.el.request.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.coding5.el.request.vo.RequestVo;

@Repository
public class RequestDaoImpl implements RequestDao{
	
	@Override
	public List<RequestVo> selectQuestion(SqlSessionTemplate sst) {
		// 질문 가져오기
		return sst.selectList("requestMapper.selectQuestion");
	}
	
	@Override
	public int insertRequest(SqlSessionTemplate sst, RequestVo vo) {
		// 요청 넣기
		return sst.insert("requestMapper.insertRequest",vo);
	}



}
