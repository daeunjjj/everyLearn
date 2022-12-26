package com.coding5.el.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.coding5.el.admin.vo.AdminVo;
import com.coding5.el.common.page.PageVo;
import com.coding5.el.common.vo.SearchVo;
import com.coding5.el.member.vo.MemberVo;
import com.coding5.el.member.vo.PointVo;

public interface AdminDao {
	// 관리자 하나 가져오기
	public AdminVo selectOneAdminByVo(SqlSessionTemplate sst, AdminVo Vo);
	
	// 관리자 하나 등록
	public int insertAdminOne(SqlSessionTemplate sst, AdminVo vo);
	
	// 관리자 수정
	public int updateAdmin(SqlSessionTemplate sst, AdminVo vo);
	
	// 관리자 총 수
	public int selectAdminCount(SqlSessionTemplate sst, SearchVo svo);
	
	// 관리자 리스트 가져오기
	public List<AdminVo> selectAdminList(SqlSessionTemplate sst, PageVo pv, SearchVo svo);
	
	// 관리자 하나 넘버로 가져오기
	public AdminVo selectOneAdminByNo(SqlSessionTemplate sst, String no);
	
	// 마스터 관리자 아이디로 아이디 하나 가져오기
	public AdminVo selectOneAdminById(SqlSessionTemplate sst, String id);
	
	// 학생 회원 수 가져오기
	public int selectStudentCount(SearchVo svo,SqlSessionTemplate sst);
	
	// 학생 회원 가져오기
	public List<MemberVo> selectStudentList(SqlSessionTemplate sst, PageVo pv, SearchVo svo);
	
	// 학생 한명 넘버로 가져오기
	public MemberVo selectStudentOneByNo(SqlSessionTemplate sst, String no);
	
	// 포인트 리스트 가져오기
	public List<PointVo> selectPointListByNo(SqlSessionTemplate sst, String no);
	
	// 포인트 인서트
	public int insertPoint(SqlSessionTemplate sst, PointVo vo);
	
	// 학생회원 수정
	public int updateStudent(SqlSessionTemplate sst, PointVo vo);
	

	
}
