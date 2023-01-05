package com.coding5.el.payment.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDaoImpl implements PaymentDao{

	@Override
	public int addPayInfo(HashMap<String, String> map, SqlSessionTemplate sst) {
		return sst.insert("paymentMapper.addPayInfo", map);
	}
	
	
	//결제금액 포인트 적립
	@Override
	public int addPoint(HashMap<String, String> map, SqlSessionTemplate sst) {
		return sst.insert("paymentMapper.addPoint", map);
	}

}
