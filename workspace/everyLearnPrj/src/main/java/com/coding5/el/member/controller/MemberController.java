package com.coding5.el.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coding5.el.member.service.MemberService;
import com.coding5.el.member.vo.MemberVo;

@RequestMapping("member")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	//회원가입(화면)
	@GetMapping("join")
	public String join() {
		return "member/join";
	}
	
	//회원가입
	@PostMapping("join")
	public String join(MemberVo vo) {
		
		memberService.join(vo);
		
		return "member/login";
	}
	
	//아이디 중복확인(ajax)
	@PostMapping("idDup")
	@ResponseBody
	public String idDup(String memberId){
		
		String result = memberService.idDup(memberId);
		System.out.println(result);
		
		if( result != null ){
			return "1";
		}else {
			return "-1";
		}
		
		
	}
	
	//닉네임 중복확인(ajax)
	@PostMapping("nickDup")
	@ResponseBody
	public String nickDup(String memberNick){
		
		String result = memberService.nickDup(memberNick);
		System.out.println(result);
		
		if( result != null ){
			//중복된 닉네임
			return "1";
		}else {
			return "-1";
		}
		
		
	}
	
	
	//로그인(화면)
	@GetMapping("login")
	public String login() {
		return "member/login";
	}
	
	//로그인
	@PostMapping("login")
	public String login(MemberVo vo, HttpSession session) {
		
		MemberVo loginMember = memberService.login(vo);
		System.out.println(loginMember);
		
		if(loginMember != null) {
			
			session.setAttribute("loginMember", loginMember);
			
			return "class_comm/qna";
		}else {
			return "common/error";
		}
		
	}
	
	
	@GetMapping("modify")
	public String modify() {
		return "member/modify";
	}
	
	@GetMapping("idFind")
	public String idFind() {
		return "member/id_find";
	}
	
	@GetMapping("pwFind")
	public String pwFind() {
		return "member/pw_find";
	}
	
	@GetMapping("successIdFind")
	public String successIdFind() {
		return "member/success_id_find";
	}
	
	@GetMapping("successPwdFind")
	public String successPwdFind() {
		return "member/success_pwd_find";
	}
	
	@GetMapping("changePwd")
	public String changePwd() {
		return "member/change_pwd";
	}
	
	@GetMapping("alert")
	public String alert() {
		return "member/member_alert";
	}
	
	@GetMapping("sidebar")
	public String sidebar() {
		return "member/member_sidebar";
	}
	
	@GetMapping("point")
	public String point() {
		return "member/point";
	}
	
	@GetMapping("writeList")
	public String writeList() {
		return "member/writeList";
	}
	
	@GetMapping("delete")
	public String delete() {
		return "member/memberDelete";
	}
	
	@GetMapping("header")
	public String header() {
		return "common/headercopy";
	}
	
	
}
