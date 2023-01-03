package com.coding5.el.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.coding5.el.member.vo.MemberVo;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Repository
public class MemberDaoImpl implements MemberDao{

	public int insertMember(SqlSessionTemplate sst, MemberVo vo) {
		return sst.insert("memberMapper.insertMember", vo);
	}

	public MemberVo selectMemberOne(SqlSessionTemplate sst, MemberVo vo) {
		
		MemberVo loginMember = sst.selectOne("memberMapper.selectMemberOne", vo);
		log.info("dao록인멤버 : " + loginMember);
		
		if(loginMember == null) {
			
			log.info("error 디에이오 로그인멤버 : " + loginMember);
			return loginMember;
		}
		
		return loginMember;
	}

	//아이디 중복
	public String selectIdDup(SqlSessionTemplate sst, String memberId) {
		return sst.selectOne("memberMapper.selectIdDup", memberId);
	}

	//닉네임 중복
	public String selectNickDup(SqlSessionTemplate sst, String memberNick) {
		return sst.selectOne("memberMapper.selectMemberNick", memberNick);
	}



	@Override
	public String idFindAjax(SqlSessionTemplate sst, MemberVo findVo) {
		return sst.selectOne("memberMapper.selectIdFind", findVo);
	}

	@Override
	public int updateMember(SqlSessionTemplate sst, MemberVo vo) {
		return sst.update("memberMapper.updateMemberOne",vo);
	}}
