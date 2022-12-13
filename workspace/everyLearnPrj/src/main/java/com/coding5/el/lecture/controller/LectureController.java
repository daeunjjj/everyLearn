package com.coding5.el.lecture.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("lecture")
@Controller
public class LectureController {
	
	//강의 메인리스트
	@GetMapping("main")
	public String main() {
		return "lecture/main";
	}
	
	//강의 상세페이지
	@GetMapping("detail")
	public String detail() {
		return "lecture/lec_detail";
	}
	
	//강의 상세페이지 - 수강평
	@GetMapping("detail/review")
	public String review() {
		return "lecture/lec_review";
	}
	
	//본인이 결제한 강의 목차
	@GetMapping("mylist")
	public String mylist() {
		return "lecture/mylist";
	}
	
	//강의 내 질문과답변
	@GetMapping("qnalist")
	public String qnalist() {
		return "lecture/qnalist";
	}
	
	//질문과답변 작성
	@GetMapping("qnawrite")
	public String qnawrite() {
		return "lecture/qnawrite";
	}
	
	//질문과답변 상세페이지
	@GetMapping("qnadetail")
	public String qnadetail() {
		return "lecture/qnadetail";
	}
	
	//장바구니
	@GetMapping("cart")
	public String cart() {
		return "lecture/cart";
	}
	
	//결제완료
	@GetMapping("completePay")
	public String completePayment() {
		return "lecture/complete_payment";
	}
}
