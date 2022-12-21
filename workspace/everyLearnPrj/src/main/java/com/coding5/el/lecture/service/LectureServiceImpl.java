package com.coding5.el.lecture.service;

import java.util.HashMap;
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


	//강의 메인리스트 조회
	@Override
	public List<LectureVo> getList() {
		
		return lectureDao.getList(sst);
	}

	//드로잉
	@Override
	public List<LectureVo> getListDrawing() {
		return lectureDao.getListDrawing(sst);
	}

	//요리 베이킹
	@Override
	public List<LectureVo> getListCook() {
		return lectureDao.getListCook(sst);
	}

	//운동
	@Override
	public List<LectureVo> getListWorkout() {
		return lectureDao.getListWorkout(sst);
	}

	//음악
	@Override
	public List<LectureVo> getListMusic() {
		return lectureDao.getListMusic(sst);
	}

	//it
	@Override
	public List<LectureVo> getListItTech() {
		return lectureDao.getListItTech(sst);
	}

	//언어
	@Override
	public List<LectureVo> getListLanguage() {
		return lectureDao.getListLanguage(sst);
	}

	//금융 재태크
	@Override
	public List<LectureVo> getListFinance() {
		return lectureDao.getListFinance(sst);
	}

	
	
	//강의 검색
	@Override
	public List<LectureVo> searchBoardList(HashMap<String, String> map) {
		return lectureDao.searchBoardList(sst , map);
	}

}
