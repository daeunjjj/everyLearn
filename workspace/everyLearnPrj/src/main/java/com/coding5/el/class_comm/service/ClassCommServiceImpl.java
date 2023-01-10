package com.coding5.el.class_comm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding5.el.class_comm.dao.ClassCommDao;
import com.coding5.el.class_comm.vo.ClassCommVo;
import com.coding5.el.class_comm.vo.CommentVo;
import com.coding5.el.common.page.PageVo;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class ClassCommServiceImpl implements ClassCommService{

	@Autowired
	private SqlSessionTemplate sst;
	
	@Autowired
	private ClassCommDao dao;
	
	//게시글 등록
	@Override
	public int write(ClassCommVo vo) {
		int result = dao.write(sst, vo);
		return result;
	}

	//질답 게시판
	@Override
	public List<ClassCommVo> qnaList() {
		return dao.selectQnaInfo(sst);
	}

	//게시글 디테일
	@Override
	public ClassCommVo detailVo(HashMap<String, String> likeMap) {
		ClassCommVo detailVo = dao.selectDetailVo(sst, likeMap);
		log.info("서비스 디테일 브이오 체크 :: " + detailVo);
		//좋아요 카운트> 여기선 원래 있던 값 넣어주고, ajax에서 따로 업데이트!
		String likeCnt = dao.selectLikeCnt(sst,likeMap);
		detailVo.setLikeCnt(likeCnt);
		//좋아요 여부
		int likeupCheck1 = dao.selectLikeupCheck(sst, likeMap);
		log.info("서비스 디테일 라이크 체크 :: " + likeupCheck1);
		String likeupCheck = Integer.toString(likeupCheck1);
		detailVo.setLikeupCheck(likeupCheck);
		
		return detailVo;
	}


	//스터디 게시판
	@Override
	public List<ClassCommVo> studyList(PageVo pv, Map<String, String> search) {
		return dao.selectstudyList(sst, pv, search);
	}
	
	

	//자유게시판
	@Override
	public List<ClassCommVo> freeList(String orderBy) {
		return dao.selectFreeList(sst, orderBy);
	}

	//댓글 정보 조회
	@Override
	public List<CommentVo> commentList(String classCommNo) {
		return dao.selectCommentList(sst, classCommNo);
	}

	//댓글 인서트
	@Override
	public int writeComment(CommentVo vo) {
		return dao.insertComment(sst, vo);
	}

	//댓글 작성 한 개 조회
	@Override
	public CommentVo commemtOne(CommentVo vo) {
		return dao.selectCommentOne(sst, vo);
	}

	//게시글 삭제
	@Override
	public int deleteWrite(String classCommNo) {
		
		dao.deleteWriteComment(sst, classCommNo);
		
		return dao.deleteWriteWrite(sst, classCommNo);
	}

	//게시글 갯수 조회(페이징)
	@Override
	public int selectCnt(Map<String, String> search) {
		return dao.selectCntOne(sst,search);
	}

	//신고 인서트 정보
	@Override
	public int reportInfo(ClassCommVo reportVo) {
		return dao.insertReportInfo(sst,reportVo);
	}

	//신고정보가져오기
	@Override
	public ClassCommVo selectReportInfo() {
		return dao.selectRefortInfo(sst);
	}

	//신고인서트
	@Override
	public int insertReport(HashMap<String, String> reportMap) {

			return dao.insertReport(sst, reportMap);
	}

	//좋아요여부체크
	@Override
	public int likeCheck(HashMap<String, String> likeupMap) {
		
		int likeCheck = dao.selectLikeupCheck(sst, likeupMap);
		//돌아온게 0 이면 > 좋아요 아직 == insert 해줘야!
		int result = 0;
		if(likeCheck == 0) {
			result = dao.insertLike(sst, likeupMap);
			//만약 인서트 성공했다면 > 그대로 1 return 되도록
			if(result == 1) {
				return result;
			}else {
				log.info("error");
			}
		}else {
			result = dao.deleteLike(sst, likeupMap);
		}
			
			if(result == 1) {
				//만약 delete 성공했다면 > 0 return 되도록
				result = 0;
			}else {
				log.info("error");
			}
			
			return result;
		}

	//에이젝스 좋아요 카운트
	@Override
	public String likeCntAjax(String classCommNo) {
		return dao.selectLikeCntAjax(sst, classCommNo);
	}
		
	
	
}//서비스레이어





