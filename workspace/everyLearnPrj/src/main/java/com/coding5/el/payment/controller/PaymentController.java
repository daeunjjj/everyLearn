package com.coding5.el.payment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coding5.el.payment.service.PaymentService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("payment")
public class PaymentController {
	
	/*
	 * @Autowired private PaymentService paymentService;
	 */
	
	@PostMapping("info")
	public String info() {
		System.out.println("info");
		return "";
	}

}
