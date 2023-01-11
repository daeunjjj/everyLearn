package com.coding5.el.member.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.coding5.el.class_comm.vo.ClassCommVo;
import com.coding5.el.member.vo.ClassListVo;
import com.coding5.el.member.vo.MemberVo;
import com.coding5.el.member.vo.PointVo;
import com.coding5.el.member.vo.TeacherMemberVo;


public interface MemberDao {

	public int insertMember(SqlSessionTemplate sst, MemberVo vo);
	
	public MemberVo selectMemberOne(SqlSessionTemplate sst, MemberVo vo);
	
	public String selectIdDup(SqlSessionTemplate sst, String memberId);

	public String selectNickDup(SqlSessionTemplate sst, String memberNick);

	public String idFindAjax(SqlSessionTemplate sst, MemberVo findVo);

	public int updateMember(SqlSessionTemplate sst, MemberVo vo);

	public List<ClassCommVo> selectCommWriteList(SqlSessionTemplate sst, String memberNo);

	public List<ClassListVo> selectClassReviewList(SqlSessionTemplate sst, String mNo);
	
	public String selectEncPassword(SqlSessionTemplate sst, HashMap<String, String> deleteInfo);

	public int updateDeleteMember(SqlSessionTemplate sst, String memberNo);

	public String selectTeacherCheck(SqlSessionTemplate sst, MemberVo loginMember);

	public List<PointVo> selectPointList(SqlSessionTemplate sst, String mpn);

	public List<ClassListVo> selectMyClassList(SqlSessionTemplate sst, String memberNo);

//	public List<ClassListVo> selectmyClassInfoList(SqlSessionTemplate sst, List<ClassListVo> myClassList);

	public ClassListVo selectmyClassInfoList(SqlSessionTemplate sst, ClassListVo classListVo);

	public List<ClassListVo> selectClassDetailList(SqlSessionTemplate sst, String classNo);

	public List<ClassListVo> selectClassDetailInfoList(SqlSessionTemplate sst, String classNo);

	public int insertMember(SqlSessionTemplate sst, HashMap<String, Object> progressMap);

//	public TeacherMemberVo selectTeacherInfo(SqlSessionTemplate sst, String memberNo);
//
//	public List<TeacherMemberVo> selectClassList(SqlSessionTemplate sst, String memberNo);

}
