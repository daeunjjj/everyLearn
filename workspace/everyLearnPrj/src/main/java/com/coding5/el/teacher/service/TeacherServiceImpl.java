package com.coding5.el.teacher.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding5.el.member.vo.MemberVo;
import com.coding5.el.teacher.dao.TeacherDao;
import com.coding5.el.teacher.vo.TeacherVo;

@Service
public class TeacherServiceImpl implements TeacherService{
	
	@Autowired
	private SqlSessionTemplate sst;
	
	@Autowired
	private TeacherDao teacherDao;

	//강사 등록
	@Override
	public int teacherEnroll(TeacherVo vo) {

		int result = teacherDao.insertTeacher(sst, vo);
		
		return result;
	}

	//강사 프로필 등록
	@Override
	public int teacherImgEnroll(TeacherVo vo) {
		int imgOk = teacherDao.insertImg(sst, vo);
		return imgOk;
	}


}
