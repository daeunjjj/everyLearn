package com.coding5.el.lecture.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.coding5.el.common.page.PageVo;
import com.coding5.el.lecture.vo.DetailClassVo;
import com.coding5.el.lecture.vo.LectureVo;
import com.coding5.el.lecture.vo.ReviewVo;

@Repository
public class LectureDaoImpl implements LectureDao{

	
	//강의 등록
	@Override
	public int insertClassOne(SqlSessionTemplate sst, LectureVo lvo) {

		return sst.insert("lectureMapper.insertClassOne" , lvo);
	}

	
	//강의 목차 등록
	@Override
	public int insertClassDetail(SqlSessionTemplate sst, List<LectureVo> voList) {
		System.out.println("DAO =====");
		///System.out.println(voList);
		return sst.insert("lectureMapper.insertClassDetail", voList);
	}

	//강의 리스트 조회
	@Override
	public List<LectureVo> getList(SqlSessionTemplate sst, PageVo pv) {
		
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		int limit = pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset,limit);
		
		return sst.selectList("lectureMapper.getList", null, rb);
	}

	//강의 메인 - 드로잉
	@Override
	public List<LectureVo> getListDrawing(SqlSessionTemplate sst, PageVo pv) {
		
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		int limit = pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset,limit);
		
		return sst.selectList("lectureMapper.getListDrawing", null, rb);
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

	//강의 총 갯수
	@Override
	public int selectLectureCount(SqlSessionTemplate sst) {
		// TODO Auto-generated method stub
		return sst.selectOne("lectureMapper.selectLectureConut");
	}

	
	//강의 수강평 확인
	@Override
	public List<ReviewVo> selectReview(SqlSessionTemplate sst, int bno, PageVo pv) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		int limit = pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset,limit);

		return sst.selectList("lectureMapper.selectReview", bno, rb );
	}

	//강의 수강평 갯수 확인
	@Override
	public int selectReviewCount(SqlSessionTemplate sst, int bno) {
		// TODO Auto-generated method stub
		return sst.selectOne("lectureMapper.selectReviewCount", bno);
	}

	
	//강의 수강평 작성
	@Override
	public int insertReview(SqlSessionTemplate sst, HashMap<String, String> map) {
		return sst.insert("lectureMapper.insertReview",map);
	}

	//수강평 삭제
	@Override
	public int deleteReview(SqlSessionTemplate sst, String reviewNo) {
		return sst.update("lectureMapper.deleteReview", reviewNo);
	}

	//수강평 수정
	@Override
	public int editReview(SqlSessionTemplate sst, HashMap<String, String> map) {
		return sst.update("lectureMapper.editReview", map);
	}


	@Override
	public int selectBno(SqlSessionTemplate sst) {
		return sst.selectOne("lectureMapper.selectBno");
	}

	//찜 목록에 이 강의 있는지 확인하기
	@Override
	public int checkWish(HashMap<String, String> map, SqlSessionTemplate sst) {
		return sst.selectOne("cartMapper.checkWish", map);
	}

	//장바구니에 이 강의 있는지 확인하기
	@Override
	public int checkCart(HashMap<String, String> map, SqlSessionTemplate sst) {
		return sst.selectOne("cartMapper.checkCart", map);
	}

	//구매 내역에 이 강의 있는지 확인하기
	@Override
	public int checkBuy(HashMap<String, String> map, SqlSessionTemplate sst) {
		return sst.selectOne("cartMapper.checkBuy", map);
	}

	//리뷰 작성했는지 확인
	@Override
	public int checkReview(HashMap<String, String> map, SqlSessionTemplate sst) {
		return sst.selectOne("lectureMapper.checkReview", map);
	}



	

}
