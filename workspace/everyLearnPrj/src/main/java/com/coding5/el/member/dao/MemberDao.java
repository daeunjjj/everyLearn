package com.coding5.el.member.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.coding5.el.member.vo.MemberVo;


public interface MemberDao {

	public int insertMember(SqlSessionTemplate sst, MemberVo vo);
	
	public MemberVo selectMemberOne(SqlSessionTemplate sst, MemberVo vo);
	
	public String selectIdDup(SqlSessionTemplate sst, String memberId);

}
