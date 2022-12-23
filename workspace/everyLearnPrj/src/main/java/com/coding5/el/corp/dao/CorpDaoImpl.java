package com.coding5.el.corp.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.coding5.el.corp.vo.CorpVo;

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

}
