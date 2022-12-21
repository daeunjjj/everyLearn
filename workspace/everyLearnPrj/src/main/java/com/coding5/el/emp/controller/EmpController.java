package com.coding5.el.emp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coding5.el.emp.service.EmpService;
import com.coding5.el.emp.vo.EmpVo;

@RequestMapping("emp")
@Controller
public class EmpController {
	
	@Autowired
	private EmpService es;
	
	// 기업 회원가입(화면)
	@GetMapping("join")
	public String join() {
		return "emp/member/join";
	}
	
	// 기업 회원가입
	@PostMapping("join")
	public String join(EmpVo vo) {
		
		int result = es.join(vo);
		
		if(result == 1) {
			
			return "redirect:/emp/login";
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
	public String login(EmpVo vo, HttpSession session, Model model) {
		
		EmpVo empMember = es.login(vo);
		
		if(empMember == null) {
			model.addAttribute("msg", "error");
			return "emp/member/login";
		}
		
		session.setAttribute("empMember", empMember);
		return "redirect:/emp/mypage";
	}
	
	// 기업 마이페이지
	@GetMapping("mypage")
	public String mypage() {
		return "emp/mypage/mypage";
	}
	
	// 채용 메인 페이지
	@GetMapping("main")
	public String empMain() {
		return "emp/main";
	}
	
	// 채용 이력서
	@GetMapping("resume")
	public String resume() {
		return "emp/resume";
	}
	
	
	
}
