package com.coding5.el.payment.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.coding5.el.lecture.vo.LectureVo;
import com.coding5.el.member.vo.MemberVo;
import com.coding5.el.payment.service.PaymentService;
import com.coding5.el.payment.vo.PaymentVo;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import kotlinx.serialization.descriptors.StructureKind.MAP;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("payment")
public class PaymentController {

	@Autowired
	private PaymentService paymentService;

	//결제 정보 저장 : 주문 -> 결제 테이브 순으로
	@PostMapping("info")
	public String payInfo(String classData, String usedPoint, String amount, HttpServletRequest req, HttpSession session) {
		System.out.println("=====");
		System.out.println(classData);
		System.out.println("=====");
		
		// 회원 불러오기(session)
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String no = loginMember.getMemberNo();
		LectureVo lecVo = (LectureVo)session.getAttribute("lecVo");
		
		//포인트 사용 안하면 0으로
		if (usedPoint == null ) {
			usedPoint = "0";
		}
		//json 문자열 => list
		String jsonStr = classData;
		
		// Gson 객체 생성
		Gson gson = new Gson();

//		List<PaymentVo> numList = gson.fromJson(jsonStr, new TypeToken<List<PaymentVo>>(){}.getType());
		Map<String , List> numMap = gson.fromJson(jsonStr, Map.class);
		List list = numMap.get("checkArray");
		System.out.println("list : " + list);
		
		
		double percent = 0.01;
		double num = Double.parseDouble(amount);
		double savedPoint = num * percent;
		
		String savedPointstr = String.format("%.0f", savedPoint);
		System.out.println("str : " + savedPointstr);
		
		List<PaymentVo> payList = new ArrayList<PaymentVo>();
		  for(int i = 0; i < list.size(); i++) { 
			  PaymentVo payVo = new PaymentVo();
			  payVo.setMemberNo(no); 
			  payVo.setClassNo((String) list.get(i));
			  payVo.setUsePoint(usedPoint);
			  payVo.setSavePoint(savedPointstr);
			  payVo.setSum(amount);
			  payList.add(payVo);
		  
		  }
		 
		
		
		System.out.println("no : " + no);
		System.out.println("포인트 : " + usedPoint);
		
		//주문 테이블 추가
		int result = paymentService.addBuy(payList, lecVo);
		if (result > 0) {
			//주문정보 테이블 추가
			//int result2 = paymentService.addBuyList(payList);
			System.out.println("====================");
			System.out.println("드 디 어 완 료");
			return "lecture/complete_payment";
		}
				
		return "lecture/complete_payment";
	}

}
