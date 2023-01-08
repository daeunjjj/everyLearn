package com.coding5.el.lecture.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.coding5.el.common.page.PageVo;
import com.coding5.el.lecture.vo.DetailClassVo;
import com.coding5.el.lecture.vo.LectureVo;
import com.coding5.el.lecture.vo.ReviewVo;

public interface LectureDao {
	
	
	
	//insert lecture
	public int insertClassOne(SqlSessionTemplate sst, LectureVo lvo);

	//insert 세부사항 - 목차
	public int insertClassDetail(SqlSessionTemplate sst, List<LectureVo> list);

	//강의 전체 목록 리스트 조회
	public List<LectureVo> getList(SqlSessionTemplate sst, PageVo pv);

	//강의 전체 목록 리스트 조회 - 드로잉
	public List<LectureVo> getListDrawing(SqlSessionTemplate sst, PageVo pv);

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

	//강의 상세 조회
	public LectureVo classDetail(SqlSessionTemplate sst, int bno);

	//강의 조회수 확인
	public int increaseCount(SqlSessionTemplate sst, int bno);

	//강의 총 갯수확인
	public int selectLectureCount(SqlSessionTemplate sst);

	//강의 수강평 확인
	public List<ReviewVo> selectReview(SqlSessionTemplate sst, int bno, PageVo pv);

	//강의 수강평 갯수 확인
	public int selectReviewCount(SqlSessionTemplate sst, int bno);

	//수강평 작성
	public int insertReview(SqlSessionTemplate sst, HashMap<String, String> map);

	//수강평 삭제
	public int deleteReview(SqlSessionTemplate sst, String reviewNo);

	//수강평 수정
	public int editReview(SqlSessionTemplate sst, HashMap<String, String> map);


	public int selectBno(SqlSessionTemplate sst);

	//찜 목록에 이 강의 있는지 확인하기
	public int checkWish(HashMap<String, String> map, SqlSessionTemplate sst);

	//장바구니에 이 강의 있는지 확인하기 
	public int checkCart(HashMap<String, String> map, SqlSessionTemplate sst);

	//구매 내역에 이 강의 있는지 확인하기
	public int checkBuy(HashMap<String, String> map, SqlSessionTemplate sst);

	//리뷰 작성했는지 확인
	public int checkReview(HashMap<String, String> map, SqlSessionTemplate sst);



}
