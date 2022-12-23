package com.coding5.el.class_comm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coding5.el.class_comm.service.ClassCommService;
import com.coding5.el.class_comm.vo.ClassCommVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("class")
@Controller
public class ClassCommController {
	
	@Autowired
	private ClassCommService ccs;

	//게시글 등록(화면)
	@GetMapping("write")
	public String write() {
		return "class_comm/comm_write";
	}
	
	//게시글 등록
	@PostMapping("write")
	public String write(ClassCommVo vo) {
		
		int result = ccs.write(vo);
		
		if(result != 1) {
			return "common/error";
		}
		
		return "class_comm/qna";
	}
	
	//질문과 화면
	@GetMapping("qna")
	public String qna(Model model) {
		
		List<ClassCommVo> qnaList = ccs.qnaList();
//		log.info("큐앤에이 리스트" + qnaList);
		model.addAttribute("qnaList", qnaList);
		log.info("qnaList" + qnaList);
		
		if(qnaList == null) {
			return "common/error";
		}
		
		return "class_comm/qna";
	}
	
	//질문과 답변
	@PostMapping("qna")
	public String qna() {
		

		
		return "class_comm/qna";
	}
	
	//게시글 상세(화면)
	@GetMapping("detail")
	public String detail(String classCommNo, Model model) {
		log.info("classCommNo" + classCommNo);
		List<ClassCommVo> detailList = ccs.detailList(classCommNo);
		log.info("detailList :: " + detailList);
		model.addAttribute("detailList", detailList);
		
		return "class_comm/detail";
	}
	
	//스터디
	@GetMapping("study")
	public String study() {
		return "class_comm/study";
	}
	
	//자유게시판
	@GetMapping("free")
	public String free() {
		return "class_comm/free";
	}
	
	
	//신고(화면)
	@GetMapping("report")
	public String report() {
		return "class_comm/report_write";
	}
	

	
	//사이드바
	@GetMapping("sidebar")
	public String sidebar() {
		return "class_comm/sidebar";
	}
	
	
}
