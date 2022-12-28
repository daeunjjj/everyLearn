package com.coding5.el.corp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coding5.el.common.file.FileUploader;
import com.coding5.el.common.page.PageVo;
import com.coding5.el.common.page.Pagination;
import com.coding5.el.corp.service.CorpService;
import com.coding5.el.corp.vo.CorpVo;
import com.coding5.el.corp.vo.EmploymentVo;
import com.coding5.el.lecture.vo.LectureVo;

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
	
	// 아이디 중복체크
	@PostMapping("checkId")
	@ResponseBody
	public String checkId(String id) {
		return cs.checkId(id);
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
		
		CorpVo corpMember = cs.login(vo);
		
		
		if(corpMember == null) {
			model.addAttribute("msg", "error");
			return "emp/member/login";
		}
		
		session.setAttribute("corpMember", corpMember);
		return "redirect:/corp/mypage";
	}
	
	// 비밀번호 재설정
	@GetMapping("reset-pwd")
	public String resetPwd() {
		return "emp/member/reset/pwd";
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
		
		CorpVo corpMember = (CorpVo) session.getAttribute("corpMember");
		
		if(corpMember == null) {
			return "redirect:/corp/login";
		}
		
		CorpVo cv = cs.selectMypage(corpMember);
		
		session.setAttribute("cv", cv);
		
		return "emp/mypage/mypage";
	}
	
	// 기업 마이페이지
	@PostMapping("mypage")
	public String mypage(HttpSession session, CorpVo vo) {
		
		CorpVo corpMember = (CorpVo) session.getAttribute("corpMember");
		vo.setNo(corpMember.getNo());
		
		// 회사 로고  이미지 저장
		String logoName = "";
		if(!vo.getLogo().isEmpty()) {
			logoName = FileUploader.upload(session, vo.getLogo());
		}
		
		vo.setLogoName(logoName);
		
		// 회사 이미지 저장
		String thumbName = "";
		if(!vo.getThumb().isEmpty()) {
			thumbName = FileUploader.upload(session, vo.getThumb());
		}
		
		vo.setThumbName(thumbName);
		
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
		
		CorpVo corpMember = (CorpVo) session.getAttribute("corpMember");
		
		if(corpMember == null) {
			return "redirect:/corp/login";
		}
		
		vo.setCorpNo(corpMember.getNo());
		int result = cs.insertJobPost(vo);
		
		if(result != 1) {
			return "common/error";
		}
		
		return "redirect:/corp/total";
	}
	
	// 채용 공고 지우기
	@GetMapping("delete-position")
	public String jobPost(String no, HttpSession session) {
		
		int result = cs.deleteJobPost(no);
		
		if(result != 1) {
			return "common/error";
		}
		
		return "redirect:corp/mypage";
		
	}
	
	// 채용중 페이지
	@GetMapping("hiring")
	public String hiring(Model model, @RequestParam(value="pno", defaultValue = "1") String pno, HttpSession session) {
		
		CorpVo corpMember = (CorpVo) session.getAttribute("corpMember");
		
		if(corpMember == null) {
			return "redirect:/corp/login";
		}
		
		String corpNo = corpMember.getNo();
		
		
		// 카운트
		int totalCount = cs.selectHiringCnt(corpNo);
		int currentPage = Integer.parseInt(pno);
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageVo pv = Pagination.getPageVo(totalCount, currentPage, pageLimit, boardLimit);
		
		List<EmploymentVo> list = cs.getList(pv, corpNo);
		
		model.addAttribute("pv", pv);
		model.addAttribute("list", list);
		
		return "emp/mypage/hiring";
	}
	
	// 채용 마감 페이지
	@GetMapping("deadLine")
	public String deadLine(Model model, @RequestParam(value="pno", defaultValue = "1") String pno, HttpSession session) {

		CorpVo corpMember = (CorpVo) session.getAttribute("corpMember");
		
		if(corpMember == null) {
			return "redirect:/corp/login";
		}
		
		String corpNo = corpMember.getNo();
		
		// 카운트
		int totalCount = cs.selectDeadlineCnt(corpNo);
		int currentPage = Integer.parseInt(pno);
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageVo pv = Pagination.getPageVo(totalCount, currentPage, pageLimit, boardLimit);
		
		List<EmploymentVo> list = cs.getDeadlineList(pv, corpNo);
		log.info(pv.toString());
		model.addAttribute("pv", pv);
		model.addAttribute("list", list);
		
		return "emp/mypage/deadLine";
	}
	
	// 채용 승인 여부 페이지
	@GetMapping("total")
	public String total(Model model, @RequestParam(value="pno", defaultValue = "1") String pno, HttpSession session) {
		
		CorpVo corpMember = (CorpVo) session.getAttribute("corpMember");
		
		if(corpMember == null) {
			return "redirect:/corp/login";
		}
		
		String corpNo = corpMember.getNo();
		
		// 카운트
		int totalCount = cs.selectTotalCnt(corpNo);
		int currentPage = Integer.parseInt(pno);
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageVo pv = Pagination.getPageVo(totalCount, currentPage, pageLimit, boardLimit);
		
		List<EmploymentVo> list = cs.getTotalList(pv, corpNo);
		
		model.addAttribute("pv", pv);
		model.addAttribute("list", list);
		
		return "emp/mypage/total";
	}
	
	// 지원자 현황 페이지
	@GetMapping("applicant")
	public String applicant() {
		return "emp/mypage/applicant";
	}
	
}
