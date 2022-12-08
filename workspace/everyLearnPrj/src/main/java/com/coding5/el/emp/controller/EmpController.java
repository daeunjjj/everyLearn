package com.coding5.el.emp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;

@Repository("emp")
@Controller
public class EmpController {

	@GetMapping("empMain")
	public String empMain() {
		return "emp/empMain";
	}
	
	
}
