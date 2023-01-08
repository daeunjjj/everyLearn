package com.coding5.el.teacher.service;

import java.util.List;

import com.coding5.el.member.vo.MemberVo;
import com.coding5.el.member.vo.TeacherMemberVo;
import com.coding5.el.teacher.vo.TeacherVo;

public interface TeacherService {
	//강사 등록
	public int teacherEnroll(TeacherVo vo);
	
	public int teacherImgEnroll(TeacherVo vo);

	//강사디테일
	public List<TeacherVo> teacherDetail(String teacherNick);

	//강사인포
	public TeacherMemberVo teacherInfo(String memberNo);

	public List<TeacherMemberVo> teacherClassList(String memberNo);



}
