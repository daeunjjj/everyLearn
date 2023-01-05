package com.coding5.el.payment.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

public interface PaymentDao {

	//결제 정보 저장
	public int addPayInfo(HashMap<String, String> map, SqlSessionTemplate sst);
	
	//결제금액 1% 적립
	public int addPoint(HashMap<String, String> map, SqlSessionTemplate sst);

}
