package com.coding5.el.corp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coding5.el.corp.service.CorpService;
import com.coding5.el.corp.vo.CorpVo;

@RequestMapping("corp")
@Controller
public class CorpController {

	@Autowired
	private CorpService es;
	
	// 기업 회원가입(화면)
	@GetMapping("join")
	public String join() {
		return "emp/member/join";
	}
	
	// 기업 회원가입
	@PostMapping("join")
	public String join(CorpVo vo) {
		
		int result = es.join(vo);
		
		if(result == 1) {
			
			return "redirect:/corp/login";
		}else {
			return "error";
		}
		
	}
	
	// 기업 로그인(화면)
	@GetMapping("login")
	public String login() {
		return "emp/member/login";
	}
	
	// 기업 로그인
	@PostMapping("login")
	public String login(CorpVo vo, HttpSession session, Model model) {
		
		CorpVo empMember = es.login(vo);
		
		if(empMember == null) {
			model.addAttribute("msg", "error");
			return "emp/member/login";
		}
		
		session.setAttribute("empMember", empMember);
		return "redirect:/corp/mypage";
	}
	
	// 기업 마이페이지
	@GetMapping("mypage")
	public String mypage() {
		return "emp/mypage/mypage";
	}
	
}
