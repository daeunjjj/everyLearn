package com.coding5.el.payment.service;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding5.el.payment.dao.PaymentDao;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	@Autowired
	private PaymentDao payDao;
	
	@Override
	public int addPayInfo(HashMap<String, String> map) {
		return payDao.addPayInfo(map, sst);
	}

	@Override
	public int addPoint(HashMap<String, String> map) {
		return payDao.addPoint(map, sst);
		
		
	}


}
