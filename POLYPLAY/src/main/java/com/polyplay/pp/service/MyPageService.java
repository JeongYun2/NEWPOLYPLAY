package com.polyplay.pp.service;

import java.util.ArrayList;

import com.polyplay.pp.domain.BasketListVo;
import com.polyplay.pp.domain.ContentsVo;
import com.polyplay.pp.domain.MemberVo;
import com.polyplay.pp.domain.OrderPayVo;
import com.polyplay.pp.domain.WishListVo;



public interface MyPageService {

	
//	public int addToBasket(BasketVo bav);
	
//	public int addToWishList(WishListVo wv);
	
	
	public ArrayList<BasketListVo> selectBasketList(int midx);
	
	public ArrayList<WishListVo> selectMyWishList(int midx);
	
	
	public int fromBaToWish(int midx, int cidx);
	

	public int deleteBasket(int midx, int cidx);
	
	
	public int insertWishList(int midx, int cidx); //얘는 그냥 장바구니담기용
	
	
	public int insertBasket(BasketListVo blv);
	
	public ArrayList<OrderPayVo> selectMyContents(int midx);
	
	
	
	public ArrayList<OrderPayVo> selectMyOrder(int midx);
	
	
	
	
}
