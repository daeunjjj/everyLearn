package com.coding5.el.payment.service;

import java.util.HashMap;

public interface PaymentService {

	//결제정보 추가
	public int addPayInfo(HashMap<String, String> map);
	
	//포인트 추가
	public int addPoint(HashMap<String, String> map);


}
