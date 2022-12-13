package com.coding5.el.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@RequestMapping("admin")
@Controller
public class AdminController {
	// 로그인
	@GetMapping("login")
	public String login() {
		return "admin/login";
	}
	
	// 대시보드
	@GetMapping("dashboard")
	public String dashboard() {
		return "admin/dashboard";
	}
	
	// 학생회원 리스트 조회
	@GetMapping("member/student/list")
	public String studentList() {
		return "admin/member/student/list";
	}
	
	// 강사회원 리스트 조회
	@GetMapping("member/teacher/list")
	public String teacherList() {
		return "admin/member/teacher/list";
	}
	
	// 기업회원 리스트 조회
	@GetMapping("member/corporate/list")
	public String corpList() {
		return "admin/member/corporate/list";
	}
	
	// 강사회원 디테일 조회
	@GetMapping("member/teacher/detail")
	public String teacherDetail() {
		return "admin/member/teacher/detail";
	}
	
	// 기업회원 디테일 조회
	@GetMapping("member/corporate/detail")
	public String corporateDetail() {
		return "admin/member/corporate/detail";
	}
	
	// 신고 (강의) 리스트 조회
	@GetMapping("report/list")
	public String reportList() {
		return "admin/report/list";
	}
	
	// 신고처리 화면
	@GetMapping("report/process")
	public String reportProcess() {
		return "admin/report/process";
	}
	
	// 관리자 리스트조회
	@GetMapping("master/list")
	public String adminList() {
		return "admin/master/list";
	}
	
	// 관리자 등록
	@GetMapping("master/join")
	public String adminJoin() {
		return "admin/master/join";
	}
	
	// 관리자(내) 정보조회
	@GetMapping("info")
	public String adminInfo() {
		return "admin/info";
	}
	
	// 관리자상세조회
	@GetMapping("master/detail")
	public String adminDetail() {
		return "admin/master/detail";
	}
	
	// 아이디 찾기
	@GetMapping("find/id")
	public String findId() {
		return "admin/find/id";
	}
	
	// 학생 상세
	@GetMapping("member/student/detail")
	public String studentDetail() {
		return "admin/member/student/detail";
	}
	
	// 강의 리스트
	@GetMapping("class/list")
	public String classList() {
		return "admin/class/list";
	}
	
	// 기능요청 리스트
	@GetMapping("request/list")
	public String requestList() {
		return "admin/request/list";
	}
	
	@GetMapping("request/edit")
	public String requestEdit() {
		return "admin/request/edit";
	}
}
