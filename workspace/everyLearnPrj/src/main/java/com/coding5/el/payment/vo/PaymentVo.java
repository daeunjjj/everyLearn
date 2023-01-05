package com.coding5.el.payment.vo;

import lombok.Data;

@Data
public class PaymentVo {

	
	private String no;
	private String paymentMethod;
	private String buyNo;
	private String enrollDate;
	private String statusYn;
	private String cancelDate;
	private String amount;
}
