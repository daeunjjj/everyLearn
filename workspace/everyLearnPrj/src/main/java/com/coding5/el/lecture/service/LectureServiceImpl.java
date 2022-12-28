package com.coding5.el.lecture.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding5.el.common.page.PageVo;
import com.coding5.el.lecture.dao.LectureDao;
import com.coding5.el.lecture.vo.DetailClassVo;
import com.coding5.el.lecture.vo.LectureVo;
import com.coding5.el.lecture.vo.ReviewVo;

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
	public int insertClassDetail(List<LectureVo> list) {
		return lectureDao.insertClassDetail(sst, list);
	}


	//강의 메인리스트 조회
	@Override
	public List<LectureVo> getList(PageVo pv) {
		
		return lectureDao.getList(sst, pv);
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

	//강의 조회수 증가
	@Override
	public int increaseCount(int bno) {
		return lectureDao.increaseCount(sst, bno);
	}

	//강의 상세 조회
	@Override
	public LectureVo classDetail(int bno) {
		LectureVo lvo = lectureDao.classDetail(sst, bno);
		return lvo;
	}

	//강의 총 갯수
	@Override
	public int selectLectureCount() {
		return lectureDao.selectLectureCount(sst);
	}

	//강의 수강평 조회
	@Override
	public List<ReviewVo> selectReview(int bno, PageVo pv) {
		return lectureDao.selectReview(sst, bno, pv);
	}

	//수강평 총 갯수
	@Override
	public int selectReviewCount(int bno) {
		return lectureDao.selectReviewCount(sst, bno);
	}

	//수강평 작성
	@Override
	public int insertReview(HashMap<String, String> map) {
		return lectureDao.insertReview(sst, map);
	}

	
	//수강평 리뷰 삭제
	@Override
	public int deleteReview(String reviewNo) {
		return lectureDao.deleteReview(sst, reviewNo);
	}

	//수강평 리뷰 수정
	@Override
	public int editReview(HashMap<String, String> map) {
		return lectureDao.editReview(sst, map);
	}


	@Override
	public int selectBno() {
		return lectureDao.selectBno(sst);
	}



}
