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

import com.coding5.el.emp.service.EmpService;
import com.coding5.el.emp.vo.AwardVo;
import com.coding5.el.emp.vo.CareerVo;
import com.coding5.el.emp.vo.CertificateVo;
import com.coding5.el.emp.vo.EducationVo;
import com.coding5.el.emp.vo.JobPostVo;
import com.coding5.el.emp.vo.LanguageVo;
import com.coding5.el.emp.vo.ResumeAttatchVo;
import com.coding5.el.emp.vo.ResumeVo;

@RequestMapping("emp")
@Controller
public class EmpController {
	
	@Autowired
	private EmpService es;
	
	// 채용 메인 페이지(화면)
	@GetMapping("main")
	public String empMain() {
		return "emp/main";
	}
	
	// 채용 이력서(화면)
	@GetMapping("resume")
	public String resume(ResumeVo vo, HttpSession session) {
		
		ResumeVo rv = es.selectResume(vo);
		List<EducationVo> eduList = es.selectEducation(vo);
		List<LanguageVo> langList = es.selectLanguage(vo);
		List<AwardVo> awardList = es.selectAward(vo);
		List<CareerVo> careerList = es.selectCareer(vo);
		List<CertificateVo> certificateList = es.selectCertificate(vo);
		List<ResumeAttatchVo> attachList = es.selectAttach(vo);
		
		session.setAttribute("rv", rv);
		session.setAttribute("eduList", eduList);
		session.setAttribute("langList", langList);
		session.setAttribute("awardList", awardList);
		session.setAttribute("careerList", careerList);
		session.setAttribute("certificateList", certificateList);
		session.setAttribute("attachList", attachList);
		
		return "emp/resume";
	}
	
	/**
	 * 채용 이력서
	 * @param vo
	 * @param evList
	 * @param lvList
	 * @param avList
	 * @param cvList
	 * @param cfvList
	 * @param ravList
	 * @return
	 */
	@PostMapping("resume")
	public String resume(List<EducationVo> evList) {
		
		int result = es.resumeWrite(evList);
		
		if(result == 1) {
			return "redirect:/emp/resume";
		}
		return "redirect:/emp/resume";
		
	}
	//, List<LanguageVo> lvList, List<AwardVo> avList, List<CareerVo> cvList, List<CertificateVo> cfvList, List<ResumeAttatchVo> ravList
	//, lvList, avList, cvList, cfvList, ravList
	
	@GetMapping("position")
	public String jobPostDetail(String no, Model model) {
		
		JobPostVo vo = es.jobPostDetail(no);
		model.addAttribute("vo", vo);
		
		return "emp/job-post-detail";
	}
	
}