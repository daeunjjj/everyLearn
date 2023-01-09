package com.coding5.el.emp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.coding5.el.common.file.FileUploader;
import com.coding5.el.common.page.PageVo;
import com.coding5.el.common.page.Pagination;
import com.coding5.el.corp.vo.CorpVo;
import com.coding5.el.corp.vo.EmploymentVo;
import com.coding5.el.emp.service.EmpService;
import com.coding5.el.emp.vo.ApplyVo;
import com.coding5.el.emp.vo.AwardVo;
import com.coding5.el.emp.vo.CareerVo;
import com.coding5.el.emp.vo.CertificateVo;
import com.coding5.el.emp.vo.EducationVo;
import com.coding5.el.emp.vo.JobPostVo;
import com.coding5.el.emp.vo.LanguageVo;
import com.coding5.el.emp.vo.ResumeVo;
import com.coding5.el.member.service.MemberService;
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
	
	@GetMapping("job-post/{sector}")
	public String postByIt(Model model, @PathVariable("sector") String sector, @RequestParam(value="pno", defaultValue = "1") String pno) {
		
		// 카운트
		int totalCount = es.selectSectorPage(sector);
		int currentPage = Integer.parseInt(pno);
		int pageLimit = 5;
		int boardLimit = 12;
		
		PageVo pv = Pagination.getPageVo(totalCount, currentPage, pageLimit, boardLimit);
		
		List<JobPostVo> list = es.postBySector(sector, pv);
		
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
			return "redirect:/member/login";
		}
		
		String memberNo = loginMember.getMemberNo();
		
		ResumeVo rv = es.selectResume(memberNo);
		List<EducationVo> eduList = es.selectEducation(rv);
		List<LanguageVo> langList = es.selectLanguage(rv);
		List<AwardVo> awardList = es.selectAward(rv);
		List<CareerVo> careerList = es.selectCareer(rv);
		List<CertificateVo> certificateList = es.selectCertificate(rv);
		
		model.addAttribute("rv", rv);
		model.addAttribute("eduList", eduList);
		model.addAttribute("langList", langList);
		model.addAttribute("awardList", awardList);
		model.addAttribute("careerList", careerList);
		model.addAttribute("certificateList", certificateList);
		
		return "emp/apply";
		
	}
	
	// 지원하기
	@PostMapping("apply")
	public String apply(HttpSession session, ResumeVo rv, EducationVo ev, AwardVo av, CareerVo cv, CertificateVo cfv, LanguageVo lv, @RequestParam("empNo") String empNo) {
		
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		if(loginMember == null) {
			return "redirect:/member/login";
		}	
		
		// 파일 업로드
		String memberNo = loginMember.getMemberNo();
		
		String attach = "";
		if(!rv.getAttach().isEmpty()) {
			attach = FileUploader.upload(session, rv.getAttach());
			rv.setAttachName(attach);
		}
		
		ApplyVo vo = new ApplyVo();
		vo.setMemberNo(memberNo);
		vo.setEmpNo(empNo);
		
		int result = es.insertResume(memberNo, rv, ev, av, cv, cfv, lv);
		int apply = es.apply(vo);
		
		if(result != 1) {
			return "common/error";
		}
		
		return "redirect:/emp/position?no=" + empNo;
		
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
			
			model.addAttribute("rv", rv);
			model.addAttribute("eduList", eduList);
			model.addAttribute("langList", langList);
			model.addAttribute("awardList", awardList);
			model.addAttribute("careerList", careerList);
			model.addAttribute("certificateList", certificateList);
		}
		
		
		return "emp/resume";
	}
	
	// 채용 이력서
	@PostMapping("resume")
	public String resume(HttpSession session, ResumeVo rv, EducationVo ev, AwardVo av, CareerVo cv, CertificateVo cfv, LanguageVo lv) {
		
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		if(loginMember == null) {
			return "redirect:/member/login";
		}	
		
		// 파일 업로드
		String memberNo = loginMember.getMemberNo();
		
		String attach = "";
		if(!rv.getAttach().isEmpty()) {
			attach = FileUploader.upload(session, rv.getAttach());
			rv.setAttachName(attach);
		}
		
		int result = es.insertResume(memberNo, rv, ev, av, cv, cfv, lv);

		if(result != 1) {
			return "common/error";
		}
		
		return "redirect:/emp/resume";
		
	}

	// 회원 이력서 조회(기업회원)
	@GetMapping("applicant")
	public String resume(@RequestParam(value = "applyNo") String applyNo,HttpSession session, Model model) {
		
		CorpVo corpMember = (CorpVo) session.getAttribute("corpMember");
		
		if(corpMember != null) {

			ApplyVo applyVo =  es.selectApply(applyNo);
			String memberNo = applyVo.getMemberNo();
			
			ResumeVo rv = es.selectResume(memberNo);
			List<EducationVo> eduList = es.selectEducation(rv);
			List<LanguageVo> langList = es.selectLanguage(rv);
			List<AwardVo> awardList = es.selectAward(rv);
			List<CareerVo> careerList = es.selectCareer(rv);
			List<CertificateVo> certificateList = es.selectCertificate(rv);
			
			model.addAttribute("rv", rv);
			model.addAttribute("eduList", eduList);
			model.addAttribute("langList", langList);
			model.addAttribute("awardList", awardList);
			model.addAttribute("careerList", careerList);
			model.addAttribute("certificateList", certificateList);
		}
		return "emp/resume";
	}
	
	// 채용 공고 검색
	@GetMapping("job-post/search")
	public String search(@RequestParam(value = "keyword") String keyword, Model model, @RequestParam(value="pno", defaultValue = "1") String pno) {
		
		// 카운트
		int totalCount = es.searchListCnt(keyword);
		int currentPage = Integer.parseInt(pno);
		int pageLimit = 5;
		int boardLimit = 12;
		
		PageVo pv = Pagination.getPageVo(totalCount, currentPage, pageLimit, boardLimit);
		
		Map<String, String> map = new HashMap<>();
		map.put("keyword", keyword);
		
		List<JobPostVo> list = es.searchJobPostList(map, pv);
		
		model.addAttribute("list", list);
		model.addAttribute("pv", pv);
		model.addAttribute("keyword", keyword);
		
		return "emp/post-list";
	}
	
	@GetMapping("corp-review")
	public String review() {
		return "emp/corp-review";
	}
	
}