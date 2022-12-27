package com.coding5.el.cart.Service;

import com.coding5.el.cart.vo.CartVo;
import com.coding5.el.member.vo.MemberVo;

public interface CartService {
	
	//장바구니 추가
	public int addCart(CartVo cartVo, MemberVo loginMember);

}
