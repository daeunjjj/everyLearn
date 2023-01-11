package com.coding5.el.cart.vo;

import org.springframework.web.multipart.MultipartFile;

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
	private String selectPrice; //선택된 전체 강의 금액
    private String totalPrice; // 포인트를 차감한 금액
    private String totalCnt;
    
    private String point; //선택된 포인트
    private String totalPoint; //너는... 몰까.. 가지고 있는 포인트..?
    
    private String mp; //멤버 개인 포인트

    ///파일
  	private MultipartFile thumbFile;
  	private MultipartFile logoFile;
  	private String logo;
  	private String thumb;
  	
}
