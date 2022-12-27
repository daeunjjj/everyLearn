package com.coding5.el.class_comm.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.coding5.el.class_comm.vo.ClassCommVo;

public interface ClassCommDao {

	public int write(SqlSessionTemplate sst, ClassCommVo vo);
	public List<ClassCommVo> selectQnaInfo(SqlSessionTemplate sst);
	public ClassCommVo selectDetailVo(SqlSessionTemplate sst, String classCommNo);
	//신고 인서트
	public int insertReport(SqlSessionTemplate sst, ClassCommVo vo);
	//스터디게시판
	public List<ClassCommVo> selectstudyList(SqlSessionTemplate sst, String orderBy);
	//freeList
	public List<ClassCommVo> selectFreeList(SqlSessionTemplate sst, String orderBy);

}
