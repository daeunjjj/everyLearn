package com.coding5.el.emp.comm.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.coding5.el.emp.comm.vo.CommentVo;
import com.coding5.el.emp.comm.vo.EmpCommVo;
import com.coding5.el.emp.comm.vo.LikeVo;
import com.coding5.el.notice.vo.PageVo;

public interface EmpCommDao {

	//글쓰기
	int insertWrite(SqlSessionTemplate sst, EmpCommVo vo) throws Exception;

	//글 갯수
	int getEmpCommCnt(SqlSessionTemplate sst) throws Exception;

	//커뮤 리스트
	List<EmpCommVo> getEmpCommList(SqlSessionTemplate sst, PageVo pageVo) throws Exception;

	//조회수+
	int increaseHit(SqlSessionTemplate sst, String no) throws Exception;

	//상세조회
	EmpCommVo selectDetail(SqlSessionTemplate sst, String no) throws Exception;

	//글 수정하기
	int editEmpComm(SqlSessionTemplate sst, EmpCommVo vo) throws Exception;

	//글 삭제하기
	int deleteEmpComm(SqlSessionTemplate sst, String no) throws Exception;

	LikeVo findHeart(SqlSessionTemplate sst, Map<String, String> number) throws Exception;

	LikeVo findHeart(SqlSessionTemplate sst, LikeVo heart) throws Exception;

	int insertHeart(SqlSessionTemplate sst, LikeVo heart) throws Exception;

	void deleteHeart(SqlSessionTemplate sst, LikeVo heart) throws Exception;

	void insertComment(SqlSessionTemplate sst, CommentVo vo) throws Exception;

	List<CommentVo> selectCommentList(SqlSessionTemplate sst, CommentVo vo) throws Exception;


	



}
