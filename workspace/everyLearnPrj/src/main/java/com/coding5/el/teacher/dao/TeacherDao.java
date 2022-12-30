package com.coding5.el.teacher.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.coding5.el.member.vo.MemberVo;
import com.coding5.el.teacher.vo.TeacherVo;

public interface TeacherDao {
	
	//������
	public int insertTeacher(SqlSessionTemplate sst,TeacherVo vo);

	public int insertImg(SqlSessionTemplate sst, TeacherVo vo);

	//강사디테일
	public List<TeacherVo> selectTeacherDetail(SqlSessionTemplate sst, String teacherNick);

}
