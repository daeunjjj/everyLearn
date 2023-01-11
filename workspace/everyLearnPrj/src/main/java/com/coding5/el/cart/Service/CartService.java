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
	
	//찜 추가
	public int addWish(HashMap<String, String> map);
	
	//찜 목록 조회
	public List<CartVo> getWishList(String mno);

	//장바구니 삭제
	public int deleteCart(HashMap<String, String> map);

	//찜 삭제
	public int deleteWish(HashMap<String, String> map);
	
	//포인트 조회
	public int getPoint(String mno);

	//장바구니에 상품 담겨있는지 체크
	public int checkCart(String mno);

}
