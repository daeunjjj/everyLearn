package com.coding5.el.emp.comm.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding5.el.emp.comm.dao.EmpCommDao;
import com.coding5.el.emp.comm.vo.CommentVo;
import com.coding5.el.emp.comm.vo.EmpCommVo;
import com.coding5.el.emp.comm.vo.LikeVo;
import com.coding5.el.emp.service.EmpService;
import com.coding5.el.notice.vo.PageVo;



@Service
public class EmpCommServiceImpl implements EmpCommService{
	
	@Autowired private SqlSessionTemplate sst;
	@Autowired private EmpCommDao empCommDao;
	
	
	@Override	//글쓰기
	public int write(EmpCommVo vo) throws Exception {
		return empCommDao.insertWrite(sst, vo);
	}


	@Override	//글 갯수
	public int getEmpCommCnt() throws Exception {
		return empCommDao.getEmpCommCnt(sst);
	}


	@Override	//커뮤 리스트
	public List<EmpCommVo> getEmpCommList(PageVo pageVo) throws Exception {
		return empCommDao.getEmpCommList(sst, pageVo);
	}


	@Override	//조회수 +
	public int increaseHit(String no) throws Exception {
		return empCommDao.increaseHit(sst, no);
	}


	@Override	//상세조회
	public EmpCommVo selectDetail(String no) throws Exception {
		return empCommDao.selectDetail(sst, no);
	}


	@Override	//글 수정하기
	public int editEmpComm(EmpCommVo vo) throws Exception {
		return empCommDao.editEmpComm(sst, vo);
	}


	@Override	//글 삭제하기
	public int deleteEmpComm(String no) throws Exception {
		return empCommDao.deleteEmpComm(sst, no);
	}


	@Override
	public LikeVo findHeart(String no, String memberNo) throws Exception {
		Map<String, String> number = new HashMap<String, String>();
		number.put("no", no);
		number.put("memberNo", memberNo);
		
		return empCommDao.findHeart(sst, number);
	}


	@Override
	public int insertHeart(LikeVo heart) throws Exception {
		// 좋아요가 DB에 저장이 되는것이 없으면 0이 그대로 리턴으로 넘어감
		int result = 0;
		// 좋아요가 이미 있는지 확인하는 코드
		LikeVo find = empCommDao.findHeart(sst, heart);
		
		// find가 null이면 좋아요가 없는 상태이므로 정보 저장
		// find가 null이 아니면 좋아요가 있는 상태이므로 정보 삭제
		if(find == null) {
			// insert의 리턴값은 DB에 성공적으로 insert된 갯수를 보내므로 result가 1이 됨
			result = empCommDao.insertHeart(sst, heart);
		} else {
			empCommDao.deleteHeart(sst, heart);
		}
		
		// 0 or 1이 담겨져서 @Controller에 보냄.
		return result;
	}


	@Override
	public void insertComment(CommentVo vo) throws Exception {
		empCommDao.insertComment(sst, vo);
	}


	@Override
	public List<CommentVo> getCommentList(CommentVo vo) throws Exception {
		return empCommDao.selectCommentList(sst, vo);
	}

	





	

}
