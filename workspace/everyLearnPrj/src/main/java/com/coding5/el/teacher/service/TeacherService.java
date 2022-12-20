package com.coding5.el.teacher.service;

import com.coding5.el.member.vo.MemberVo;
import com.coding5.el.teacher.vo.TeacherVo;

public interface TeacherService {
	//강사 등록
	public int teacherEnroll(TeacherVo vo);
	
	public int teacherImgEnroll(TeacherVo vo);



	//강사조회
}
