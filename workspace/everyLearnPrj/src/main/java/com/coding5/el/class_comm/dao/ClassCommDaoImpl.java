package com.coding5.el.class_comm.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.coding5.el.class_comm.vo.ClassCommVo;


import lombok.extern.slf4j.Slf4j;
@Slf4j
@Repository
public class ClassCommDaoImpl implements ClassCommDao{

	//게시글 등록
	@Override
	public int write(SqlSessionTemplate sst, ClassCommVo vo) {
		return sst.insert("classCommMapper.insertWrite", vo);
	}

	//질답 게시판
	public List<ClassCommVo> selectQnaInfo(SqlSessionTemplate sst) {
		return sst.selectList("classCommMapper.selectQnaList");
	}

	//게시글 디테일
	public ClassCommVo selectDetailVo(SqlSessionTemplate sst, String classCommNo) {
		return sst.selectOne("classCommMapper.selectDetailVo", classCommNo);
	}

	//신고 인서트
	@Override
	public int insertReport(SqlSessionTemplate sst, ClassCommVo vo) {
		return sst.insert("classCommMapper.insertReport", vo);
	}

	//스터디게시판
	@Override
	public List<ClassCommVo> selectstudyList(SqlSessionTemplate sst, String orderBy) {
		return sst.selectList("classCommMapper.selectStudyList",orderBy);
	}

	//freeList
	@Override
	public List<ClassCommVo> selectFreeList(SqlSessionTemplate sst, String orderBy) {
		return sst.selectList("classCommMapper.selectFreeList", orderBy);
	}

}
