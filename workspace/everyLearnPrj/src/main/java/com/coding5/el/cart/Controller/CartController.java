package com.coding5.el.cart.Controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

	/*
	 * @GetMapping("addCart") public String addCart() { return
	 * "redirect:/lecture/cart"; }
	 */
	// 장바구니에 담기 (찐)
	@PostMapping("addCart")
	public String addCart(HttpServletRequest request, String classNo, String memberNo) {

		HashMap<String, String> map = new HashMap<>();
		map.put("classNo", classNo);
		map.put("memberNo", memberNo);

		int result = cartService.addCart(map);

		// return result + "";
		return "redirect:/cart/addCart";
	}

	// 장바구니 화면
	@GetMapping("addCart")
	public String cartList(HttpSession session, Model model) {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		if (loginMember == null) {
			return "member/login";
		}
		String mno = loginMember.getMemberNo();

		List<CartVo> list = cartService.getCartList(mno);
		// System.out.println("controller list : " + list);
		model.addAttribute("loginMember", loginMember);
		model.addAttribute("mno", mno);
		model.addAttribute("list", list);
		return "lecture/cart";

	}

	
	  //찜에 담기(찐)
	  
	  @PostMapping("addWish") 
	  public String addWish( HttpServletRequest request, String classNo, String memberNo) {
	  
		  HashMap<String, String>map = new HashMap<>(); map.put("classNo", classNo);
		  map.put("memberNo", memberNo);
	 
	  int result = cartService.addWish(map);
	  
	  //return result + ""; 
	  return "redirect:/cart/addWish"; 

	  }
	  
	  //찜 화면
	  
	  @GetMapping("addWish") 
	  public String wishList(HttpSession session, Model model) { 
		  MemberVo loginMember = (MemberVo)session.getAttribute("loginMember"); 
		  
		  if (loginMember == null) {
				return "member/login";
			}
		  
		  String mno = loginMember.getMemberNo();
	  
		  List<CartVo> list = cartService.getWishList(mno);
		  //System.out.println("controller list : " + list);
		  model.addAttribute("loginMember", loginMember); 
		  model.addAttribute("mno",mno); 
		  model.addAttribute("list", list); 
		  return "lecture/wish";
	  
	  }
	 

	/*
	 * // 찜하기
	 * 
	 * @ResponseBody
	 * 
	 * @PostMapping("/store/likes") public long likes(String classNo, String
	 * memberNo, String likes, HttpServletRequest request, HttpServletResponse
	 * response, HttpSession session) throws UnsupportedEncodingException {
	 * System.out.println("찜하기id =  " + memberNo + " " + likes);
	 * 
	 * MemberVo loginMember = (MemberVo)session.getAttribute("loginMember"); String
	 * mno = loginMember.getMemberNo(); if (loginMember == null) {
	 * 
	 * 
	 * } else { System.out.println("찜하기 회원"); userId = user.getUser().getId();
	 * storeService.likes(id, likes, userId); }
	 * 
	 * return userId; }
	 */

}
