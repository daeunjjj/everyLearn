package com.coding5.el.admin.member.controller;

import java.util.List;
import java.util.Map;

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
import com.coding5.el.alert.vo.AlertVo;
import com.coding5.el.common.page.PageVo;
import com.coding5.el.common.page.Pagination;
import com.coding5.el.common.vo.SearchVo;
import com.coding5.el.member.vo.MemberVo;
import com.coding5.el.member.vo.PointVo;
import com.coding5.el.report.vo.ReportVo;

import lombok.extern.slf4j.Slf4j;
@RequestMapping("admin/member")
@Controller
@Slf4j
public class AdminMemberController {
	
	@Autowired
	public AdminMemberController(AdminService adminService) {
		this.adminService = adminService;
	}
	
	private final AdminService adminService;
	

	/**
	 * 학생 리스트 가져오기
	 * @param pno
	 * @param model
	 * @param mapSearch
	 * @return
	 */
	@GetMapping("student/list")
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
	@GetMapping("student/detail")
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
	@PostMapping("student/point-edit")
	public String pointEdit(PointVo vo, AlertVo alertVo) {
		
		log.info("화면->컨트롤러 PointVo ::: " + vo);
		
		if("3".equals(vo.getHistory())) {
			alertVo.setTitle("[알림]"+ vo.getChange() +"포인트가 차감되었습니다.");
			vo.setChange("-"+vo.getChange());
		} else {
			alertVo.setTitle("[알림]" + vo.getChange() +"포인트가 증감되었습니다.");
			vo.setChange("+"+vo.getChange());

		}
		
		log.info("vo.getHistory ::: "+ vo.getHistory());
		log.info("vo.getChange ::: "+ vo.getChange());
		
		int result = adminService.pointEdit(vo,alertVo);
		
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
	@GetMapping("teacher/list")
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
	@GetMapping("teacher/detail")
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
	@PostMapping("teacher/delete")
	public String teacherDelete(String[] arrNo, RedirectAttributes redirect) {
		
		log.info("화면->컨트롤러 ::: " + arrNo[0]);

		int result = adminService.teacherDelete(arrNo);
		
		if(result > 0) {
			redirect.addFlashAttribute("resultMsg", "처리되었습니다.");
		} else {
			redirect.addFlashAttribute("resultMsg", "요청 실패!");
		}
		
		
		return "redirect:/admin/member/teacher/list?pno=1";
	}
	
	/**
	 * 강사 승인
	 * @param no
	 * @return
	 */
	@PostMapping("teacher/approval")
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
	@PostMapping("teacher/class/delete")
	public String classDelete(String cno, String no, RedirectAttributes redirect) {
		
		log.info("화면->컨트롤러 ::: " + cno);
		int result = adminService.classDelete(cno);
		
		if(result != 1) return "common/error";
		
		redirect.addFlashAttribute("resultMsg", "폐강되었습니다.");
		return "redirect:/admin/member/teacher/detail?no=" + no;
	}
		

	
	/**
	 * 기업회원리스트 조회
	 * @param pno
	 * @param svo
	 * @param model
	 * @return
	 */
	@GetMapping("corporate/list")
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
	

	
	/**
	 * 기업회원 리스트 조회
	 * @param no
	 * @param model
	 * @return
	 */
	@GetMapping("corporate/detail")
	public String corporateDetail(String no, Model model) {
		
		log.info("no :: " + no);
		
		Map<String, Object> map = adminService.selectCorpAndEmp(no);
		
		if(map == null) return "common/error";
		
		log.info("기업회원 디테일 조회 - 디비다녀옴 ::: " + map);
		log.info("기업회원 emp ::: " + map.get("voList"));
		model.addAttribute("map", map);
		return "admin/member/corporate/detail";
	}
	/**
	 * 학생회원탈퇴
	 * @param arrNo
	 * @param redirect
	 * @return
	 */
	@PostMapping("student/quit")
	public String memberQuit(String[] arrNo, RedirectAttributes redirect) {
		log.info("멤버탈퇴 - 화면 ->컨트롤러 arrNo:::" + arrNo[0]);
		
		int result = adminService.studentQuit(arrNo);

		
		if(result > 0) {
			redirect.addFlashAttribute("resultMsg", "탈퇴처리되었습니다.");
		} else {
			redirect.addFlashAttribute("resultMsg", "요청처리 실패");
		}
		
		return "redirect:/admin/member/student/list?pno=1";
	}
	
	/**
	 * 기업회원탈퇴
	 * @param arrNo
	 * @param redirect
	 * @return
	 */
	@PostMapping("corporate/quit")
	public String corporateQuit(String[] arrNo, RedirectAttributes redirect) {
		log.info("멤버탈퇴 - 화면 ->컨트롤러 arrNo:::" + arrNo[0]);
		
		int result = adminService.corporateQuit(arrNo);

		
		if(result > 0) {
			redirect.addFlashAttribute("resultMsg", "탈퇴처리되었습니다.");
		} else {
			redirect.addFlashAttribute("resultMsg", "요청처리 실패");
		}
		
		return "redirect:/admin/member/corporate/list?pno=1";
	}
	@PostMapping("corporate/emp-board/delete")
	public String empBoardDelete(String eno, String no, RedirectAttributes redirect) {
		
		log.info("채용 공고 지움 - 화면->컨트롤러 ::: " + eno);
		int result = adminService.empBoardDelete(eno);
		
		log.info("채용 공고  - 디비다녀옴 ::: " + result);
		
		if(result != 1) return "common/error";
		
		redirect.addFlashAttribute("resultMsg", "삭제되었습니다.");
		return "redirect:/admin/member/corporate/detail?no=" + no;
	}
	
	/**
	 * 기업 거절/승인취소
	 * @param no
	 * @return
	 */
	@PostMapping("corporate/delete")
	public String corporateDelete(String no, RedirectAttributes redirect) {
		
		log.info("corporate 거절 화면->컨트롤러 ::: " + no);

		int result = adminService.corporateDelete(no);
		
		if(result == 1) {
			redirect.addFlashAttribute("resultMsg", "처리되었습니다.");
		} else {
			redirect.addFlashAttribute("resultMsg", "요청 실패!");
		}
		
		
		return "redirect:/admin/member/corporate/list?pno=1";
	}
	
	/**
	 * 기업 승인
	 * @param no
	 * @return
	 */
	@PostMapping("corporate/approval")
	public String corporateApproval(String no,RedirectAttributes redirect) {
		
		log.info("corporate 승인 화면->컨트롤러 ::: " + no);
		int result = adminService.corporateApproval(no);
		
		if(result != 1) return "common/error";
		
		redirect.addFlashAttribute("resultMsg", "승인되었습니다.");
		return "redirect:/admin/member/corporate/detail?no=" + no;
	}
	
	@GetMapping("stop-process")
	public String stopProcess() {
		return "admin/member/stop-process";
	}
	
	@PostMapping("stop-process")
	@ResponseBody
	public String stopProcess(ReportVo vo) {
		
		log.info("결과는? " + vo);
		
		int result = adminService.stopProcess(vo);
		if(result != 1) {
			return "";
		}
		return "ok";
	}
	
	@GetMapping("send-alert")
	public String sendAlert() {
		return "admin/member/send-alert";
	}
	
	@PostMapping("send-alert")
	@ResponseBody
	public String sendAlert(AlertVo vo) {
		
		int result = adminService.sendAlert(vo);
		
		if(result != 1) {
			return "";
		}
		
		return "ok";
	}
	
}
