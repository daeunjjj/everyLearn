package com.coding5.el.emp.comm.service;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.coding5.el.emp.comm.dao.EmpCommDao;
import com.coding5.el.emp.service.EmpService;


@Service
public class EmpCommServiceImpl implements EmpCommService{
	
	@Autowired SqlSessionTemplate sst;
	@Autowired EmpCommDao empCommDao;
	
	

}
