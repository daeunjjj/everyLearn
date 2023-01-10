package com.coding5.el.payment.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.coding5.el.lecture.vo.LectureVo;
import com.coding5.el.payment.vo.PaymentVo;

public interface PaymentDao {

	
	
	//결제금액 1% 적립
	public int addPoint(Map<String, String> map, SqlSessionTemplate sst);
	
	//주문 추가
	public int addBuy(SqlSessionTemplate sst, List<PaymentVo> payList, LectureVo lecVo);
	
	//주문 정보 추가
	public int addBuyList(SqlSessionTemplate sst, List<PaymentVo> payList, LectureVo lecVo);
	
	
	//사용한만큼 포인트감소
	public int minusPoint(Map<String, String> map, SqlSessionTemplate sst);

	//결제 테이블 추가
	public int addBuy(Map<String, String> buymap, SqlSessionTemplate sst);
	
	//price update
	public int updatePrice(SqlSessionTemplate sst, List<PaymentVo> payList);
	
	//결제 테이블 추가
	public int addPay(Map<String, String> buymap, SqlSessionTemplate sst);

	//결제한 강의 장바구니에서 삭제
	public int deleteCart(List<PaymentVo> payList, SqlSessionTemplate sst);

}
