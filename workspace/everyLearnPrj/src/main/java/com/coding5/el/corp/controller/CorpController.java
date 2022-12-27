package com.coding5.el.corp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coding5.el.corp.service.CorpService;
import com.coding5.el.corp.vo.CorpVo;
import com.coding5.el.corp.vo.EmploymentVo;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("corp")
@Controller
@Slf4j
public class CorpController {

	@Autowired
	private CorpService cs;
	
	// 기업 회원가입(화면)
	@GetMapping("join")
	public String join() {
		return "emp/member/join";
	}
	
	// 기업 회원가입
	@PostMapping("join")
	public String join(CorpVo vo) {
		
		int result = cs.join(vo);
		
		if(result != 1) {
			return "common/error";
		}
		
		return "redirect:/corp/login";		
	}
	
	// 기업 로그인(화면)
	@GetMapping("login")
	public String login() {
		return "emp/member/login";
	}
	
	/**
	 * 로그인
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 */
	@PostMapping("login")
	public String login(CorpVo vo, HttpSession session, Model model) {
		
		CorpVo empMember = cs.login(vo);
		
		if(empMember == null) {
			model.addAttribute("msg", "error");
			return "emp/member/login";
		}
		
		session.setAttribute("empMember", empMember);
		return "redirect:/corp/mypage";
	}
	
	// 기업 로그아웃
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "emp/member/login";
	}
	
	// 기업 마이페이지(화면)
	@GetMapping("mypage")
	public String mypage(HttpSession session) {
		
		CorpVo empMember = (CorpVo) session.getAttribute("empMember");
		
		if(empMember == null) {
			return "redirect:/corp/login";
		}
		
		CorpVo cv = cs.selectMypage(empMember);
		
		log.info(cv.toString());
		
		session.setAttribute("cv", cv);
		
		return "emp/mypage/mypage";
	}
	
	// 기업 마이페이지
	@PostMapping("mypage")
	public String mypage(HttpSession session, CorpVo vo) {
		
		CorpVo empMember = (CorpVo) session.getAttribute("empMember");
		vo.setNo(empMember.getNo());
		
		int result = cs.updateCorpInfo(vo);
		
		log.info(vo.toString());
		
		if(result != 1) {
			log.info(vo.toString());
			return "common/error";
		}

		return "redirect:/corp/mypage";
	}
	
	// 기업 채용 공고 만들기(화면)
	@GetMapping("position")
	public String jobPost() {
		return "emp/mypage/job-post";
	}
	
	// 기업 채용 공고 만들기
	@PostMapping("position")
	public String jobPost(EmploymentVo vo, HttpSession session){
		
		CorpVo empMember = (CorpVo) session.getAttribute("empMember");
		
		if(empMember == null) {
			return "redirect:/corp/login";
		}
		
		vo.setCorpNo(empMember.getNo());
		int result = cs.insertJobPost(vo);
		
		if(result != 1) {
			return "common/error";
		}
		
		return "emp/mypage/status";
	}
	
	// 채용 공고 지우기
	@DeleteMapping("position")
	public String jobPost(String no, HttpSession session) {
		
		return "";
		
	}
	
	// 채용중 페이지
	@GetMapping("hiring")
	public String hiring() {
		return "emp/mypage/hiring";
	}
	
	// 채용 마감 페이지
	@GetMapping("deadLine")
	public String deadLine() {
		return "emp/mypage/deadLine";
	}
	
	// 채용 승인 여부 페이지
	@GetMapping("status")
	public String status() {
		return "emp/mypage/status";
	}
	
	// 지원자 현황 페이지
	@GetMapping("applicant")
	public String applicant() {
		return "emp/mypage/applicant";
	}
	
}
