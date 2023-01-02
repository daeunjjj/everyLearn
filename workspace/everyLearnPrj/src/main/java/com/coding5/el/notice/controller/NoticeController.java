package com.coding5.el.notice.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
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

import com.coding5.el.notice.service.NoticeService;
import com.coding5.el.notice.vo.NoticeVo;
import com.coding5.el.notice.vo.PageVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("notice")
@Slf4j
public class NoticeController {
	
	@Autowired NoticeService noticeService;
	
	@GetMapping("header")
	public String header() {
		return "notice/notice-header";
	}
	
	@GetMapping("writeTest")
	public String writeTest() {
		return "notice/writeTest";
	}
	
	//공지 상세 조회
	@GetMapping("detail")
	public String detail(String no, Model model) throws Exception {
		
		int result = noticeService.increaseHit(no);
		
		if(result > 0) {
			NoticeVo n = noticeService.selectDetail(no);
			model.addAttribute("n", n);
			return "notice/detail";
		} else {
			return "common/error";
		}

		
		
	}
	
	//회원이 보는 공지 리스트
	@GetMapping(value = {"/list/{page}", "/list"})
	public String list(Model model, @PathVariable(required=false) String page) throws Exception {
		if(page == null) page = "1";
		
		//페이징 객체 필요함
		int cntPerPage = 10; //한 페이지당 row10개씩 보여주기
		int pageBtnCnt = 5;	//한번에 보여줄 페이지버튼 개수
		int totalRow = noticeService.getNoticeCnt();	//db에 있는 모든 row 개수
		PageVo pageVo = new PageVo(page, cntPerPage, pageBtnCnt, totalRow);
		
		//리스트 조회
		List<NoticeVo> list = noticeService.getNoticeList(pageVo);
		model.addAttribute("list", list);
		model.addAttribute("page", pageVo);
		return "notice/list";
	}

	//공지사항 관리자 페이지에서 리스트 보여주기
	@GetMapping(value = {"/adminList/{page}", "/adminList"})
	public String adminList(Model model, @PathVariable(required=false) String page) throws Exception {
		if(page == null) page = "1";
		
		//페이징 객체 필요함
		int cntPerPage = 10; //한 페이지당 row10개씩 보여주기
		int pageBtnCnt = 5;	//한번에 보여줄 페이지버튼 개수
		int totalRow = noticeService.getNoticeCnt();	//db에 있는 모든 row 개수
		PageVo pageVo = new PageVo(page, cntPerPage, pageBtnCnt, totalRow);
		
		//리스트 조회
		List<NoticeVo> list = noticeService.getNoticeList(pageVo);
		model.addAttribute("list", list);
		model.addAttribute("page", pageVo);
		return "notice/adminList";
	}
	
	//공지사항 작성 화면 보여주기(디비가서 리스트 조회)
	@GetMapping("write")
	public String write() {	
		return "notice/write";
	}
	
	//공지사항 작성
	@PostMapping("write")
	public String write(NoticeVo vo, HttpSession session, Model model) throws Exception {
		
		int result = noticeService.write(vo);
		if(result > 0) {
			session.setAttribute("alertMsg", "공지 등록 성공");
			return "redirect:/notice/adminList";
		}else {
			model.addAttribute("msg", "공지사항 작성 실패");
			return "common/error";
		}
	}
	
	//공지사항 삭제
	@PostMapping("delete")
	@ResponseBody
	public String delete(String str) throws Exception {
		//System.out.println(str);	// 삭제할 번호들: 1, 5, ...
		//System.out.println(str.length()/2);	// 
		
		int result = noticeService.deleteNotice(str);
		
		//log.warn("선택한 row 개수 : {}", result);
		
		if(result == str.length()/2) {
			return "ok";
		}else {
			return "fail_" + result;
		}
		
	}
	
	//공지사항 수정하기 (화면)
	@GetMapping("edit")
	public void edit(@RequestParam("no")String no, Model model) throws Exception {
		model.addAttribute("n", noticeService.selectDetail(no));	
	}
	
	//공지사항 수정하기
	@PostMapping("edit")
	public String edit(NoticeVo vo, HttpSession session, Model model) throws Exception {
		
		int result = noticeService.editNotice(vo);	
		
		if(result > 0) { 
		
			session.setAttribute("alertMsg", "공지 수정 성공");
			
			return "redirect:/notice/detail?no=" + vo.getNo();
		}
		else { // 실패 => 에러페이지 포워딩
			
			model.addAttribute("errorMsg", "공지 수정 실패");
			
			return "common/error";
		}
		
		

	}
}

	
	
