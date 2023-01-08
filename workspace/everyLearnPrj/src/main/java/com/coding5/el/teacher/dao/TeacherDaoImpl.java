package com.coding5.el.teacher.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.coding5.el.member.vo.MemberVo;
import com.coding5.el.member.vo.TeacherMemberVo;
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

	//강사 디테일
	@Override
	public List<TeacherVo> selectTeacherDetail(SqlSessionTemplate sst, String teacherNick) {
		return sst.selectList("teacherMapper.selectTeacher", teacherNick);
	}
	
	//teacher info
	@Override
	public TeacherMemberVo selectTeacherInfo(SqlSessionTemplate sst, String memberNo) {
		return sst.selectOne("teacherMapper.selectTeacherInfo", memberNo);
	}

	@Override
	public List<TeacherMemberVo> selectClassList(SqlSessionTemplate sst, String memberNo) {
		return sst.selectList("teacherMapper.selectClassList", memberNo);
	}

}
