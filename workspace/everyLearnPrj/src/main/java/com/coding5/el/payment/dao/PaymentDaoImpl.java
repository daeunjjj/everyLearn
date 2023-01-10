package com.coding5.el.payment.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.coding5.el.lecture.vo.LectureVo;
import com.coding5.el.payment.vo.PaymentVo;

@Repository
public class PaymentDaoImpl implements PaymentDao{



	
	//주문 추가
	@Override
	public int addBuy(SqlSessionTemplate sst, List<PaymentVo> payList, LectureVo lecVo) {
		System.out.println("======== payDao ========");
		return sst.insert("paymentMapper.addBuy", payList);
	}

	//주문 정보 추가
	@Override
	public int addBuyList(SqlSessionTemplate sst, List<PaymentVo> payList, LectureVo lecVo) {
		return sst.insert("paymentMapper.addBuyList", payList);
	}




	//결제금액 포인트 적립
	@Override
	public int addPoint(Map<String, String> map, SqlSessionTemplate sst) {
		return sst.insert("paymentMapper.addPoint", map);
	}
	
	//사용한만큼 포인트감소
	@Override
	public int minusPoint(Map<String, String> map, SqlSessionTemplate sst) {
		return sst.insert("paymentMapper.minusPoint", map);
	}

	@Override
	public int addBuy(Map<String, String> buymap, SqlSessionTemplate sst) {
		return sst.insert("paymentMapper.addBuy", buymap);
	}
	
	//가격 업데이트
	@Override
	public int updatePrice(SqlSessionTemplate sst, List<PaymentVo> payList) {
		return sst.update("paymentMapper.updatePrice", payList);
	}
	
	//결제 테이블 추가
	@Override
	public int addPay(Map<String, String> buymap, SqlSessionTemplate sst) {
		return sst.insert("paymentMapper.addPay", buymap);
	}
	
	//결제한 강의 장바구니에서 삭제
	@Override
	public int deleteCart(List<PaymentVo> payList, SqlSessionTemplate sst) {
		return sst.update("paymentMapper.deleteCart", payList);
	}

}
