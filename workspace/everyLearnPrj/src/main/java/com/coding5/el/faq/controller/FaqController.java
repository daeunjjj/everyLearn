package com.coding5.el.faq.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coding5.el.faq.service.FaqService;
import com.coding5.el.faq.vo.CateVo;
import com.coding5.el.faq.vo.FaqVo;
import com.coding5.el.notice.vo.PageVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("faq")
@Slf4j
public class FaqController {
	
	@Autowired FaqService faqService;

	//자주 묻는 질문 리스트
	@GetMapping("/list")
	public String list(Model model) throws Exception {
		//페이지 필요없음
		//리스트 조회
		//**여기서 조회 안 되면 사용자용 리스트 메소드 따로 만들어야 함**
		
		List<FaqVo> empFaqList = faqService.getEmpFaqList();
		List<FaqVo> memberFaqList = faqService.getMemberFaqList();
		
		model.addAttribute("memberFaqList", memberFaqList);	//일반 회원 질문 리스트
		model.addAttribute("empFaqList", empFaqList);	//기업 회원 질문 리스트
		
		return "faq/list";
	}
	
	//자주 묻는 질문 관리자 페이지에서 리스트 보여주기
	@GetMapping(value = {"/adminList/{page}", "/adminList"})
	public String adminList(Model model, @PathVariable(required=false) String page) throws Exception {
		if(page == null) page = "1";
		
		//페이징 객체 필요함
		int cntPerPage = 10; //한 페이지당 row10개씩 보여주기
		int pageBtnCnt = 5;	//한번에 보여줄 페이지버튼 개수
		int totalRow = faqService.getFaqCnt();	//db에 있는 모든 row 개수
		PageVo pageVo = new PageVo(page, cntPerPage, pageBtnCnt, totalRow);
	
		//리스트 조회
		List<FaqVo> adminList = faqService.getAdminList(pageVo);
		
		model.addAttribute("adminList", adminList);
		model.addAttribute("page", pageVo);
		
		return "faq/adminList";
	}
	
	//자주 묻는 질문 글쓰기
	@GetMapping("write")
	public String write() {
		return "faq/write";
	}
	
	//자주 묻는 질문 작성
	@PostMapping("write")
	public String write(FaqVo vo, HttpSession session, Model model) throws Exception {
		
		int result = faqService.write(vo);
		if(result > 0) {
			session.setAttribute("alertMsg", "FAQ 등록 성공");
			return "redirect:/faq/adminList";
		}else {
			model.addAttribute("msg", "FAQ 등록 실패");
			return "common/error";
		}
	}
	
	//공지사항 삭제
	@PostMapping("delete")
	@ResponseBody
	public String delete(String str) throws Exception {
		
		int result = faqService.deleteFaq(str);
		
		//log.warn("선택한 row 개수 : {}", result);
		
		if(result == str.length()/2) {
			return "ok";
		}else {
			return "fail_" + result;
		}
		
	}
	
	
	//자주 묻는 질문 글 수정하기
	@GetMapping("edit")
	public String edit(@RequestParam("no")String no, Model model) {
		
		return "faq/edit";
	}
}
