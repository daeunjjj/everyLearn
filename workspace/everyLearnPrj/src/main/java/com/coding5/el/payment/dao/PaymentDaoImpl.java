package com.coding5.el.payment.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.coding5.el.lecture.vo.LectureVo;
import com.coding5.el.payment.vo.PaymentVo;

@Repository
public class PaymentDaoImpl implements PaymentDao{


	
	//결제금액 포인트 적립
	@Override
	public int addPoint(HashMap<String, String> map, SqlSessionTemplate sst) {
		return sst.insert("paymentMapper.addPoint", map);
	}
	
	
	//주문 추가
	@Override
	public int addBuy(SqlSessionTemplate sst, List<PaymentVo> payList, LectureVo lecVo) {
		System.out.println("======== payDao ========");
		System.out.println(payList);
		return sst.insert("paymentMapper.addBuy", payList);
	}

	//주문 정보 추가
	@Override
	public int addBuyList(SqlSessionTemplate sst, List<PaymentVo> payList) {
		return sst.insert("paymentMapper.addBuyList", payList);
	}

}
