package com.coding5.el.class_comm.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.coding5.el.class_comm.vo.ClassCommVo;

public class ClassCommDaoImpl implements ClassCommDao{

	//게시글 등록
	@Override
	public int write(SqlSessionTemplate sst, ClassCommVo vo) {
		return sst.insert("classCommMapper.insertWrite", vo);
	}

}
