package com.polyplay.pp.service;

import java.util.ArrayList;

import com.polyplay.pp.domain.ReviewVo;
import com.polyplay.pp.domain.WishListVo;

public interface ReviewService {

	public ReviewVo selectMyReview(int midx, int cidx); 
	
	public ArrayList<ReviewVo> selectReviewList(int cidx);
	
	public int deleteMyReview(ReviewVo rv);
	
	
	public int updateLikePlus(int ridx);
	
	public int updateLikeMinus(int ridx);
	
	
	
	public int insertReview(ReviewVo rv);
	
}
