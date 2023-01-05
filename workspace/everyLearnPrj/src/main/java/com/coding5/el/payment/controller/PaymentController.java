package com.coding5.el.payment.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coding5.el.member.vo.MemberVo;
import com.coding5.el.payment.service.PaymentService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("payment")
public class PaymentController {
	
	
  @Autowired 
  private PaymentService paymentService;
	 
	
	//결제 내용 저장
	@PostMapping("info")
	public String info(HttpSession session, Model model, String amount, String usePoint) {
		
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		String mno = loginMember.getMemberNo();
		
		System.out.println("mno :: " + mno);
		System.out.println("amount :: " + amount);
		System.out.println("up :: " + usePoint);
		
		HashMap<String, String> map = new HashMap<>();
		map.put("mno", mno);
		map.put("amount", amount);
		map.put("usePoint", usePoint);
		
		int result = paymentService.addPayInfo(map);
		//buy로 바꿔서 구매정보 먼저 만들고 buy -> buylist ->payment 순으로 갈 수 있게끔
		//배열 받아오기 질문
		
		if(result == 1) {
			int result2 = paymentService.addPoint(map);
			return "lecture/complete_payment";
		}else {
			return "common/error";
		}
		
		
	}

}
