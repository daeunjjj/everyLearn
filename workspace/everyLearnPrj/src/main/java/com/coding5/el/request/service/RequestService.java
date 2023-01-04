package com.coding5.el.request.service;

import java.util.List;

import com.coding5.el.request.vo.RequestVo;

public interface RequestService {
	// 요청 질문 리스트
	public List<RequestVo> selectQuestion();
	
	// 요청 리스트
	public int insertRequest(RequestVo vo);


}
