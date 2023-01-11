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
import com.coding5.el.lecture.service.LectureService;
import com.coding5.el.member.vo.MemberVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("cart")
public class CartController {

	@Autowired
	private CartService cartService;
	@Autowired
	private LectureService lectureService;

	
	// 장바구니에 담기 (찐)
	@PostMapping("addCart")
	public String addCart(HttpServletRequest request, String classNo, String memberNo) {

		HashMap<String, String> map = new HashMap<>();
		map.put("classNo", classNo);
		map.put("memberNo", memberNo);

		int result = cartService.addCart(map);
		if (result == 1) {
		return "redirect:/cart/addCart";
		}else {
			return "common/error";
		}
		
	}

	// 장바구니 화면
	@GetMapping("addCart")
	public String cartList(HttpSession session, Model model) {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		if (loginMember == null) {
			return "member/login";
		}
		String mno = loginMember.getMemberNo();
		int mp = cartService.getPoint(mno);
		
		int checkCart = cartService.checkCart(mno);

		List<CartVo> list = cartService.getCartList(mno);
		if(list.size()!=0) {
			model.addAttribute("loginMember", loginMember);
			model.addAttribute("mno", mno);
			model.addAttribute("list", list);
			model.addAttribute("mp", mp);
			model.addAttribute("checkCart", checkCart);
			return "lecture/cart";
		}else {
			return "lecture/cart";
		}

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
	 

	  //장바구니 삭제
	  @PostMapping("delete")
	  public String deleteList(HttpSession session, Model model, String classNo, String memberNo) {
		  
		  MemberVo loginMember = (MemberVo)session.getAttribute("loginMember"); 
		 
		  if (loginMember == null) {
				return "member/login";
			}
		  memberNo = loginMember.getMemberNo();
		 log.info("delete memberNo : " + memberNo);
		 
		 HashMap<String, String>map = new HashMap<>(); 
		 	map.put("classNo", classNo);
		 	map.put("memberNo", memberNo);
		  int result = cartService.deleteCart(map);
		  
		  if(result == 1) {
		 //model.addAttribute(no);
		  return "redirect:/cart/addCart";
		  }else {
			  return "common/error";
		  }
		  
	  }
	  
	  //찜 목록 삭제
	  @PostMapping("wish/delete")
	  public String deleteWish(HttpSession session, Model model, String classNo, String memberNo) {
		  MemberVo loginMember = (MemberVo)session.getAttribute("loginMember"); 
			 
		  if (loginMember == null) {
				return "member/login";
			}
		  memberNo = loginMember.getMemberNo();
		  log.info("delete memberNo : " + memberNo);
		  System.out.println("여기까진 옴?");
			 
			 HashMap<String, String>map = new HashMap<>(); 
			 	map.put("classNo", classNo);
			 	map.put("memberNo", memberNo);
			  int result = cartService.deleteWish(map);
			  
			  if(result == 1) {
			 //model.addAttribute(no);
			  return "redirect:/cart/addWish";
			  }else {
				  return "common/error";
			  }
		  
	  }

}
