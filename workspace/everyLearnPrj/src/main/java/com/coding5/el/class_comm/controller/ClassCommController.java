package com.coding5.el.class_comm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.coding5.el.class_comm.service.ClassCommService;
import com.coding5.el.class_comm.vo.ClassCommVo;

@Controller
public class ClassCommController {
	
	private ClassCommService ccs;

	//게시글 등록(화면)
	@GetMapping("class/write")
	public String write() {
		return "class_comm/comm_write";
	}
	
	//게시글 등록
	@PostMapping("class/write")
	public String write(ClassCommVo vo) {
		
		int result = ccs.write(vo);
		
		return "class_comm/comm_write";
	}
	
	//질문과 답변
	@GetMapping("class/qna")
	public String qna() {
		return "class_comm/qna";
	}
	
	//스터디
	@GetMapping("class/study")
	public String study() {
		return "class_comm/study";
	}
	
	//자유게시판
	@GetMapping("class/free")
	public String free() {
		return "class_comm/free";
	}
	
	
	//신고(화면)
	@GetMapping("class/report")
	public String report() {
		return "class_comm/report_write";
	}
	
	//게시글 상세(화면)
	@GetMapping("class/detail")
	public String detail() {
		return "class_comm/detail";
	}
	
	//사이드바
	@GetMapping("class/sidebar")
	public String sidebar() {
		return "class_comm/sidebar";
	}
	
	
}
