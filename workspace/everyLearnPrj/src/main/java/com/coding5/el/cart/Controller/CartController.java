package com.coding5.el.cart.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coding5.el.cart.Service.CartService;
import com.coding5.el.cart.vo.CartVo;
import com.coding5.el.member.vo.MemberVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("cart")
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	
	@GetMapping("addCart")
	public String addCart() {
		return "redirect:/lecture/cart";
	}
	
	//장바구니 (찐)
	@PostMapping("addCart")
	public String addCart(CartVo cartVo, HttpServletRequest request) {
		// 로그인 체크
		HttpSession session = request.getSession();
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		System.out.println(loginMember);
		
		if(loginMember == null) {
			return "member/login";
		}
		
		int result = cartService.addCart(cartVo, loginMember);
		
		return result + "";
	}
	

}
