package com.coding5.el.cart.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.coding5.el.cart.vo.CartVo;
import com.coding5.el.member.vo.MemberVo;

@Repository
public class CartDaoImpl implements CartDao{

	//장바구니 추가
	@Override
	public int addCart(HashMap<String, String> map, SqlSessionTemplate sst) {
		return sst.insert("cartMapper.addCartOne", map);
	}

	//장바구니 목록 조회
	@Override
	public List<CartVo> getCartList(String mno, SqlSessionTemplate sst) {
		return sst.selectList("cartMapper.getCartList", mno);
	}

	//찜 목록 조회
	@Override
	public List<CartVo> getWishList(String mno, SqlSessionTemplate sst) {
		return sst.selectList("cartMapper.getWishList", mno);
	}
	
	//찜 추가
	@Override
	public int addWish(HashMap<String, String> map, SqlSessionTemplate sst) {
		return sst.insert("cartMapper.addWishOne", map);
	}
	
	
	//장바구니 삭제
	@Override
	public int deleteCart(HashMap<String, String> map, SqlSessionTemplate sst) {
		return sst.delete("cartMapper.deleteCart", map);
	}
	
	
	//찜 삭제
	@Override
	public int deleteWish(HashMap<String, String> map, SqlSessionTemplate sst) {
		return sst.delete("cartMapper.deleteWish", map);
	}
	
	//포인트 가져오기
	@Override
	public int getPoint(SqlSessionTemplate sst, String mno) {
		return sst.selectOne("cartMapper.getPoint", mno);
	}



}
