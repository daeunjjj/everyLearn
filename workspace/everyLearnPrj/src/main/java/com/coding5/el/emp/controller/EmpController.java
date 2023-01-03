package com.coding5.el.emp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.coding5.el.common.page.PageVo;
import com.coding5.el.common.page.Pagination;
import com.coding5.el.corp.vo.EmploymentVo;
import com.coding5.el.emp.service.EmpService;
import com.coding5.el.emp.vo.AwardVo;
import com.coding5.el.emp.vo.CareerVo;
import com.coding5.el.emp.vo.CertificateVo;
import com.coding5.el.emp.vo.EducationVo;
import com.coding5.el.emp.vo.JobPostVo;
import com.coding5.el.emp.vo.LanguageVo;
import com.coding5.el.emp.vo.ResumeAttatchVo;
import com.coding5.el.emp.vo.ResumeVo;
import com.coding5.el.member.vo.MemberVo;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("emp")
@Controller
@Slf4j
public class EmpController {
	
	@Autowired
	private EmpService es;
	
	// 채용 메인 페이지(화면)
	@GetMapping("main")
	public String empMain(String no, Model model) {
		
		// 카운트
		int totalCount = es.selectPostList();
		int currentPage = 1;
		int pageLimit = 5;
		int boardLimit = 12;
		
		PageVo pv = Pagination.getPageVo(totalCount, currentPage, pageLimit, boardLimit);
				
		
		List<JobPostVo> list = es.jobPostList(no, pv);
		
		model.addAttribute("list", list);
		
		return "emp/main";
	}
	
	// 채용 공고 페이지
	@GetMapping("job-post")
	public String postList(String no, Model model, @RequestParam(value="pno", defaultValue = "1") String pno) {
		
		// 카운트
		int totalCount = es.selectPostList();
		int currentPage = Integer.parseInt(pno);
		int pageLimit = 5;
		int boardLimit = 12;
		
		PageVo pv = Pagination.getPageVo(totalCount, currentPage, pageLimit, boardLimit);
		
		List<JobPostVo> list = es.jobPostList(no, pv);
		
		model.addAttribute("pv", pv);
		model.addAttribute("list", list);
		
		return "emp/post-list";
	}
	
	// 채용 공고 세부조회
	@GetMapping("position")
	public String jobPostDetail(String no, Model model) {
		
		JobPostVo vo = es.jobPostDetail(no);
		model.addAttribute("vo", vo);
		
		return "emp/member-position";
	}
	
	// 지원하기(화면)
	@GetMapping("apply")
	public String apply(HttpSession session, Model model) {
		
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		if(loginMember == null) {
			return "member/login";
		}
		
		String memberNo = loginMember.getMemberNo();
		
		ResumeVo rv = es.selectResume(memberNo);
		List<EducationVo> eduList = es.selectEducation(rv);
		List<LanguageVo> langList = es.selectLanguage(rv);
		List<AwardVo> awardList = es.selectAward(rv);
		List<CareerVo> careerList = es.selectCareer(rv);
		List<CertificateVo> certificateList = es.selectCertificate(rv);
		List<ResumeAttatchVo> attachList = es.selectAttach(rv);
		
		model.addAttribute("rv", rv);
		model.addAttribute("eduList", eduList);
		model.addAttribute("langList", langList);
		model.addAttribute("awardList", awardList);
		model.addAttribute("careerList", careerList);
		model.addAttribute("certificateList", certificateList);
		model.addAttribute("attachList", attachList);
		
		return "emp/apply";
		
	}
	
	// 지원하기
	@PostMapping("apply")
//	public String apply(HttpSession session, ResumeVo vo, String[] awardNo, String[] awardName, String[] awardDate, String[] awardAgency, 
//			String[] careerNo, String[] type, String[] companyName, 
//			String[] team, String[] position, String[] joinCompany, String[] leave, String[] currentYN, 
//			String[] certificateNo, String[] certificateName, String[] certificateDate, String[] certificateAgency, String[] educationNo, 
//			String[] status, String[] education, String[] schoolName, String[] major, String[] enterSchool, 
//			String[] graduate, String[] languageNo, String[] language, String[] languageLevel, 
//			String[] attachNo, String[] originName, String[] changeName, String[] filePath) {
//		
//		return "";
//		
//	}
	public String apply(HttpSession session, EducationVo ev) {
		
		log.info(ev.toString());
		
		return"";
		
	}
	
		
	// 채용 이력서(화면)
	@GetMapping("resume")
	public String resume(HttpSession session, Model model) {
		
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		if(loginMember != null) {
			String memberNo = loginMember.getMemberNo();
			
			ResumeVo rv = es.selectResume(memberNo);
			List<EducationVo> eduList = es.selectEducation(rv);
			List<LanguageVo> langList = es.selectLanguage(rv);
			List<AwardVo> awardList = es.selectAward(rv);
			List<CareerVo> careerList = es.selectCareer(rv);
			List<CertificateVo> certificateList = es.selectCertificate(rv);
			List<ResumeAttatchVo> attachList = es.selectAttach(rv);
			
			model.addAttribute("rv", rv);
			model.addAttribute("eduList", eduList);
			model.addAttribute("langList", langList);
			model.addAttribute("awardList", awardList);
			model.addAttribute("careerList", careerList);
			model.addAttribute("certificateList", certificateList);
			model.addAttribute("attachList", attachList);
		}
		
		
		return "emp/resume";
	}
	
	// 채용 이력서
	@PostMapping("resume")
	public String resume(HttpSession session, ResumeVo rv, EducationVo ev, AwardVo av, CareerVo cv, CertificateVo cfv, LanguageVo lv) {
		
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		if(loginMember == null) {
			return "member/login";
		}
		
		String memberNo = loginMember.getMemberNo();
		
		int result = es.insertResume(memberNo, rv, ev, av, cv, cfv, lv);
		
		return "redirect:/emp/resume";
		
	}
	//, List<LanguageVo> lvList, List<AwardVo> avList, List<CareerVo> cvList, List<CertificateVo> cfvList, List<ResumeAttatchVo> ravList
	//, lvList, avList, cvList, cfvList, ravList
	
	
	
}