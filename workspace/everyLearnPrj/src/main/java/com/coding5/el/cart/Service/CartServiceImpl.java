package com.coding5.el.cart.Service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding5.el.cart.dao.CartDao;
import com.coding5.el.cart.vo.CartVo;
import com.coding5.el.member.vo.MemberVo;

@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	private SqlSessionTemplate sst;
	@Autowired
	private CartDao cartDao;
	
	//장바구니 등록
	@Override
	public int addCart(HashMap<String, String> map) {
		return cartDao.addCart(map, sst);
	}
	
	//장바구니 목록 조회
	@Override
	public List<CartVo> getCartList(String mno) {
		return cartDao.getCartList(mno, sst);
	}
	

}