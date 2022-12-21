package com.coding5.el.lecture.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.coding5.el.lecture.vo.DetailClassVo;
import com.coding5.el.lecture.vo.LectureVo;

public interface LectureDao {
	
	
	
	//insert lecture
	public int insertClassOne(SqlSessionTemplate sst, LectureVo lvo);

	
	//insert 세부사항 - 목차
	public int insertClassDetail(SqlSessionTemplate sst, LectureVo lvo, DetailClassVo dcvo, List<DetailClassVo> dcList);

	
	//강의 전체 목록 리스트 조회
	public List<LectureVo> getList(SqlSessionTemplate sst);

	//강의 전체 목록 리스트 조회 - 드로잉
	public List<LectureVo> getListDrawing(SqlSessionTemplate sst);

	//강의 전체 목록 리스트 조회 - 요리 베이킹
	public List<LectureVo> getListCook(SqlSessionTemplate sst);

	//강의 전체 목록 리스트 조회 - 운동
	public List<LectureVo> getListWorkout(SqlSessionTemplate sst);

	//강의 전체 목록 리스트 조회 - 음악
	public List<LectureVo> getListMusic(SqlSessionTemplate sst);

	//강의 전체 목록 리스트 조회 - it
	public List<LectureVo> getListItTech(SqlSessionTemplate sst);

	//강의 전체 목록 리스트 조회 - 언어
	public List<LectureVo> getListLanguage(SqlSessionTemplate sst);

	//강의 전체 목록 리스트 조회 - 금융
	public List<LectureVo> getListFinance(SqlSessionTemplate sst);

	//강의 검색
	public List<LectureVo> searchBoardList(SqlSessionTemplate sst, HashMap<String, String> map);
	
}
