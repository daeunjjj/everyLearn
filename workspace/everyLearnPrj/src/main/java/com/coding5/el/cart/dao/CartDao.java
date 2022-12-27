package com.coding5.el.cart.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.coding5.el.cart.vo.CartVo;
import com.coding5.el.member.vo.MemberVo;

public interface CartDao {
	
	//카트에 넣기
	public int addCart(CartVo cartVo, MemberVo loginMember, SqlSessionTemplate sst);

}
