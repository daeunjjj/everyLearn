package com.coding5.el.lecture.service;

import java.util.List;

import com.coding5.el.lecture.vo.DetailClassVo;
import com.coding5.el.lecture.vo.LectureVo;

public interface LectureService {
	
	
	//강의 등록
	int insertClassOne(LectureVo lvo);

	
	//강의 목차 등록
	int insertClassDetail(LectureVo lvo, DetailClassVo dcvo, List<DetailClassVo> dcList);

}
