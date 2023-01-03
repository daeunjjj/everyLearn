package com.coding5.el.request.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.coding5.el.request.vo.RequestVo;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class RequestController {
	/* 기능요청 intro */
	@GetMapping("request/intro")
	public String requestIntro() {
		return "request/intro";
	}
	
	/* 요청 질문 / 내용 */
	@GetMapping("request")
	public String request() {
		return "request/request";
	}
	
	//찐 요청
	@PostMapping("request")
	public String request(RequestVo vo,RedirectAttributes redirect) {
		
		log.info("[요청]화면->컨트롤러 - requestVo :: " + vo);
		
		
		
		redirect.addFlashAttribute("msg", "요청이 제출되었습니다. 감사합니다. ^^");
		return "redirect:/request/intro";
	}
}
