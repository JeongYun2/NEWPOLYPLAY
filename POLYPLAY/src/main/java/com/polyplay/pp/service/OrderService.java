package com.polyplay.pp.service;

import java.util.ArrayList;

import com.polyplay.pp.domain.BasketListVo;
import com.polyplay.pp.domain.OrderPayVo;


public interface OrderService {
	
//	public ArrayList<BasketListVo> selectBasket(BasketListVo blvo);
	
//	public ArrayList<BasketListVo> selectBasket(int midx, int cidx);
	
	public int insertJustOrder(OrderPayVo opv);
	
	public int insertOrder(OrderPayVo opv);
	
	public ArrayList<OrderPayVo> selectOrder(String oid);
	
	public int insertPay(OrderPayVo opv);
	
	
	public ArrayList<OrderPayVo> selectCheckOrder(OrderPayVo opv);

	
	
	
	
	
	
	
	
	
//	public int insertOrderPay(OrderPayVo opv);
	

	
}
