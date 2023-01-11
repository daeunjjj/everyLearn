package com.coding5.el.emp.comm.service;

import java.util.List;

import com.coding5.el.emp.comm.vo.CommentVo;
import com.coding5.el.emp.comm.vo.EmpCommVo;
import com.coding5.el.emp.comm.vo.LikeVo;
import com.coding5.el.notice.vo.PageVo;


public interface EmpCommService {

	//글쓰기
	int write(EmpCommVo vo) throws Exception;

	//글 갯수
	int getEmpCommCnt() throws Exception;

	//커뮤 리스트
	List<EmpCommVo> getEmpCommList(PageVo pageVo) throws Exception;

	//조회수
	int increaseHit(String no) throws Exception;

	//글 상세조회
	EmpCommVo selectDetail(String no) throws Exception;

	//글 수정하기
	int editEmpComm(EmpCommVo vo) throws Exception;

	//글 삭제하기
	int deleteEmpComm(String no) throws Exception;

	LikeVo findHeart(String no, String memberNo) throws Exception;

	int insertHeart(LikeVo heart) throws Exception;

	void insertComment(CommentVo vo) throws Exception;

	List<CommentVo> getCommentList(CommentVo vo) throws Exception;

	


}
