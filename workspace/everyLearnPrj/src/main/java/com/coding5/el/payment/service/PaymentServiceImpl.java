package com.coding5.el.payment.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	

	//주문 추가
	@Override
	public int addBuy(List<PaymentVo> payList, LectureVo lecVo) {
		return payDao.addBuy(sst, payList, lecVo);
	}

	
	
	
	//주문 내역 추가
	@Override
	public int addBuyList(List<PaymentVo> payList , LectureVo lecVo) {
		int result = payDao.addBuyList(sst, payList, lecVo);
		int result2 = 0;
		if (result > 0) {
			result2 = payDao.updatePrice(sst, payList);
		}
		return result * result2;
	}

	//포인트 1% 추가
	@Override
	public int addPoint(Map<String, String> map) {
		return payDao.addPoint(map, sst);
	}

	//사용한만큼 포인트감소
	@Override
	public int minusPoint(Map<String, String> map) {
		return payDao.minusPoint(map, sst);
	}

	//주문 테이블 추가(맵)
	@Override
	public int addBuy(Map<String, String> buymap) {
		return payDao.addBuy(buymap, sst);
	}

	//결제 테이블 추가(맵_
	@Override
	public int addPay(Map<String, String> buymap) {
		return payDao.addPay(buymap, sst);
	}




	@Override
	public int deleteCart(List<PaymentVo> payList) {
		// TODO Auto-generated method stub
		return payDao.deleteCart(payList, sst);
	}


}
