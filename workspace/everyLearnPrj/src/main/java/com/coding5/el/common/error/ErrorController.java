package com.coding5.el.common.error;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorController {
	@GetMapping("error")
	public String error() {
		return "common/error";
	}
}
