package com.coding5.el.class_comm.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding5.el.class_comm.dao.ClassCommDao;
import com.coding5.el.class_comm.dao.ClassCommDaoImpl;
import com.coding5.el.class_comm.vo.ClassCommVo;
import com.coding5.el.member.dao.MemberDaoImpl;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class ClassCommServiceImpl implements ClassCommService{

	@Autowired
	private SqlSessionTemplate sst;
	
	@Autowired
	private ClassCommDao dao;
	
	//게시글 등록
	@Override
	public int write(ClassCommVo vo) {
		int result = dao.write(sst, vo);
		return result;
	}

	//질답 게시판
	@Override
	public List<ClassCommVo> qnaList() {
		return dao.selectQnaInfo(sst);
	}

	//게시글 디테일
	@Override
	public ClassCommVo detailVo(String classCommNo) {
		return dao.selectDetailVo(sst, classCommNo);
	}

	//신고 인서트
	@Override
	public int report(ClassCommVo vo) {
		return dao.insertReport(sst, vo);
	}

	//스터디 게시판
	@Override
	public List<ClassCommVo> studyList(String orderBy) {
		return dao.selectstudyList(sst, orderBy);
	}
	
	

	//자유게시판
	@Override
	public List<ClassCommVo> freeList(String orderBy) {
		return dao.selectFreeList(sst, orderBy);
	}

}
