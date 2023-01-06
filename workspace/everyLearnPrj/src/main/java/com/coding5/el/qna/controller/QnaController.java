package com.coding5.el.qna.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coding5.el.qna.service.QnaService;
import com.coding5.el.qna.vo.QnaVo;

@Controller
@RequestMapping("qna")
public class QnaController {
	
	@Autowired QnaService qnaService;
	
	//QNA 목록
	@GetMapping("list")
	public String list() {
		return "qna/list";
	}
	
	//QNA 글쓰기
	@GetMapping("write")
	public String write() throws Exception {
		return "qna/write";
	}
	
	@PostMapping("write")
	public String write(QnaVo vo, HttpSession session, Model model) throws Exception {
		
		int result = qnaService.write(vo);
		if(result > 0) {
			session.setAttribute("alertMsg", "QNA 작성 성공");
			return "redirect:/qna/list";
		}else {
			model.addAttribute("msg", "QNA 작성 실패");
			return "common/error";
		}
		
	}
	
	//QNA 수정하기
	@GetMapping("edit")
	public String edit() {
		return "qna/edit";
	}
	
	//QNA 상세보기
	@GetMapping("detail")
	public String detail() {
		return "qna/detail";
	}
		
}
