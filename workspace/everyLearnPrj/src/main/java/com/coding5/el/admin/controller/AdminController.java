package com.coding5.el.admin.controller;

import java.util.ArrayList;
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
import com.coding5.el.chart.vo.ChartVo;
import com.coding5.el.common.file.FileUploader;
import com.coding5.el.common.page.PageVo;
import com.coding5.el.common.page.Pagination;
import com.coding5.el.common.randomNum.RandomNumber;
import com.coding5.el.email.service.EmailService;
import com.coding5.el.email.vo.MailVo;
import com.coding5.el.emp.comm.vo.AttachVo;
import com.coding5.el.request.vo.RequestVo;
import com.google.gson.Gson;

import lombok.extern.slf4j.Slf4j;
@RequestMapping("admin")
@Controller
@Slf4j
public class AdminController {
	
	@Autowired
	public AdminController(AdminService adminService, EmailService emailService) {
		this.adminService = adminService;
		this.emailService = emailService;
	}
	
	private final AdminService adminService;
	
	private final EmailService emailService;
	
	@Autowired
	private Gson gson;
	
	
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
		// 페이징
		PageVo pv = Pagination.getPageVo(listCount, currentPage, pageLimit, boardLimit);
		// 리스트 가져오기
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
	 * 기능요청 리스트
	 * @param pno
	 * @param model
	 * @param mapSearch
	 * @return
	 */
	@GetMapping("request/list")
	public String requestList(String pno, Model model, @RequestParam Map<String, String> mapSearch) {
		// 카운트
		int listCount = adminService.selectRequestConut(mapSearch);
		int currentPage = Integer.parseInt(pno);
		int pageLimit = 5;
		int boardLimit = 10;
		
		log.info("기능요청 리스트 - 화면에서 받아오는 데이터  mapSearch :::" + mapSearch);
		
		PageVo pv = Pagination.getPageVo(listCount, currentPage, pageLimit, boardLimit);
		
		Map<String, Object> map = adminService.selectRequest(mapSearch,pv);
		
		if(map == null) return "common/error";
		
		model.addAttribute("svo", mapSearch);
		model.addAttribute("pv", pv);
		model.addAttribute("map", map);
		return "admin/request/list";
	}
	
	@PostMapping("request/check")
	public String requestCheck(String[] arrNo) {
		log.info("에이잭스 실행 완" + arrNo[0]);
		
		int result = adminService.requestCheck(arrNo);
		
		if(result == 0) {
			return "";			
		}
		
		return "redirect:/admin/request/list?pno=1";
		
	}
	
	/**
	 * 질문수정 화면 보여주기
	 * @param model
	 * @return
	 */
	@GetMapping("request/edit")
	public String requestEdit(Model model) {

		List<RequestVo> voList = adminService.selectQuestion();
		
		if(voList == null) return "common/error";
		
		model.addAttribute("voList", voList);
		
		return "admin/request/edit";
	}
	/**
	 * 질문수정
	 * @param vo
	 * @return
	 */
	@PostMapping("request/edit")
	public String requestEdit(RequestVo vo) {

		log.info("질문 수정-화면 > 컨트롤러 voList ::: "+ vo.getVoList().get(0));

		int result = adminService.requestEdit(vo.getVoList());
		
		log.info("질문수정-디에이오 > 컨트롤러 결과  ::: " + result);
		
		return "redirect:/admin/request/edit";
	}
	/**
	 * 질문 삭제
	 * @param no
	 * @return
	 */
	@PostMapping("request/delete")
	@ResponseBody
	public String questionDelete(String no) {
		
		log.info("질문 삭제 - no :: " + no);
		
		int result = adminService.questionDelete(no);
		
		if(result != 1) return "";
		
		return "ok";
	}
	/**
	 * 대시보드 알림
	 * @param model
	 * @return
	 */
	@GetMapping("dashboard")
	public String dashboard(Model model) {
		
		Map<String, Object> map =  adminService.selectDashboardAlert();
		
		if(map == null) return "common/error";
		
		log.info("cnt :: "+map);
		
		model.addAttribute("map", map);
		return "admin/dashboard";
	}
	/**
	 * 대시보드-연령대별
	 * @return
	 */
	@GetMapping("dashboard/age-chart")
	@ResponseBody
	public String ageChart() {
		
		List<ChartVo> voList = adminService.selectAgeChart();
		
		log.info("ageChart 디비 다녀옴 :::"+voList);
		
		return gson.toJson(voList);
	}
	/**
	 * 대시보드-카테고리별
	 * @param cateNo
	 * @return
	 */
	@GetMapping(value = "dashboard/class-chart", produces = "application/text; charset=utf8")
	@ResponseBody
	public String classChart(String cateNo) {
		log.info("classChart 화면 > 컨트롤러" + cateNo);
		
		if("0".equals(cateNo)) {
			cateNo = null;
		}
		
		List<ChartVo> voList = adminService.selectClassChart(cateNo);
		
		log.info("classChart 디비 다녀옴" + voList);
		
		
		return gson.toJson(voList);
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
	
	@PostMapping("find/pwd")
	@ResponseBody
	public String findPwd(String email) {
		
	    AdminVo vo = adminService.adminEmailCheck(email);
		
	    log.info("비번찾기-이메일가져오기 :: "+vo);
	    
	    if(vo == null) return "";
	    
		return "check";
	}
	
	/**
	 * 임시 비번 발급
	 * 메일 보내기
	 * @param vo
	 */
	@PostMapping("send-email")
	@ResponseBody 
	public void sendMail(AdminVo vo) {
		// 임시 비밀번호 발급
		String newPwd = RandomNumber.getTempPwd();
		vo.setPwd(newPwd);
		// 임시 비번 업댓
		int result = adminService.updateTempPwd(vo);
		log.info("비번 업댓 결과 :: "+ result);
		
		
		if(result == 1) {
			MailVo mailVo = emailService.createMail(vo.getId(), newPwd);
			emailService.mailSender(mailVo);
		}
		
		log.info("이메일 :: "+vo.getId());
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
	

	
	// 강의 리스트
	@GetMapping("class/list")
	public String classList() {
		return "admin/class/list";
	}
	



	
	// 전체 메일 전송
	@GetMapping("mail/all-send")
	public String mailAllSend() {
		return "admin/mail/all-send";
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
