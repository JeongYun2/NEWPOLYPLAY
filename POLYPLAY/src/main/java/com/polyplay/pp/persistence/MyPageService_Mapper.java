package com.polyplay.pp.persistence;

import java.util.ArrayList;

import com.polyplay.pp.domain.BasketListVo;
import com.polyplay.pp.domain.ContentsVo;
import com.polyplay.pp.domain.OrderPayVo;
import com.polyplay.pp.domain.WishListVo;

public interface MyPageService_Mapper {
	
	public ArrayList<BasketListVo> selectBasketList(int midx);
	
	public ArrayList<WishListVo> selectMyWishList(int midx);
	

	
//	public int fromBaToWish(WishListVo wv);

	public int deleteBasket(int midx, int cidx);
	
	public int selectWishListCheck(int midx, int cidx);
	
	public int insertWishList(int midx, int cidx); //얘는 그냥 장바구니담기에서도 씀
	
//세개

	public int insertBasket(BasketListVo blv);
	

	public ArrayList<OrderPayVo> selectMyContents(int midx);
	

	
	public ArrayList<OrderPayVo> selectMyOrder(int midx);
	
	
}
