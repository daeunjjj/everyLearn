package com.coding5.el.class_comm.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding5.el.class_comm.dao.ClassCommDao;
import com.coding5.el.class_comm.vo.ClassCommVo;
@Service
public class ClassCommServiceImpl implements ClassCommService{

	@Autowired
	private SqlSessionTemplate sst;
	
	@Autowired
	private ClassCommDao dao;
	
	//게시글 등록
	@Override
	public int write(ClassCommVo vo) {
		return dao.write(sst, vo);
	}

}
