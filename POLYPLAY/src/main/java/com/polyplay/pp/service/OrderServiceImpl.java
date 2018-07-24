package com.polyplay.pp.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.polyplay.pp.domain.BasketListVo;
import com.polyplay.pp.domain.OrderPayVo;
import com.polyplay.pp.persistence.OrderService_Mapper;


@Service("orderServiceImpl")
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	SqlSession sqlSession;
	

	
/*	@Override
	public ArrayList<BasketListVo> selectBasket(int midx, int cidx) {
		
		OrderService_Mapper mpsm = sqlSession.getMapper(com.polyplay.pp.persistence.OrderService_Mapper.class);
//		ArrayList<BasketListVo> balist = mpsm.selectBasket(blvo);
		ArrayList<BasketListVo> balist = mpsm.selectBasket(midx, cidx);
		
		return balist;
	}
*/

	
	@Override
	public int insertJustOrder(OrderPayVo opv) {

		OrderService_Mapper mpsm = sqlSession.getMapper(com.polyplay.pp.persistence.OrderService_Mapper.class);
		int result = mpsm.insertJustOrder(opv);
		
		System.out.println("insertJustOrder결과값: "+result);
		
		return result;
	}


	
	
	
	@Override
	public int insertOrder(OrderPayVo opv) {
		
		OrderService_Mapper mpsm = sqlSession.getMapper(com.polyplay.pp.persistence.OrderService_Mapper.class);
		int result1 = mpsm.insertOrder(opv);
		System.out.println("insertOrder결과값: "+result1);
		

		
		
		return result1;
	}
	
	
	
	@Override
	public ArrayList<OrderPayVo> selectOrder(String oid) {
		
		OrderService_Mapper mpsm = sqlSession.getMapper(com.polyplay.pp.persistence.OrderService_Mapper.class);
		ArrayList<OrderPayVo> olist = mpsm.selectOrder(oid);
		
		System.out.println("selectOrder결과값: "+olist);
		
		return olist;
	}

	

	@Override
	public int insertPay(OrderPayVo opv) {

		OrderService_Mapper mpsm = sqlSession.getMapper(com.polyplay.pp.persistence.OrderService_Mapper.class);
		int result = mpsm.insertPay(opv);
		
		System.out.println("insertPay결과값: "+result);
		
		return result;
	}


	


	@Override
	public ArrayList<OrderPayVo> selectCheckOrder(OrderPayVo opv) {
		
		OrderService_Mapper mpsm = sqlSession.getMapper(com.polyplay.pp.persistence.OrderService_Mapper.class);
		ArrayList<OrderPayVo> reopv = mpsm.selectCheckOrder(opv);
		
		System.out.println("selectCheckOrder결과값: "+reopv);
		
		
		return reopv;
	}






}
