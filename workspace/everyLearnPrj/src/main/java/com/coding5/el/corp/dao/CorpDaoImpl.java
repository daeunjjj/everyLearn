package com.coding5.el.corp.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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


}
