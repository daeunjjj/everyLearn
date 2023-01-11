package com.coding5.el.member.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.coding5.el.class_comm.vo.ClassCommVo;
import com.coding5.el.member.vo.ClassListVo;
import com.coding5.el.member.vo.MemberVo;
import com.coding5.el.member.vo.PointVo;
import com.coding5.el.member.vo.TeacherMemberVo;

public interface MemberService {
	//회원가입
	public int join(MemberVo vo);

	public MemberVo login(MemberVo vo);

	//아이디 중복
	public String idDup(String memberId);

	//닉네임 중복
	public String nickDup(String memberNick);

	//아이디 찾기
	public String idFind(MemberVo findVo);

	public MemberVo updateMember(MemberVo vo);

	//커뮤니티 내 작성글 조회
	public List<ClassCommVo> commWrite_List(String memberNo);

	//수강평 작성글 조회
	public List<ClassListVo> classReviewList(String mNo);

	//회원탈퇴 > 패스워드 일치 조회
	public String passwordCheck(HashMap<String, String> deleteInfo);

	//회원 탈퇴 > 탈퇴처리
	public int deleteMember(String memberNo);

	//강사체크
	public String teacherCheck(MemberVo loginMember);

	//포인트 리스트
	public List<PointVo> pointList(String mpn);

	//내 강의 조회
	public List<ClassListVo> myClassList(String memberNo);

	//내 강의 정보 조회
	public List<ClassListVo> myClassInfoList(List<ClassListVo> myClassList);
	//강의 세부 리스트 조회
	public List<ClassListVo> classDetailList(String classNo);

	//학습률 강의 정보
	public List<ClassListVo> classDetailInfoList(String classNo);
	//내 스터디 인서트
	public int insertMemberStudy(String mn,List<ClassListVo> classDetailList);
	
	
	

//	//강사 정보
//	public TeacherMemberVo teacherInfo(String memberNo);
//
//	public List<TeacherMemberVo> teacherClassList(String memberNo);
	
}
