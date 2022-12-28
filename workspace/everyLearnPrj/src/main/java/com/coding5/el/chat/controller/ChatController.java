package com.coding5.el.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatController {
	
	@GetMapping("chat/main")
	public String main() {
		return "chat/main";
	}

}
