package com.polyplay.pp.persistence;

import java.util.ArrayList;

import com.polyplay.pp.domain.BasketListVo;
import com.polyplay.pp.domain.OrderPayVo;


public interface OrderService_Mapper {
	
//	public ArrayList<BasketListVo> selectBasket(BasketListVo blvo);
//	public ArrayList<BasketListVo> selectBasket(int midx, int cidx);

	public int insertJustOrder(OrderPayVo opv);
	
	
	public int insertOrder(OrderPayVo opv);
	
	public ArrayList<OrderPayVo> selectOrder(String oid);
	

	public int insertPay(OrderPayVo opv);
	

	
	public ArrayList<OrderPayVo> selectCheckOrder(OrderPayVo opv);
	
	
	

}
