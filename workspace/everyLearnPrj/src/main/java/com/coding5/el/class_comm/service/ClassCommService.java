package com.coding5.el.class_comm.service;

import java.util.List;

import com.coding5.el.class_comm.vo.ClassCommVo;

public interface ClassCommService {

	//게시글 등록
	public int write(ClassCommVo vo);

	//질답 게시판
	public List<ClassCommVo> qnaList();

	//게시글 디테일
	public List<ClassCommVo> detailList(String classCommNo);
}
