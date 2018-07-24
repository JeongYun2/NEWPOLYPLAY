package com.polyplay.pp.persistence;

import java.util.ArrayList;

import com.polyplay.pp.domain.ReviewVo;

public interface ReviewService_Mapper {

	public ReviewVo selectMyReview(int midx, int cidx);
	
	public ArrayList<ReviewVo> selectReviewList(int cidx);
	
	public int deleteMyReview(ReviewVo rv);
	
	
	
	public int updateLikePlus(int ridx);
	
	public int updateLikeMinus(int ridx);
	
	
	
	
	public int insertReview(ReviewVo rv); 
	
	
}
