package com.polyplay.pp.service;

import java.util.ArrayList;

import com.polyplay.pp.domain.ContentsVo;
import com.polyplay.pp.domain.GenreVo;
import com.polyplay.pp.domain.SearchCriteria;
import com.polyplay.pp.domain.WishListVo;


public interface ContentsService {

	public ArrayList<ContentsVo> selectGenreList(int gidx); 
	
	public ArrayList<ContentsVo> selectSearchList(SearchCriteria scri); 
	
	public ContentsVo selectContentsInfo(int cidx); 
	
	public ArrayList<ContentsVo> selectlSimilarList(int gidx);
	
	public ContentsVo playVideo(int cidx);
	
	public ContentsVo selectPreVideo(int cidx);
}
