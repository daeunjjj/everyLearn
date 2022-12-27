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

}
