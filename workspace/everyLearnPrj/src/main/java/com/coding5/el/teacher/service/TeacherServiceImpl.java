package com.coding5.el.teacher.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding5.el.member.vo.MemberVo;
import com.coding5.el.member.vo.TeacherMemberVo;
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

	//이미지등록
	@Override
	public int teacherImgEnroll(TeacherVo vo) {
		int imgOk = teacherDao.insertImg(sst, vo);
		return imgOk;
	}

	//강사디테일
	@Override
	public List<TeacherVo> teacherDetail(String teacherNick) {
		
		return teacherDao.selectTeacherDetail(sst, teacherNick);
	}
	
	@Override
	public TeacherMemberVo teacherInfo(String memberNo) {
		return teacherDao.selectTeacherInfo(sst, memberNo);
	}

	//강사 > 강의리스트
	@Override
	public List<TeacherMemberVo> teacherClassList(String memberNo) {
		return teacherDao.selectClassList(sst, memberNo);
	}

	//티처넘버 받기
	@Override
	public TeacherVo newTeacherSelect(MemberVo mvo) {
		return teacherDao.selectNewTeacher(sst,mvo);
	}


}
