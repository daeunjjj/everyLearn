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
	
	//찜 등록
	@Override
	public int addWish(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return cartDao.addWish(map, sst);
	}
	
	//찜 목록 조회
	@Override
	public List<CartVo> getWishList(String mno) {
		// TODO Auto-generated method stub
		return cartDao.getWishList(mno, sst);
	}

	//장바구니 삭제

	@Override
	public int deleteCart(HashMap<String, String> map) {
		return cartDao.deleteCart(map, sst);
	}

	//찜 삭제
	@Override
	public int deleteWish(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return cartDao.deleteWish(map, sst);
	}
	
	//포인트 조회
	@Override
	public int getPoint(String mno) {
		return cartDao.getPoint(sst, mno);
	}

	//장바구니에 상품 담겨있는지 체크
	@Override
	public int checkCart(String mno) {
		return cartDao.checkCart(sst, mno);
	}
	
	//
	

}
