package com.coding5.el.cart.vo;

import lombok.Data;

@Data
public class CartVo {
	
	private String memberNo;
	private String classNo;
	private String orderYn;
	
	//lecture
	private String no;
	private String teacherNo;
	private String className;
	private String price;
	
	//결제
	private int pointPrice;
    
    private int totalPrice;

}
