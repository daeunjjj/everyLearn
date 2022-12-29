package com.coding5.el.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.coding5.el.admin.service.AdminService;
import com.coding5.el.admin.vo.AdminVo;
import com.coding5.el.common.file.FileUploader;
import com.coding5.el.common.page.PageVo;
import com.coding5.el.common.page.Pagination;
import com.coding5.el.common.vo.SearchVo;
import com.coding5.el.member.vo.MemberVo;
import com.coding5.el.member.vo.PointVo;

import lombok.extern.slf4j.Slf4j;
@RequestMapping("admin")
@Controller
@Slf4j
public class AdminController {
	
	@Autowired
	public AdminController(AdminService adminService) {
		this.adminService = adminService;
	}
	
	private final AdminService adminService;
	

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
		
		log.info("로그인  :: " + vo);
		
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
	public String adminJoin(AdminVo vo,Model model, RedirectAttributes redirect) {
		
		int result = adminService.join(vo);
		
		if(result != 1) {
			model.addAttribute("resultMsg", "관리자 등록에 실패했습니다.");
			return "admin/master/join";
		}
		
		redirect.addFlashAttribute("resultMsg", "관리자 등록 완료!");
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
		
		log.info("관리자 정보 수정 (db다녀옴) :: " + updateAdmin);
		
		if(updateAdmin == null) {
			model.addAttribute("resultMsg", "정보 수정 실패");
		}
		
		session.setAttribute("loginAdmin", updateAdmin);
		return "redirect:/admin/info";
	}
	
