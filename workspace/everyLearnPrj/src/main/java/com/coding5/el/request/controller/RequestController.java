package com.coding5.el.request.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RequestController {
	/* 기능요청 intro */
	@GetMapping("request/intro")
	public String requestIntro() {
		return "everylearn/request/intro";
	}
	
	/* 요청 질문 / 내용 */
	@GetMapping("request")
	public String request() {
		return "everylearn/request/request";
	}
}
