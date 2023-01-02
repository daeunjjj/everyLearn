package com.coding5.el.admin.report.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.coding5.el.admin.report.service.AdminReportService;
import com.coding5.el.alert.vo.AlertVo;
import com.coding5.el.common.page.PageVo;
import com.coding5.el.common.page.Pagination;
import com.coding5.el.report.vo.ReportVo;

import lombok.extern.slf4j.Slf4j;
@RequestMapping("admin/report")
@Controller
@Slf4j
public class AdminReportController {
	
	@Autowired
	public AdminReportController(AdminReportService adminReportService) {
		this.adminReportService = adminReportService;
	}
	
	private final AdminReportService adminReportService;
	
	/**
	 * 신고 리스트 조회
	 * @param pno
	 * @param model
	 * @param mapSearch
	 * @return
	 */
	@GetMapping("list")
	public String reportList(String pno, Model model, @RequestParam Map<String, String> mapSearch) {
		log.info("신고 리스트 조회 - 화면에서 받아오는 데이터  mapSearch :::" + mapSearch);
		log.info("신고 리스트 조회 - pno :::" + pno);
		// 카운트
		int listCount = adminReportService.selectReportCount(mapSearch);
		
		log.info("신고 리스트 조회 - 신고 cnt" + listCount);
		int currentPage = Integer.parseInt(pno);
		int pageLimit = 5;
		int boardLimit = 10;
		
		
		PageVo pv = Pagination.getPageVo(listCount, currentPage, pageLimit, boardLimit);
		
		Map<String, Object> map = adminReportService.selectReportList(pv,mapSearch);
		
		log.info("디비->컨트롤러 map ::: " + map);
		if(map == null) {
			return "common/error";
		}
		
		model.addAttribute("mapSearch", mapSearch);
		model.addAttribute("pv", pv);
		model.addAttribute("map", map);
		
		return "admin/report/list";
	}
	
	/**
	 *  신고처리 화면
	 * @param no
	 * @param model
	 * @return
	 */
	@GetMapping("process")
	public String reportProcess(String no, Model model) {
		
		log.info("신고처리 화면 -> 컨트롤러 ::: " +no);
		
		ReportVo vo = adminReportService.selectReportOne(no);
		
		log.info("신고처리 - dao -> 컨트롤러 ::: " + vo);
		
		if(vo == null) return "common/error";
		
		model.addAttribute("vo", vo);
		return "admin/report/process";
	}
	// (찐)신고처리
	@PostMapping("process")
	public String reportProcess(ReportVo reportVo, AlertVo alertVo,RedirectAttributes redirect) {
		log.info("신고처리 화면 -> 컨트롤러(reportVo) ::: " + reportVo);
		log.info("신고처리 화면 -> 컨트롤러(alertVo) ::: " + alertVo);
		
		int result = adminReportService.reportProcess(reportVo, alertVo);
		
		if(result < 1) return "common/error";
		
		return "redirect:/admin/report/list?pno=1";
	}
	
}
