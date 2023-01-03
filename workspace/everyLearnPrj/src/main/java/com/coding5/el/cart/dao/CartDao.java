package com.coding5.el.cart.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.coding5.el.cart.vo.CartVo;
import com.coding5.el.member.vo.MemberVo;

public interface CartDao {
	
	//카트에 넣기
	public int addCart(HashMap<String, String> map, SqlSessionTemplate sst);

	//장바구니 조회
	public List<CartVo> getCartList(String mno, SqlSessionTemplate sst);
	
	//찜 목록 조회
	public List<CartVo> getWishList(String mno, SqlSessionTemplate sst);

	//찜에 넣기
	public int addWish(HashMap<String, String> map, SqlSessionTemplate sst);

	
	//장바구니 삭제
	public int deleteCart(HashMap<String, String> map, SqlSessionTemplate sst);

	//찜 삭제
	public int deleteWish(HashMap<String, String> map, SqlSessionTemplate sst);
	
	//포인트 가져오기
	public int getPoint(SqlSessionTemplate sst, String mno);

}
