package com.coding5.el.lecture.dao;

import java.util.HashMap;
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

		return sst.insert("lectureMapper.insertClassOne" , lvo);
	}

	
	//강의 목차 등록
	@Override
	public int insertClassDetail(SqlSessionTemplate sst, LectureVo lvo, DetailClassVo dcvo,
			List<DetailClassVo> dcList) {
		return sst.insert("lectureMapper.insertClassDetail", dcvo);
	}


	@Override
	public List<LectureVo> getList(SqlSessionTemplate sst) {
		return sst.selectList("lectureMapper.getList");
	}

	//강의 메인 - 드로잉
	@Override
	public List<LectureVo> getListDrawing(SqlSessionTemplate sst) {
		return sst.selectList("lectureMapper.getListDrawing");
	}

	//강의 메인 - 요리 베이킹
	@Override
	public List<LectureVo> getListCook(SqlSessionTemplate sst) {
		return sst.selectList("lectureMapper.getListCook");
	}

	//강의 메인 - 운동
	@Override
	public List<LectureVo> getListWorkout(SqlSessionTemplate sst) {
		return sst.selectList("lectureMapper.getListWorkout");
	}

	//강의 메인 - 음악
	@Override
	public List<LectureVo> getListMusic(SqlSessionTemplate sst) {
		return sst.selectList("lectureMapper.getListMusic");
	}

	//강의 메인 - it
	@Override
	public List<LectureVo> getListItTech(SqlSessionTemplate sst) {
		return sst.selectList("lectureMapper.getListItTech");
	}

	//강의 메인 - 언어
	@Override
	public List<LectureVo> getListLanguage(SqlSessionTemplate sst) {
		return sst.selectList("lectureMapper.getListLanguage");
	}

	//강의 메인 - 금융
	@Override
	public List<LectureVo> getListFinance(SqlSessionTemplate sst) {
		return sst.selectList("lectureMapper.getListFinance");
	}

	//강의 검색
	@Override
	public List<LectureVo> searchBoardList(SqlSessionTemplate sst, HashMap<String, String> map) {
		return sst.selectList("lectureMapper.getSearch", map);
	}

	//강의 상세 조회
	@Override
	public LectureVo classDetail(SqlSessionTemplate sst, int bno) {
		return sst.selectOne("lectureMapper.classDetail", bno);
	}

	//강의 조회수 증가
	@Override
	public int increaseCount(SqlSessionTemplate sst, int bno) {
		return sst.update("lectureMapper.increaseCount", bno);
	}


	

}
