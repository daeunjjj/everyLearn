package com.coding5.el.payment.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.coding5.el.lecture.vo.LectureVo;
import com.coding5.el.payment.vo.PaymentVo;

public interface PaymentService {


	
	//포인트 추가
	public int addPoint(Map<String, String> map);
	
	//주문 추가
	public int addBuy(List<PaymentVo> payList, LectureVo lecVo);
	
	
	//주문정보 테이블 추가
	public int addBuyList(List<PaymentVo> payList);
	
	//결제 테이블 추가
	public int addPay(List<PaymentVo> payList, LectureVo lecVo);
	
	//사용한만큼 포인트 감소
	public int minusPoint(Map<String, String> map);


}