	/**
	 * 관리자 조회
	 * @param pno
	 * @param model
	 * @param mapSearch
	 * @return
	 */
	@GetMapping("master/list")
	public String adminList(String pno, Model model, @RequestParam Map<String, String> mapSearch) {
		// 카운트
		int listCount = adminService.selectAdminCount(mapSearch);
		int currentPage = Integer.parseInt(pno);
		int pageLimit = 5;
		int boardLimit = 10;
		
		log.info("관리자 조회 - 화면에서 받아오는 데이터  mapSearch :::" + mapSearch);
		
		PageVo pv = Pagination.getPageVo(listCount, currentPage, pageLimit, boardLimit);
		
		List<AdminVo> voList = adminService.selectAdminList(pv,mapSearch);
		
		if(voList == null) {
			return "common/error";
		}
		
		model.addAttribute("svo", mapSearch);
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
	public String adminModify(AdminVo vo, RedirectAttributes redirect) {

		int result = adminService.adminModify(vo);
		
		if(result != 1) {
			return "common/error";
		}
		
		redirect.addFlashAttribute("resultMsg", "수정 완료!");
		return "redirect:/admin/master/detail?no="+vo.getNo();
	}
	/**
	 * 탈퇴처리
	 * @param no
	 * @return
	 */
	@PostMapping("master/quit")
	@ResponseBody
	public String adminQuit(String no) {
		int result = adminService.adminQuit(no);
		
		if(result != 1) {
			return "";
		}
		return "ok";
	}
	
	/**
	 * 학생 리스트 가져오기
	 * @param pno
	 * @param model
	 * @param mapSearch
	 * @return
	 */
	@GetMapping("member/student/list")
	public String studentList(String pno, Model model,  @RequestParam Map<String, String> mapSearch) {
		
		// 카운트
		int listCount = adminService.selectStudentCount(mapSearch);
		int currentPage = Integer.parseInt(pno);
		int pageLimit = 5;
		int boardLimit = 10;
		log.info("학생 리스트 - 리스트 수 :::"+listCount);
		log.info("학생 리스트 - 화면에서 받아오는 데이터 mapSearch  :::" + mapSearch);
		log.info("학생 리스트 - 화면에서 받아오는 데이터 pno ::: "+mapSearch);
		
		PageVo pv = Pagination.getPageVo(listCount, currentPage, pageLimit, boardLimit);
		
		
		List<MemberVo> voList = adminService.selectStudentList(pv,mapSearch);
		
		log.info("학생 리스트 - 화면에서 받아오는 listVo ::: " + voList);
		
		if(voList == null) return "common/error";
		
		model.addAttribute("svo", mapSearch);
		model.addAttribute("pv", pv);
		model.addAttribute("voList", voList);
		return "admin/member/student/list";
	}
	
	/**
	 * 학생 상세조회
	 * @param no
	 * @param model
	 * @return
	 */
	@GetMapping("member/student/detail")
	public String studentDetail(String no, Model model) {
		
		log.info("화면 -> 컨트롤러 no ::: "+no);
		
		Map<String, Object> map = adminService.detailStudent(no);
		if(map == null) return "common/error";
		
		log.info("map ::: " + map);

		
		model.addAttribute("map", map);
		return "admin/member/student/detail";
	}
	
	/**
	 * 포인트 수정
	 * @param vo
	 * @return
	 */
	@PostMapping("member/student/point-edit")
	public String pointEdit(PointVo vo) {
		
		log.info("화면->컨트롤러 PointVo ::: " + vo);
		
		if("3".equals(vo.getHistory())) {
			vo.setChange("-"+vo.getChange());
		} else {
			vo.setChange("+"+vo.getChange());

		}
		
		log.info("vo.getHistory ::: "+ vo.getChange());
		
		int result = adminService.pointEdit(vo);
		
		if(result != 1) return "common/error";
		
		return "redirect:/admin/member/student/detail?no="+ vo.getMemberNo();
	}
	
	/**
	 * 강사회원 리스트 조회
	 * @param pno
	 * @param svo
	 * @param model
	 * @return
	 */
	@GetMapping("member/teacher/list")
	public String teacherList(String pno, SearchVo svo , Model model) {
		
		int listCount = adminService.selectTeacherCount(svo);
		int currentPage = Integer.parseInt(pno);
		int pageLimit = 5;
		int boardLimit = 10;
		log.info("리스트 수 :::"+listCount);
		log.info("화면에서 받아오는 데이터 mapSearch  :::" + svo);
		log.info("화면에서 받아오는 데이터 pno ::: "+svo);
		
		PageVo pv = Pagination.getPageVo(listCount, currentPage, pageLimit, boardLimit);
		
		Map<String, Object> map = adminService.selectTeacherList(pv, svo);		
		
		if(map == null) return "admin/member/teacher/list";
		
		
		log.info("db 결과 ::: " + map);
		
		model.addAttribute("svo", svo);
		model.addAttribute("pv", pv);
		model.addAttribute("map", map);
		return "admin/member/teacher/list";
	}
	
	/**
	 * 강사회원 디테일 조회
	 * @param no
	 * @param model
	 * @return
	 */
	@GetMapping("member/teacher/detail")
	public String teacherDetail(String no, Model model) {
		
		Map<String, Object> voMap = adminService.selectTeacherDetail(no);
		
		log.info("디비 결과 :::" +voMap);
		
		if(voMap == null) return "common/error";
		
		
		model.addAttribute("map", voMap);
		return "admin/member/teacher/detail";
	}
	/**
	 * 강사 업데이트
	 * @param no
	 * @return
	 */
	@PostMapping("member/teacher/delete")
	public String teacherDelete(String no, RedirectAttributes redirect) {
		
		log.info("화면->컨트롤러 ::: " + no);

		int result = adminService.teacherDelete(no);
		
		if(result != 1) return "common/error";
		
		redirect.addFlashAttribute("resultMsg", "처리되었습니다.");
		return "redirect:/admin/member/teacher/list?pno=1";
	}
	
	/**
	 * 강사 승인
	 * @param no
	 * @return
	 */
	@PostMapping("member/teacher/approval")
	public String teacherApproval(String no,RedirectAttributes redirect) {
		
		log.info("화면->컨트롤러 ::: " + no);
		int result = adminService.teacherApproval(no);
		
		if(result != 1) return "common/error";
		
		redirect.addFlashAttribute("resultMsg", "승인되었습니다.");
		return "redirect:/admin/member/teacher/detail?no=" + no;
	}
	/**
	 * 폐강
	 * @param cno
	 * @param no
	 * @param redirect
	 * @return
	 */
	@PostMapping("member/teacher/class/delete")
	public String classDelete(String cno, String no, RedirectAttributes redirect) {
		
		log.info("화면->컨트롤러 ::: " + cno);
		int result = adminService.classDelete(cno);
		
		if(result != 1) return "common/error";
		
		redirect.addFlashAttribute("resultMsg", "폐강되었습니다.");
		return "redirect:/admin/member/teacher/detail?no=" + no;
	}
	
	// 대시보드
	@GetMapping("dashboard")
	public String dashboard() {
		return "admin/dashboard";
	}
	

	

	
	/**
	 * 기업회원리스트 조회
	 * @param pno
	 * @param svo
	 * @param model
	 * @return
	 */
	@GetMapping("member/corporate/list")
	public String corpList(String pno, SearchVo svo , Model model) {
		
		int listCount = adminService.selectCorporateCount(svo);
		int currentPage = Integer.parseInt(pno);
		int pageLimit = 5;
		int boardLimit = 10;
		log.info("리스트 수 :::"+listCount);
		log.info("화면에서 받아오는 데이터 svo  :::" + svo);
		log.info("화면에서 받아오는 데이터 pno ::: "+pno);
		
		PageVo pv = Pagination.getPageVo(listCount, currentPage, pageLimit, boardLimit);
		
		Map<String, Object> map = adminService.selectCorporateList(pv, svo);		
		
		if(map == null) return "admin/member/corporate/list";
		
		
		log.info("db 결과 ::: " + map);
		
		model.addAttribute("svo", svo);
		model.addAttribute("pv", pv);
		model.addAttribute("map", map);

		return "admin/member/corporate/list";
	}
	

	
	// 기업회원 디테일 조회
	@GetMapping("member/corporate/detail")
	public String corporateDetail(String no, Model model) {
		
		Map<String, Object> map = adminService.selectCorpAndEmp(no);
		
		if(map == null) return "common/error";
		
		log.info("기업회원 디테일 조회 - 디비다녀옴 ::: " + map);
		
		model.addAttribute("map", map);
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
	/**
	 * 아이디 찾기 결과
	 * @param phone
	 * @param redirect
	 * @return
	 */
	@PostMapping("find/result/id")
	public String resultId(String phone, RedirectAttributes redirect) {
		
		log.info(phone);
		
		List<AdminVo> voList = adminService.selectAdminIdList(phone);
		
		log.info("디비 다녀옴 ::: " + voList);
		
		redirect.addFlashAttribute("voList", voList);
		return "redirect:/admin/find/result/id";
	}
	
	// 비번 찾기 결과
	@GetMapping("find/result/pwd")
	public String resultPwd() {
		return "admin/find/result/pwd";
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
	
	/**
	 *  로그아웃
	 * @param session
	 * @return
	 */
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "admin/login";
	}
	
	@GetMapping("pwd-check")
	public String check() {
		return "admin/check";
	}
}
