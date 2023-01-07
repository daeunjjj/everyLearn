package com.coding5.el.qna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coding5.el.member.vo.MemberVo;
import com.coding5.el.qna.service.QnaService;
import com.coding5.el.qna.vo.FileUploader;
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
	
	//QNA 사용자 글쓰기
	@GetMapping("memberWrite")
	public String write() throws Exception {
		return "qna/memberWrite";
	}

	
	@PostMapping("memberWrite")
	public String memberWrite(QnaVo vo, HttpSession session, Model model) throws Exception {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		vo.setMemberNo(loginMember.getMemberNo());
		
		System.out.println(vo);
		
		String photoName = "";
		if(!vo.isEmpty()) {
			photoName = FileUploader.upload(session, vo);
		}
		
		vo.setPhotoName(photoName);
		
		System.out.println(photoName);
		
		int result = qnaService.memberWrite(vo);
		if(result > 0) {
			session.setAttribute("alertMsg", "문의글이 작성되었습니다.");
			return "redirect:/qna/list";
		}else {
			model.addAttribute("msg", "문의글 작성 실패되었습니다.");
			return "common/error";
		}
		
	}
	
	//QNA 관리자 답변 쓰기
	@GetMapping("adminWrite")
	public String adminWrite() throws Exception {
		return "qna/adminWrite";
	}
	
	//@PostMapping("adminWrite")	//답변
	
	
	
	
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
