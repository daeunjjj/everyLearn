package com.coding5.el.class_comm.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@RestController
public class CommentController {
	//댓글 에이젝스
	
	@PostMapping("commentAjax")
	public String comment(String content) {
		
		log.info("content :: " + content);
		
		return "11";
		
	}
}
