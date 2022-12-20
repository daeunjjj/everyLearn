package com.coding5.el.lecture.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding5.el.lecture.dao.LectureDao;
import com.coding5.el.lecture.vo.DetailClassVo;
import com.coding5.el.lecture.vo.LectureVo;

@Service
public class LectureServiceImpl implements LectureService {

	@Autowired
	private SqlSessionTemplate sst;
	@Autowired
	private LectureDao lectureDao;
	
	//강의 등록
	@Override
	public int insertClassOne(LectureVo lvo) {

		return lectureDao.insertClassOne(sst , lvo);
	}

	
	//강의 목차 등록!
	@Override
	public int insertClassDetail(LectureVo lvo, DetailClassVo dcvo, List<DetailClassVo> dcList) {
		
		return lectureDao.insertClassDetail(sst, lvo, dcvo, dcList);
	}

}
