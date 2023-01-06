package com.coding5.el.class_comm.service;

import java.util.List;
import java.util.Map;

import com.coding5.el.class_comm.vo.ClassCommVo;
import com.coding5.el.class_comm.vo.CommentVo;
import com.coding5.el.common.page.PageVo;

public interface ClassCommService {

	//게시글 등록
	public int write(ClassCommVo vo);

	//질답 게시판
	public List<ClassCommVo> qnaList();

	//게시글 디테일
	public ClassCommVo detailVo(String classCommNo);

	//신고 인서트
	public int report(ClassCommVo vo);

	//스터디 게시판
	public List<ClassCommVo> studyList(PageVo pv, Map<String, String> search);

	//자유게시판
	public List<ClassCommVo> freeList(String orderBy);

	//댓글정보조회
	public List<CommentVo> commentList(String classCommNo);

	//댓글 인서트
	public int writeComment(CommentVo vo);

	//내 댓글 한 
	public CommentVo commemtOne(CommentVo vo);

	//댓글 삭제
	public int deleteWrite(String classCommNo);

	//게시글 카운트
	public int selectCnt(Map<String, String> search);

	//신고 인서트 정보
	public int reportInfo(ClassCommVo reportVo);
}
