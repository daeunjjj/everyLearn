package com.coding5.el.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.coding5.el.member.vo.MemberVo;

@Repository
public class MemberDaoImpl implements MemberDao{

	public int insertMember(SqlSessionTemplate sst, MemberVo vo) {
		return sst.insert("memberMapper.insertMember", vo);
	}

	public MemberVo selectMemberOne(SqlSessionTemplate sst, MemberVo vo) {
		return sst.selectOne("memberMapper.selectMemberOne", vo);
	}

}
