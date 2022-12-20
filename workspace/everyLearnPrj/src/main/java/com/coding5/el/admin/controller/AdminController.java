package com.coding5.el.admin.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.coding5.el.admin.service.AdminService;
import com.coding5.el.admin.vo.AdminVo;
import com.coding5.el.common.FileUploader;

import oracle.jdbc.proxy.annotation.GetProxy;
@RequestMapping("admin")
@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;

	
	// 로그인
	@GetMapping("login")
	public String login() {
		return "admin/login";
	}
	
	// 찐 로그인
	@PostMapping("login")
	public String login(AdminVo vo, String save, HttpSession session, Model model, HttpServletResponse resp) {
		
		System.out.println(save);
		
		AdminVo loginAdmin = adminService.login(vo);
		
		if(loginAdmin == null) {
			model.addAttribute("failMsg", "fail");
			return "admin/login";
		}
		
		Cookie cookie = new Cookie("saveId", loginAdmin.getId());
		cookie.setPath("/el");
		
		if(save == null) cookie.setMaxAge(0);
		
		resp.addCookie(cookie);
		
		session.setAttribute("loginAdmin", loginAdmin);
		return "redirect:/admin/dashboard";
	}
	
	// 관리자 등록
	@GetMapping("master/join")
	public String adminJoin() {
		return "admin/master/join";
	}
	
	// 찐 관리자 등록
	@PostMapping("master/join")
	public String adminJoin(AdminVo vo,Model model, HttpSession session) {
		
		int result = adminService.join(vo);
		
		if(result != 1) {
			model.addAttribute("resultMsg", "관리자 등록에 실패했습니다.");
			return "admin/master/join";
		}
		
		session.setAttribute("resultMsg", "관리자 등록 완료!");
		return "redirect:/admin/master/join";
	}
	
	// 관리자 아이디중복체크
	@PostMapping("/dup-check/id")
	@ResponseBody
	public String dupCheckId(String id) {
		
		return adminService.dupCheckId(id);
	}
	
	// 관리자(내) 정보조회
	@GetMapping("info")
	public String adminInfo() {
		return "admin/info";
	}
	
	// 찐 관리자(내) 정보조회
	@PostMapping("info/modify")
	public String adminInfo(AdminVo vo, HttpSession session) {
		// 로그인 세션에 담긴 정보 가져오기
		AdminVo loginAdmin = (AdminVo)session.getAttribute("loginAdmin");
		
//		 이미지 저장
		String changeName = "";
		if(!vo.getProfile().isEmpty()) {
			changeName = FileUploader.upload(session, vo.getProfile());
		}
		
		vo.setChangeName(changeName);
		
		
		if(vo.getPwd() == null) {
			vo.setPwd(loginAdmin.getPwd());
		}
		
		System.out.println(vo.getPwd());
		
		//int result = adminService.myInfoModify(vo);
		
		return "admin/info";
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
	
	// 비밀번호 찾기
	@GetMapping("find/pwd")
	public String findPwd() {
		return "admin/find/pwd";
	}
	
	// 아이디 찾기 결과
	@GetMapping("find/result/id")
	public String resultId() {
		return "admin/find/result/id";
	}
	
	// 비번 찾기 결과
	@GetMapping("find/result/pwd")
	public String resultPwd() {
		return "admin/find/result/pwd";
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
	// 질문 수정
	@GetMapping("request/edit")
	public String requestEdit() {
		return "admin/request/edit";
	}
	
	// 전체 메일 전송
	@GetMapping("mail/all-send")
	public String mailAllSend() {
		return "admin/mail/all-send";
	}
	
	// 개별 메일 전송
	@GetMapping("mail/send")
	public String mailSend() {
		return "admin/mail/send";
	}
	
	
	// 보낸 메일 내역
	@GetMapping("mail/list")
	public String mailList() {
		return "admin/mail/list";
	}
	
	// 로그아웃
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "admin/login";
	}
	
}
