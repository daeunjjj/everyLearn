package com.coding5.el.corp.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.coding5.el.common.page.PageVo;
import com.coding5.el.corp.vo.CorpVo;
import com.coding5.el.corp.vo.EmploymentVo;

@Repository
public class CorpDaoImpl implements CorpDao{

	// 회원가입
	@Override
	public int insertCorpMember(SqlSessionTemplate sst, CorpVo vo) {
		return sst.insert("corpMapper.insertCorpMember", vo);
	}

	// 로그인
	@Override
	public CorpVo selectOneCorpMember(SqlSessionTemplate sst, CorpVo vo) {
		return sst.selectOne("corpMapper.selectOneCorpMember", vo);
	}

	// 아이디 중복체크
	@Override
	public CorpVo checkId(SqlSessionTemplate sst, String id) {
		return sst.selectOne("corpMapper.selectCorpMemberById", id);
	}
	
	// 기업 마이페이지(회사정보 화면)
	@Override
	public CorpVo selectOneCorpInfo(SqlSessionTemplate sst, CorpVo vo) {
		return sst.selectOne("corpMapper.selectOneCorpInfo", vo);
	}
	
	// 기업 마이페이지(회사정보 수정)
	@Override
	public int updateCorpInfo(SqlSessionTemplate sst, CorpVo vo) {
		return sst.update("corpMapper.updateCorpInfo", vo);
	}

	// 기업 채용 공고 만들기
	@Override
	public int insertJobPost(SqlSessionTemplate sst, EmploymentVo vo) {
		return sst.insert("corpMapper.insertJobPost", vo);
	}

	// 채용중 페이징
	@Override
	public int selectHiringCnt(SqlSessionTemplate sst, String corpNo) {
		return sst.selectOne("corpMapper.selectHiringCnt", corpNo);
	}

	// 채용중 페이지 리스트
	@Override
	public List<EmploymentVo> selectHiringList(SqlSessionTemplate sst, PageVo pv, String corpNo) {
		
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		int limit = pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset,limit);
		
		return sst.selectList("corpMapper.selectHiringList", corpNo, rb);
	}

	// 기업 로고 이미지 인서트
	@Override
	public void insertCorpLogo(SqlSessionTemplate sst, CorpVo vo) {
		sst.insert("corpMapper.insertCorpLogo", vo);
	}

	// 기업 대표 이미지 인서트
	@Override
	public void insertCorpThumb(SqlSessionTemplate sst, CorpVo vo) {
		sst.insert("corpMapper.insertCorpThumb", vo);
	}

	// 채용 공고 지우기
	@Override
	public int updateJobPost(SqlSessionTemplate sst, String no) {
		return sst.update("corpMapper.updateJobPost", no);
	}

	// 채용 마감 페이징
	@Override
	public int selectDeadlineCnt(SqlSessionTemplate sst, String corpNo) {
		return sst.selectOne("corpMapper.selectDeadlineCnt", corpNo);
	}

	// 채용 마감 리스트
	@Override
	public List<EmploymentVo> getDeadlineList(SqlSessionTemplate sst, PageVo pv, String corpNo) {
		
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		int limit = pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset,limit);
		
		return sst.selectList("corpMapper.getDeadlineList", corpNo, rb);
	}



}
