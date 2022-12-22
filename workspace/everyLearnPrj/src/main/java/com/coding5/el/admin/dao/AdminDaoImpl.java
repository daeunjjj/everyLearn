package com.coding5.el.admin.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.coding5.el.admin.vo.AdminVo;
import com.coding5.el.common.page.PageVo;
@Repository
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
	public int updateAdminByNo(SqlSessionTemplate sst, AdminVo vo) {
		// 관리자 내 정보 업데이트
		return sst.update("adminMapper.updateAdminByNo",vo);
	}

	@Override
	public int selectAdminCount(SqlSessionTemplate sst) {
		// 관리자 총 수
		return sst.selectOne("adminMapper.selectAdminConut");
	}

	@Override
	public List<AdminVo> selectAdminList(SqlSessionTemplate sst, PageVo pv) {
		// 관리자 리스트 가져오기
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		int limit = pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset,limit);
		
		return sst.selectList("adminMapper.selectAdminList",null,rb);
	}

	@Override
	public AdminVo selectOneAdminByNo(SqlSessionTemplate sst, String no) {
		// 관리자 상세정보
		return sst.selectOne("selectOneAdminByNo",no);
	}



}
