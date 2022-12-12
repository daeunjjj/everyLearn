package com.coding5.el.request.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RequestController {
	@GetMapping("request")
	public String request() {
		return "everylearn/request";
	}
}
