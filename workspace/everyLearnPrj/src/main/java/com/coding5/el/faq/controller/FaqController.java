package com.coding5.el.faq.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coding5.el.faq.service.FaqService;
import com.coding5.el.faq.vo.CateVo;
import com.coding5.el.faq.vo.FaqVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("faq")
@Slf4j
public class FaqController {
	
	@Autowired FaqService faqService;
	
	//카테고리 리스트
	
	

	//자주 묻는 질문 리스트
	@GetMapping("list")
	public String list(Model model) throws Exception {
	
		//List<FaqVo> list = faqService.getFaqList();
		//model.addAttribute("list", list);

		return "faq/list";
	}
	
	//자주 묻는 질문 관리자 페이지에서 리스트 보여주기
	@GetMapping("adminList")
	public String adminList(Model model) throws Exception {
	
		//List<FaqVo> list = faqService.getFaqList();
		//model.addAttribute("list", list);
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
			model.addAttribute("msg", "FAQ작성 실패");
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
	public String edit() {
		return "faq/edit";
	}
}
