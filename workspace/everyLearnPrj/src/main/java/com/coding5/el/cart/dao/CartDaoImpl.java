package com.coding5.el.cart.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.coding5.el.cart.vo.CartVo;
import com.coding5.el.member.vo.MemberVo;

@Repository
public class CartDaoImpl implements CartDao{

	@Override
	public int addCart(HashMap<String, String> map, SqlSessionTemplate sst) {
		return sst.insert("cartMapper.addCartOne", map);
	}

	@Override
	public List<CartVo> getCartList(String mno, SqlSessionTemplate sst) {
		return sst.selectList("cartMapper.getCartList", mno);
	}



}
