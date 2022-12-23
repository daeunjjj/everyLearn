package com.coding5.el.class_comm.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.coding5.el.class_comm.vo.ClassCommVo;

public interface ClassCommDao {

	public int write(SqlSessionTemplate sst, ClassCommVo vo);
	public List<ClassCommVo> selectQnaInfo(SqlSessionTemplate sst);
	public List<ClassCommVo> selectDetailList(SqlSessionTemplate sst, String classCommNo);

}
