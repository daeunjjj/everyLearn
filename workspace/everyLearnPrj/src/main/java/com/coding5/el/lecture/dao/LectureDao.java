package com.coding5.el.lecture.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.coding5.el.lecture.vo.DetailClassVo;
import com.coding5.el.lecture.vo.LectureVo;

public interface LectureDao {
	
	
	
	//insert lecture
	public int insertClassOne(SqlSessionTemplate sst, LectureVo lvo);

	public int insertClassDetail(SqlSessionTemplate sst, LectureVo lvo, DetailClassVo dcvo, List<DetailClassVo> dcList);

}
