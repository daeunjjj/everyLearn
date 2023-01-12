package com.coding5.el.request.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.coding5.el.member.vo.MemberVo;
import com.coding5.el.request.service.RequestService;
import com.coding5.el.request.vo.RequestVo;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class RequestController {
	@Autowired
	public RequestController(RequestService requestService) {
		this.requestService = requestService;
	}
	
	private final RequestService requestService;
	
	
	/* 기능요청 intro */
	@GetMapping("request/intro")
	public String requestIntro() {
		return "request/intro";
	}
	
	/* 요청 질문 / 내용 */
	@GetMapping("request/submit")
	public String request(Model model) {
		
		List<RequestVo> voList = requestService.selectQuestion();
		
		if(voList == null) return "common/error";
		
		model.addAttribute("voList", voList);
		
		return "request/request";
	}
	
	//찐 요청
	@PostMapping("request/submit")
	public String request(RequestVo vo,RedirectAttributes redirect, HttpSession session) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		if(loginMember == null) {
			return "redirect:/member/login";
		}
		
		vo.setMemberNo(loginMember.getMemberNo());
		
		log.info("[요청]화면->컨트롤러 - requestVo :: " + vo);
		
		int result = requestService.insertRequest(vo);
		
		if(result != 1) return "common/error";
		
		redirect.addFlashAttribute("msg", "요청이 제출되었습니다. 감사합니다. ^^");
		return "redirect:/request/intro";
	}
	
}
