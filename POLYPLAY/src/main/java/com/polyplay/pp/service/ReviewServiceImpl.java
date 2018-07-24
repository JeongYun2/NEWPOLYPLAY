package com.polyplay.pp.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.polyplay.pp.domain.ReviewVo;
import com.polyplay.pp.persistence.ReviewService_Mapper;

@Service("ReviewServiceImpl")
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ReviewVo selectMyReview(int midx, int cidx) {
		
		ReviewService_Mapper rsm = sqlSession.getMapper(ReviewService_Mapper.class);
		ReviewVo rv = rsm.selectMyReview(midx, cidx);
		
		return rv;
	}

	@Override
	public ArrayList<ReviewVo> selectReviewList(int cidx) {
		
		ReviewService_Mapper rsm = sqlSession.getMapper(ReviewService_Mapper.class);
		ArrayList<ReviewVo> alist = rsm.selectReviewList(cidx);
		
		System.out.println("selectReviewList결과값: "+alist);
		
		return alist;
	}

	@Override
	public int deleteMyReview(ReviewVo rv) {
		
		ReviewService_Mapper rsm = sqlSession.getMapper(ReviewService_Mapper.class);
		int result = rsm.deleteMyReview(rv);
		
		return result;
	}

	@Override
	public int updateLikePlus(int ridx) {
		
		ReviewService_Mapper rsm = sqlSession.getMapper(ReviewService_Mapper.class);
		int result = rsm.updateLikePlus(ridx);
		
		System.out.println("updateLikePlus결과값: "+result);
		
		return result;
	}

	@Override
	public int updateLikeMinus(int ridx) {
		
		ReviewService_Mapper rsm = sqlSession.getMapper(ReviewService_Mapper.class);
		int result = rsm.updateLikeMinus(ridx);
		
		
		System.out.println("updateLikeMinus결과값: "+result);
		
		return result;
	}

	@Override
	public int insertReview(ReviewVo rv) {

		ReviewService_Mapper rsm = sqlSession.getMapper(ReviewService_Mapper.class);
		int result = rsm.insertReview(rv);
		
		return result;
	}

}
