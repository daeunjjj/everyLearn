package com.coding5.el.payment.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding5.el.lecture.vo.LectureVo;
import com.coding5.el.payment.dao.PaymentDao;
import com.coding5.el.payment.vo.PaymentVo;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	@Autowired
	private PaymentDao payDao;
	
	

	@Override
	public int addPoint(HashMap<String, String> map) {
		return payDao.addPoint(map, sst);
	}


	//주문 내역 추가
	@Override
	public int addBuy(List<PaymentVo> payList, LectureVo lecVo) {
		
		return payDao.addBuy(sst, payList, lecVo);
	}

	//주문 정보 추가
	@Override
	public int addBuyList(List<PaymentVo> payList) {
		return payDao.addBuyList(sst, payList);
	}


}
