package com.coding5.el.class_comm.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding5.el.class_comm.dao.ClassCommDao;
import com.coding5.el.class_comm.vo.ClassCommVo;
import com.coding5.el.class_comm.vo.CommentVo;
import com.coding5.el.common.page.PageVo;

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
	public List<ClassCommVo> studyList(String orderBy,  PageVo pv) {
		return dao.selectstudyList(sst, orderBy, pv);
	}
	
	

	//자유게시판
	@Override
	public List<ClassCommVo> freeList(String orderBy) {
		return dao.selectFreeList(sst, orderBy);
	}

	//댓글 정보 조회
	@Override
	public List<CommentVo> commentList(String classCommNo) {
		return dao.selectCommentList(sst, classCommNo);
	}

	//댓글 인서트
	@Override
	public int writeComment(CommentVo vo) {
		return dao.insertComment(sst, vo);
	}

	//댓글 작성 한 개 조회
	@Override
	public CommentVo commemtOne(CommentVo vo) {
		return dao.selectCommentOne(sst, vo);
	}

	//게시글 삭제
	@Override
	public int deleteWrite(String classCommNo) {
		
		dao.deleteWriteComment(sst, classCommNo);
		
		return dao.deleteWriteWrite(sst, classCommNo);
	}

	//게시글 갯수 조회(페이징)
	@Override
	public int selectCnt(String commCateNo) {
		return dao.selectCntOne(sst, commCateNo);
	}

}
