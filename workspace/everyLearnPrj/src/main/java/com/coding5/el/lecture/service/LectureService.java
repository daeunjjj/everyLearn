package com.coding5.el.lecture.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.coding5.el.common.page.PageVo;
import com.coding5.el.lecture.vo.DetailClassVo;
import com.coding5.el.lecture.vo.LectureVo;
import com.coding5.el.lecture.vo.ReviewVo;

public interface LectureService {
	
	
	//강의 등록
	int insertClassOne(LectureVo lvo);

	
	//강의 목차 등록
	int insertClassDetail(List<LectureVo> list);

	//강의 메인리스트 조회
	public List<LectureVo> getList(PageVo pv);
	
	//강의 메인리스트 조회 - 드로잉
	public List<LectureVo> getListDrawing();

	//강의 메인리스트 조회 - 요리/베이킹
	public List<LectureVo> getListCook();

	//강의 메인리스트 조회 - 운동
	public List<LectureVo> getListWorkout();

	//강의 메인리스트 조회 - 음악
	public List<LectureVo> getListMusic();

	//강의 메인리스트 조회 - it
	public List<LectureVo> getListItTech();

	//강의 메인리스트 조회 - 언어
	public List<LectureVo> getListLanguage();

	//강의 메인리스트 조회 - 금융 /재테크
	public List<LectureVo> getListFinance();

	//강의 검색
	public List<LectureVo> searchBoardList(HashMap<String, String> map);

	//강의 조회수 증가
	public int increaseCount(int bno);

	//강의 상세 조회
	public LectureVo classDetail(int bno);

	//강의 총 갯수
	public int selectLectureCount();

	//강의 - 수강평 조회
	public List<ReviewVo> selectReview(int bno, PageVo pv);

	//수강평 총 갯수
	public int selectReviewCount(int bno);

	//수강평 작성
	public int insertReview(HashMap<String, String> map);

	//수강평 삭제
	public int deleteReview(String reviewNo);

	//수강평 수정
	public int editReview(HashMap<String, String> map);

	//
	int selectBno();


	


}
