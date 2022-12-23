package com.coding5.el.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.coding5.el.admin.vo.AdminVo;
import com.coding5.el.common.page.PageVo;
import com.coding5.el.common.vo.SearchVo;

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
	

	
}
