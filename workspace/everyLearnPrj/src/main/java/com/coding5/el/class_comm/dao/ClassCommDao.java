package com.coding5.el.class_comm.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.coding5.el.class_comm.vo.ClassCommVo;
import com.coding5.el.class_comm.vo.CommentVo;
import com.coding5.el.common.page.PageVo;

public interface ClassCommDao {

	public int write(SqlSessionTemplate sst, ClassCommVo vo);
	public List<ClassCommVo> selectQnaInfo(SqlSessionTemplate sst);
	public ClassCommVo selectDetailVo(SqlSessionTemplate sst, HashMap<String, String> likeMap);
	//신고 인서트
	public int insertReport(SqlSessionTemplate sst, HashMap<String,String> reportMap);
	//스터디게시판
	public List<ClassCommVo> selectstudyList(SqlSessionTemplate sst, PageVo pv, Map<String, String> search);
	//freeList
	public List<ClassCommVo> selectFreeList(SqlSessionTemplate sst, String orderBy);
	//commentList
	public List<CommentVo> selectCommentList(SqlSessionTemplate sst, String classCommNo);
	//insertComment
	public int insertComment(SqlSessionTemplate sst, CommentVo vo);
	//select commentOne
	public CommentVo selectCommentOne(SqlSessionTemplate sst, CommentVo vo);
	//delete Write comment
	public int deleteWriteComment(SqlSessionTemplate sst, String classCommNo);
	//delete write
	public int deleteWriteWrite(SqlSessionTemplate sst, String classCommNo);
	//select count (paging)
	public int selectCntOne(SqlSessionTemplate sst, Map<String, String> search);
	//insert reportInfo
	public int insertReportInfo(SqlSessionTemplate sst, ClassCommVo reportVo);
	//select reportInfo
	public ClassCommVo selectRefortInfo(SqlSessionTemplate sst);
	//select likeupCheck
	public int selectLikeupCheck(SqlSessionTemplate sst, HashMap<String, String> likeupMap);
	//insert likeup
	public int insertLike(SqlSessionTemplate sst, HashMap<String, String> likeupMap);
	//delete likeup
	public int deleteLike(SqlSessionTemplate sst, HashMap<String, String> likeupMap);
	//select likeCnt
	public String selectLikeCnt(SqlSessionTemplate sst, HashMap<String, String> likeMap);
	//select likeCntAjax
	public String selectLikeCntAjax(SqlSessionTemplate sst, String classCommNo);
	//디테일 화면 좋아요 여부 체크
//	public int selectLikeupCheck(SqlSessionTemplate sst, HashMap<String, String> likeMap);

}
