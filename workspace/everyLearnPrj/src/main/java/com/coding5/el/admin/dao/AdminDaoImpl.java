package com.coding5.el.admin.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.coding5.el.admin.vo.AdminVo;
import com.coding5.el.common.page.PageVo;
import com.coding5.el.common.vo.SearchVo;
import com.coding5.el.member.vo.MemberVo;
import com.coding5.el.member.vo.PointVo;

import lombok.extern.slf4j.Slf4j;
@Repository
@Slf4j
public class AdminDaoImpl implements AdminDao{

	@Override
	public AdminVo selectOneAdminByVo(SqlSessionTemplate sst, AdminVo vo) {
		// 관리자 아이디 하나 가져오기
		return sst.selectOne("adminMapper.selectOneAdminByVo",vo);
	}

	@Override
	public int insertAdminOne(SqlSessionTemplate sst, AdminVo vo) {
		// 관리자 아이디 하나 인서트
		return sst.insert("adminMapper.insertAdminOne",vo);
	}

	@Override
	public int updateAdmin(SqlSessionTemplate sst, AdminVo vo) {
		// 관리자 내 정보 업데이트
		return sst.update("adminMapper.updateAdmin",vo);
	}

	@Override
	public int selectAdminCount(SqlSessionTemplate sst, SearchVo svo) {
		// 관리자 총 수
		return sst.selectOne("adminMapper.selectAdminConut",svo);
	}

	@Override
	public List<AdminVo> selectAdminList(SqlSessionTemplate sst, PageVo pv, SearchVo svo) {
		// 관리자 리스트 가져오기
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		int limit = pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset,limit);
		
		return sst.selectList("adminMapper.selectAdminList",svo,rb);
	}

	@Override
	public AdminVo selectOneAdminByNo(SqlSessionTemplate sst, String no) {
		// 관리자 상세정보
		return sst.selectOne("adminMapper.selectOneAdminByNo",no);
	}

	@Override
	public AdminVo selectOneAdminById(SqlSessionTemplate sst, String id) {
		// 마스터 관리자 아이디 하나 가져오기
		return sst.selectOne("adminMapper.selectOneAdminById", id);
	}

	@Override
	public int selectStudentCount(SearchVo svo,SqlSessionTemplate sst) {
		// 학생 회원 수 가져오기
		return sst.selectOne("adminMapper.selectStudentConut",svo);
	}

	@Override
	public List<MemberVo> selectStudentList(SqlSessionTemplate sst, PageVo pv, SearchVo svo) {
		// 학생회원 리스트 가져오기
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		int limit = pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset,limit);
		
		return sst.selectList("adminMapper.selectStudentList", svo, rb);
	}

	@Override
	public MemberVo selectStudentOneByNo(SqlSessionTemplate sst, String no) {
		// 학생회원 넘버로 가져오기
		return sst.selectOne("adminMapper.selectStudentOneByNo",no);
	}

	@Override
	public List<PointVo> selectPointListByNo(SqlSessionTemplate sst, String no) {
		// 포인트 리스트 가져오기
		return sst.selectList("adminMapper.selectPointListByNo",no);
	}

	@Override
	public int insertPoint(SqlSessionTemplate sst, PointVo vo) {
		// 포인트 내역 인서트
		return sst.insert("adminMapper.insertPoint",vo);
	}

	@Override
	public int updateStudent(SqlSessionTemplate sst, PointVo vo) {
		// 학생회원 포인트 업뎃
		return sst.update("adminMapper.updateStudent",vo);
	}
	


}
