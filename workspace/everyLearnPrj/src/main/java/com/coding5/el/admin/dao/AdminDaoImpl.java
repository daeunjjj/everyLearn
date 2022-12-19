package com.coding5.el.admin.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.coding5.el.admin.vo.AdminVo;
@Repository
public class AdminDaoImpl implements AdminDao{

	@Override
	public AdminVo selectOneAdminById(SqlSessionTemplate sst, String id) {
		// 관리자 아이디 하나 가져오기
		return sst.selectOne("adminMapper.selectOneAdminById",id);
	}

}
