package com.coding5.el.cart.Service;

import java.util.HashMap;
import java.util.List;

import com.coding5.el.cart.vo.CartVo;
import com.coding5.el.member.vo.MemberVo;

public interface CartService {
	
	//장바구니 추가
	public int addCart(HashMap<String, String> map);

	//장바구니 목록 조회
	public List<CartVo> getCartList(String mno);

}