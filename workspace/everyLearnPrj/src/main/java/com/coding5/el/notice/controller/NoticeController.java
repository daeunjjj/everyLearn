package com.coding5.el.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coding5.el.notice.service.NoticeService;
import com.coding5.el.notice.vo.NoticeVo;

@Controller
@RequestMapping("notice")
public class NoticeController {
	
	@Autowired private NoticeService ns;
	
	//공지사항 리스트
	@GetMapping("list")
	public String list() {
		return "notice/list";
	}
	
	//공지사항 글쓰기
	@GetMapping("write")
	public String write() {
		return "notice/write";
	}
	
	@PostMapping("write")
	public String write(NoticeVo vo) {
		int result = ns.write(vo);
		return "notice/write";
	}
	
	//공지사항 글 수정하기
	@GetMapping("edit")
	public String edit() {
		return "notice/edit";
	}
	
	//공지사항 상세조회
	@GetMapping("detail")
	public String detail() {
		return "notice/detail";
	}

}
