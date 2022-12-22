package com.coding5.el.class_comm.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.coding5.el.class_comm.vo.ClassCommVo;

public interface ClassCommDao {

	int write(SqlSessionTemplate sst, ClassCommVo vo);

}
