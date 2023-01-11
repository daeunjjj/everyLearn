package com.coding5.el.member.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.coding5.el.class_comm.vo.ClassCommVo;
import com.coding5.el.member.vo.ClassListVo;
import com.coding5.el.member.vo.MemberVo;
import com.coding5.el.member.vo.PointVo;
import com.coding5.el.member.vo.TeacherMemberVo;

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
	}

	@Override
	public List<ClassCommVo> selectCommWriteList(SqlSessionTemplate sst, String memberNo) {
		return sst.selectList("memberMapper.selectCommWriteList", memberNo);
	}

	@Override
	public List<ClassListVo> selectClassReviewList(SqlSessionTemplate sst, String mNo) {
		return sst.selectList("memberMapper.selectClassReviewList", mNo);
	}

	//탈퇴 > 암호화 비번조회
	@Override
	public String selectEncPassword(SqlSessionTemplate sst, HashMap<String, String> deleteInfo) {
		return sst.selectOne("memberMapper.selectEncPassword", deleteInfo);
	}

	@Override
	public int updateDeleteMember(SqlSessionTemplate sst, String memberNo) {
		return sst.update("memberMapper.updateDeleteMember",memberNo );
	}

	//강사체크
	@Override
	public String selectTeacherCheck(SqlSessionTemplate sst, MemberVo loginMember) {
		return sst.selectOne("memberMapper.selectTeacherCheck", loginMember);
	}

	//point list
	@Override
	public List<PointVo> selectPointList(SqlSessionTemplate sst, String mpn) {
		return sst.selectList("memberMapper.selectPointList", mpn);
	}

	//my classList
	@Override
	public List<ClassListVo> selectMyClassList(SqlSessionTemplate sst, String memberNo) {
		return sst.selectList("memberMapper.selectMyClassList", memberNo);
	}

//	//my classInfoList
//	@Override
//	public List<ClassListVo> selectmyClassInfoList(SqlSessionTemplate sst, List<ClassListVo> myClassList) {
//		log.info("디에이오myClassList :: " , myClassList);
//		return sst.selectList("memberMapper.selectmyClassInfoList", myClassList);
//	}

	@Override
	public ClassListVo selectmyClassInfoList(SqlSessionTemplate sst, ClassListVo classListVo) {
		ClassListVo s = sst.selectOne("memberMapper.selectmyClassInfoList", classListVo);
		log.info("classListVo ::: " + classListVo);
		return s;
	}

	@Override
	public List<ClassListVo> selectClassDetailList(SqlSessionTemplate sst, String classNo) {
		return sst.selectList("memberMapper.selectClassDetailList", classNo);
	}

	//학습률 강의 정보
	@Override
	public List<ClassListVo> selectClassDetailInfoList(SqlSessionTemplate sst, String classNo) {
		return sst.selectList("memberMapper.selectmyClassInfoList", classNo);
	}

	@Override
	public int insertMember(SqlSessionTemplate sst, HashMap<String, Object> progressMap) {
		log.info("progressMap"+progressMap);
		return sst.insert("memberMapper.insertMemberStudy", progressMap);
	}

//	//teacher info
//	@Override
//	public TeacherMemberVo selectTeacherInfo(SqlSessionTemplate sst, String memberNo) {
//		return sst.selectOne("memberMapper.selectTeacherInfo", memberNo);
//	}
//
//	@Override
//	public List<TeacherMemberVo> selectClassList(SqlSessionTemplate sst, String memberNo) {
//		return sst.selectList("memberMapper.selectClassList", memberNo);
//	}
	
}
