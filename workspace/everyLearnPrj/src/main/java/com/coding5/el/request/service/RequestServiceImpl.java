package com.coding5.el.request.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding5.el.request.dao.RequestDao;
import com.coding5.el.request.vo.RequestVo;

@Service
public class RequestServiceImpl implements RequestService{
	@Autowired
	public RequestServiceImpl(RequestDao requestDao) {
		this.requestDao = requestDao;
	}
	
	private final RequestDao requestDao;
	
	@Autowired
	private SqlSessionTemplate sst;
	
	//요청 질문 리스트
	@Override
	public List<RequestVo> selectQuestion() {
		return requestDao.selectQuestion(sst);
	}
	
	// 요청 리스트
	@Override
	public int insertRequest(RequestVo vo) {
		return requestDao.insertRequest(sst,vo);
	}



}
