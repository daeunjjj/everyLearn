package com.coding5.el.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.coding5.el.common.page.PageVo;
import com.coding5.el.common.page.Pagination;
import com.coding5.el.notice.service.NoticeService;
import com.coding5.el.notice.vo.NoticeVo;

@Controller
@RequestMapping("notice")
public class NoticeController {
	
	@Autowired private NoticeService noticeService;
	
	//공지사항 리스트
	@GetMapping("list")
	public String list(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model) {
		
		int listCount = noticeService.selectListCount();

		int pageLimit = 10;
		int boardLimit = 5;

		PageVo pv = Pagination.getPageVo(listCount, currentPage, pageLimit, boardLimit);
		
		List<NoticeVo> voList = noticeService.selectList(pv);
		model.addAttribute("pv", pv);
		model.addAttribute("voList", voList);
		
		return "notice/list";
	}
	
	//공지사항 글쓰기
	@GetMapping("write")
	public String write() {
		return "notice/write";
	}
	
	@PostMapping("write")
	public String write(NoticeVo vo) {
		int result = noticeService.write(vo);
		
		if(result == 1) {
			return "notice/detail";			
		} else {
			return "common/error";
		}
	}
	
	//공지사항 글 수정하기
	@GetMapping("edit")
	public String edit() {
		return "notice/edit";
	}
	
	
	
	/*
	 * //공지사항 상세조회
	 * 
	 * @GetMapping("detail") public String detail(int noticeNo, Model model) {
	 * 
	 * NoticeVo nv = noticeService.detail(noticeNo);
	 * 
	 * model.addAttribute("nv", nv);
	 * 
	 * return "notice/detail"; }
	 */

}
