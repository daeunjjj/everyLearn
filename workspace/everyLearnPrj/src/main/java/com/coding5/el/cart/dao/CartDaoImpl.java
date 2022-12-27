package com.coding5.el.cart.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.coding5.el.cart.vo.CartVo;
import com.coding5.el.member.vo.MemberVo;

@Repository
public class CartDaoImpl implements CartDao{

	@Override
	public int addCart(CartVo cartVo, MemberVo loginMember, SqlSessionTemplate sst) {
		
		return sst.insert("cartMapper.addCartOne", cartVo);
	}

}
