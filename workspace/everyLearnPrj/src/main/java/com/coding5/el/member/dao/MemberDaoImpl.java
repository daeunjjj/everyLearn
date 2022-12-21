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

	//아이디 중복
	public String selectIdDup(SqlSessionTemplate sst, String memberId) {
		return sst.selectOne("memberMapper.selectIdDup", memberId);
	}

	//닉네임 중복
	public String selectNickDup(SqlSessionTemplate sst, String memberNick) {
		return sst.selectOne("memberMapper.selectMemberNick", memberNick);
	}

}
