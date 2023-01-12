package com.coding5.el.qna.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.coding5.el.admin.vo.AdminVo;
import com.coding5.el.common.file.FileUploader;
import com.coding5.el.member.vo.MemberVo;
import com.coding5.el.notice.vo.PageVo;
import com.coding5.el.qna.service.QnaService;
import com.coding5.el.qna.vo.QnaVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("qna")
@Slf4j
public class QnaController {
	
	@Autowired QnaService qnaService;
	
	//QNA 리스트
	@GetMapping(value = {"/list/{page}", "/list"})
	public String list(Model model, @PathVariable(required=false) String page, HttpSession session) throws Exception {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		AdminVo loginAdmin = (AdminVo)session.getAttribute("loginAdmin");
		
		if(page == null) page = "1";
	
		//페이징 객체 필요함
		int cntPerPage = 10; //한 페이지당 row10개씩 보여주기
		int pageBtnCnt = 5;	//한번에 보여줄 페이지버튼 개수
		int totalRow = qnaService.getQnaCnt();
		PageVo pageVo = new PageVo(page, cntPerPage, pageBtnCnt, totalRow);
		
		//리스트 조회
		List<QnaVo> list = qnaService.getQnaList(pageVo);
		model.addAttribute("list", list);
		model.addAttribute("page", pageVo);
		
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
		
		// qna 이미지 저장
		String thumbName = "";
		if(!vo.getThumbFile().isEmpty()) {
			thumbName = FileUploader.upload(session, vo.getThumbFile());
		}
		
		vo.setThumb(thumbName);
		
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
	@GetMapping("answerAdminWrite")
	public String answerAdminWrite(@RequestParam(required=false) String no, Model model) throws Exception {
		
		model.addAttribute("q", qnaService.selectDetail(no));
		System.out.println("컨트롤러no::"+no);
		return "qna/answerAdminWrite";
	}
	
	@PostMapping("answerAdminWrite")	//답변 update로
	public String answerAdminWrite(QnaVo vo, HttpSession session, Model model) throws Exception {
		AdminVo loginAdmin = (AdminVo)session.getAttribute("loginAdmin");
		vo.setAdminNo(loginAdmin.getNo());
		
		// 답변 이미지 저장
		String thumbName = "";
		if(!vo.getThumbFile().isEmpty()) {
			thumbName = FileUploader.upload(session, vo.getThumbFile());
		}
		
		vo.setThumb(thumbName);
		
		int result = qnaService.answerAdminWrite(vo);
		System.out.println("컨트롤러vo::"+vo);
		if(result > 0) {
			//답변 등록 된 순간에 답변 상태가 답변 Y로 update 되게 조회수처럼
			session.setAttribute("alertMsg", "답변이 등록되었습니다.");
			return "redirect:/qna/detail?no=" + vo.getNo();
		}else {
			model.addAttribute("msg", "답변 등록이 실패되었습니다.");
			return "common/error";
		}
		
	}
	
	
	//QNA 상세보기
	@GetMapping("detail")
	public String detail(@RequestParam(required=false) String no, Model model, HttpSession session, QnaVo vo)  throws Exception {
		AdminVo loginAdmin = (AdminVo)session.getAttribute("loginAdmin");
		
		QnaVo q = qnaService.selectDetail(no);
		model.addAttribute("q", q);
		
		return "qna/detail";
	}
		
	
	
}
