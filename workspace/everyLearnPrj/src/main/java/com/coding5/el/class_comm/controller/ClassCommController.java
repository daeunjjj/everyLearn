package com.coding5.el.class_comm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coding5.el.class_comm.service.ClassCommService;
import com.coding5.el.class_comm.vo.ClassCommVo;
import com.google.gson.Gson;
import com.google.gson.JsonArray;

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
	
	//질답 화면
	@GetMapping("qna")
	public String qna(Model model) {
		
		List<ClassCommVo> qnaList = ccs.qnaList();
//		log.info("큐앤에이 리스트" + qnaList);
		model.addAttribute("qnaList", qnaList);
//		log.info("qnaList" + qnaList);
		
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
		ClassCommVo detailVo = ccs.detailVo(classCommNo);
		model.addAttribute("detailVo", detailVo);
		
		return "class_comm/detail";
	}
	
	//신고(화면)
	@GetMapping("report")
	public String report(String blacklist, String refortTitle, Model model) {
		
		log.info("블랙리스트" + blacklist);
		log.info("글 제목" + refortTitle);

	    Gson gson = new Gson();
	    HashMap<String, Object> map = new HashMap<String, Object>();
	    
	    // key-value 형태로 맵에 저장
	    map.put("blacklist", blacklist);
	    
	    model.addAttribute("reportMap", map);
	   
//	   // 맵을 JSON Object를 바꾸고 다시 문자열로 바꿈
//	    String jsonString = gson.toJson(map);
		
		return "class_comm/report_write";
		
	}
	

	
	//신고
	@PostMapping("report")
	public String report(String blacklistNo, String accusor, String cate_op, String board) {
		
		ClassCommVo vo = new ClassCommVo();
		vo.setBlacklistNo(blacklistNo);
		vo.setAccusor(accusor);
		vo.setCate_no(cate_op);
		vo.setBoard(board);
		
		
		int result = ccs.report(vo);
		
		return "class_comm/report_write";
	}
	
	@PostMapping("comment")
	public String comment(String content) {
		
		return "success";
		
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
	
	


	
	//사이드바
	@GetMapping("sidebar")
	public String sidebar() {
		return "class_comm/sidebar";
	}
	
	
}
