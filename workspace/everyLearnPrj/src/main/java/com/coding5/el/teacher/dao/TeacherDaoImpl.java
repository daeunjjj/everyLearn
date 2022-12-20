package com.coding5.el.teacher.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.coding5.el.member.vo.MemberVo;
import com.coding5.el.teacher.vo.TeacherVo;

@Repository
public class TeacherDaoImpl implements TeacherDao{
	
	//������
	public int insertTeacher(SqlSessionTemplate sst,TeacherVo vo) {
		return sst.insert("teacherMapper.insertTeacher", vo);
	}

	//�̹��� ���
	@Override
	public int insertImg(SqlSessionTemplate sst, TeacherVo vo) {
		return sst.insert("teacherMapper.insertImg", vo);
	}

}
