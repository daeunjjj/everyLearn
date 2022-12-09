package com.coding5.el;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainPageController {

	@GetMapping("mainPage")
	public String mainPage() {
		return "common/mainPage";
	}

}
