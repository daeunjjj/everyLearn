package com.coding5.el.lecture.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.coding5.el.lecture.vo.DetailClassVo;
import com.coding5.el.lecture.vo.LectureVo;

@Repository
public class LectureDaoImpl implements LectureDao{

	
	//강의 등록
	@Override
	public int insertClassOne(SqlSessionTemplate sst, LectureVo lvo) {
		System.out.println("dao lvo :: " + lvo);
		return sst.insert("lectureMapper.insertClassOne" , lvo);
	}

	
	//강의 목차 등록
	@Override
	public int insertClassDetail(SqlSessionTemplate sst, LectureVo lvo, DetailClassVo dcvo,
			List<DetailClassVo> dcList) {
		System.out.println("dao dcvo :: " + dcvo);
		return sst.insert("lectureMapper.insertClassDetail", dcvo);
	}

}
