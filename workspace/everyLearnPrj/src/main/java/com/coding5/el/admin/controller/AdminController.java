package com.coding5.el.admin.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coding5.el.admin.service.AdminService;
import com.coding5.el.admin.vo.AdminVo;
import com.coding5.el.common.file.FileUploader;
import com.coding5.el.common.page.PageVo;
import com.coding5.el.common.page.Pagination;
import com.coding5.el.common.vo.SearchVo;

import lombok.extern.slf4j.Slf4j;
@RequestMapping("admin")
@Controller
@Slf4j
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	

	/**
	 * 로그인
	 * @return
	 */
	@GetMapping("login")
	public String login() {
		return "admin/login";
	}
	
	/**
	 * 찐로그인
	 * @param vo
	 * @param save
	 * @param session
	 * @param model
	 * @param resp
	 * @return
	 */
	@PostMapping("login")
	public String login(AdminVo vo, String save, HttpSession session, Model model, HttpServletResponse resp) {
		
		
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
	
	/**
	 * 관리자 등록(화면)
	 * @return
	 */
	@GetMapping("master/join")
	public String adminJoin() {
		return "admin/master/join";
	}
	
	/**
	 * 찐 관리자 등록
	 * @param vo
	 * @param model
	 * @param session
	 * @return
	 */
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
	
	/**
	 * 중복체크(ajax)
	 * @param vo
	 * @return
	 */
	@PostMapping("/dup-check")
	@ResponseBody
	public String dupCheckId(AdminVo vo) {
		
		return adminService.dupCheck(vo);
	}
	
	
	/**
	 * 관리자 내 정보 조회(화면)
	 * @return
	 */
	@GetMapping("info")
	public String adminInfo() {
		
		return "admin/info";
	}
	
	/**
	 * 찐 관리자(내) 정보조회
	 * @param vo
	 * @param session
	 * @param model
	 * @param check
	 * @return
	 */
	@PostMapping("info/modify")
	public String adminInfo(AdminVo vo, HttpSession session, Model model, String check) {
		
		// 로그인 세션에 담긴 정보 가져오기
		AdminVo loginAdmin = (AdminVo)session.getAttribute("loginAdmin");		
		vo.setNo(loginAdmin.getNo());
		
		String profileName = "";
		
		if(check.length() != 0) {
			profileName = "default-profile.png";
		}
		
		if(!vo.getProfile().isEmpty()) {
			profileName = FileUploader.upload(session, vo.getProfile());
		}
		
		vo.setProfileName(profileName);
		
		
		
		AdminVo updateAdmin = adminService.myInfoModify(vo);
		
		if(updateAdmin == null) {
			model.addAttribute("resultMsg", "정보 수정 실패");
		}
		
		session.setAttribute("loginAdmin", updateAdmin);
		return "redirect:/admin/info";
	}
	/**
	 * 관리자 리스트 조회
	 * @param pno
	 * @param model
	 * @return
	 */

	@GetMapping("master/list")
	public String adminList(String pno, Model model, SearchVo svo) {
		// 카운트
		int listCount = adminService.selectAdminCount(svo);
		int currentPage = Integer.parseInt(pno);
		int pageLimit = 5;
		int boardLimit = 10;
		
		log.info("화면에서 받아오는 데이터 :::" + svo);
		
		PageVo pv = Pagination.getPageVo(listCount, currentPage, pageLimit, boardLimit);
		
		List<AdminVo> voList = adminService.selectAdminList(pv,svo);
		
		if(voList == null) {
			return "common/error";
		}
		
		model.addAttribute("svo", svo);
		model.addAttribute("pv", pv);
		model.addAttribute("voList", voList);

		return "admin/master/list";
	}
	/**
	 * 관리자 상세조회
	 * @param no
	 * @param model
	 * @return
	 */
	@GetMapping("master/detail")
	public String adminDetail(String no, Model model) {
		
		AdminVo vo = adminService.adminDetail(no);
		if(vo == null) return "common/error";
		
		model.addAttribute("vo", vo);
		return "admin/master/detail";
	}
	/**
	 * 마스터 관리자 정보수정
	 * @param vo
	 * @param session
	 * @return
	 */
	@PostMapping("master/modify")
	public String adminModify(AdminVo vo, HttpSession session) {

		int result = adminService.adminModify(vo);
		
		if(result != 1) {
			return "common/error";
		}
		
		session.setAttribute("resultMsg", "수정 완료!");
		
		return "redirect:/admin/master/detail?no="+vo.getNo();
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
