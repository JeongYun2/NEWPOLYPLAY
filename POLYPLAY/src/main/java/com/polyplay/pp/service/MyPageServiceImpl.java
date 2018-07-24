package com.polyplay.pp.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.polyplay.pp.domain.BasketListVo;
import com.polyplay.pp.domain.ContentsVo;
import com.polyplay.pp.domain.MemberVo;
import com.polyplay.pp.domain.OrderPayVo;
import com.polyplay.pp.domain.WishListVo;
import com.polyplay.pp.persistence.MyPageService_Mapper;


@Service("myPageServiceImpl")
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	SqlSession sqlSession;
	
	


	@Override
	public ArrayList<BasketListVo> selectBasketList(int midx) {
		
		MyPageService_Mapper mpsm = sqlSession.getMapper(com.polyplay.pp.persistence.MyPageService_Mapper.class);
		ArrayList<BasketListVo> alist = mpsm.selectBasketList(midx);
		
		return alist;
	}
	
	
	@Override
	public ArrayList<WishListVo> selectMyWishList(int midx) {

		MyPageService_Mapper mpsm = sqlSession.getMapper(com.polyplay.pp.persistence.MyPageService_Mapper.class);
		ArrayList<WishListVo> alist = mpsm.selectMyWishList(midx);
		
		
		return alist;
	}
	
	
	
	@Transactional
	@Override
	public int fromBaToWish(int midx, int cidx) {
		
		MyPageService_Mapper mpsm = sqlSession.getMapper(com.polyplay.pp.persistence.MyPageService_Mapper.class);
		int result1 = mpsm.deleteBasket(midx, cidx);
		System.out.println("deleteBasket : "+result1);
		
		int result2 = mpsm.selectWishListCheck(midx, cidx);
		System.out.println("selectWishListCheck : "+result2);
		
		if(result2 == 0) {
			
			int result3 = mpsm.insertWishList(midx, cidx);
			System.out.println("insertWishList : "+result3);
			
		}else {
			
			System.out.println("이미 찜목록에 있는 상품입니다.");
			
		}

		
		
		
		
		return result1;
	}

	@Override
	public int deleteBasket(int midx, int cidx) {

		MyPageService_Mapper mpsm = sqlSession.getMapper(com.polyplay.pp.persistence.MyPageService_Mapper.class);
		int result = mpsm.deleteBasket(midx, cidx);
		
		System.out.println("deleteBasket결과값: "+result);
		
		return result;
	}
	
	
	
	@Override
	public int insertWishList(int midx, int cidx) {
		
		MyPageService_Mapper mpsm = sqlSession.getMapper(com.polyplay.pp.persistence.MyPageService_Mapper.class);
		int result = mpsm.insertWishList(midx, cidx);
		
		System.out.println("insertWishList결과값: "+result);
		
		return result;
	}


	@Override
	public int insertBasket(BasketListVo blv) {

		MyPageService_Mapper mpsm = sqlSession.getMapper(com.polyplay.pp.persistence.MyPageService_Mapper.class);
		int result = mpsm.insertBasket(blv);
		
		System.out.println("insertBasket결과값: "+result);
		
		return result;
	}

	
	

	@Override
	public ArrayList<OrderPayVo> selectMyContents(int midx) {

		MyPageService_Mapper mpsm = sqlSession.getMapper(com.polyplay.pp.persistence.MyPageService_Mapper.class);
		ArrayList<OrderPayVo> alist = mpsm.selectMyContents(midx);
		
		System.out.println("selectMyContents결과값: "+alist);
		
		return alist;
	}

	
	

	@Override
	public ArrayList<OrderPayVo> selectMyOrder(int midx) {


		MyPageService_Mapper mpsm = sqlSession.getMapper(com.polyplay.pp.persistence.MyPageService_Mapper.class);
		ArrayList<OrderPayVo> alist = mpsm.selectMyOrder(midx);
		
		System.out.println("selectMyOrder결과값: "+alist);
		
		return alist;
	}

	
	
	
	
	
	
	
	




}
