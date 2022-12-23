package com.coding5.el.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.coding5.el.admin.vo.AdminVo;
import com.coding5.el.common.page.PageVo;
import com.coding5.el.common.vo.SearchVo;

public interface AdminService {
	
	//로그인 
	public AdminVo login(AdminVo vo);
	
	// 중복 체크
	public String dupCheck(AdminVo vo);
	
	// 관리자등록
	public int join(AdminVo vo);
	
	// 관리자 내 정보 수정
	public AdminVo myInfoModify(AdminVo vo);
	
	// 관리자 총 수 조회
	public int selectAdminCount(SearchVo svo);
	
	// 관리자 리스트 조회
	public List<AdminVo> selectAdminList(PageVo pv, SearchVo svo);
	
	// 관리자 상세 조회
	public AdminVo adminDetail(String no);
	
	// 마스터 관리자 정보 수정
	public int adminModify(AdminVo vo);
	
}
