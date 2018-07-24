package com.polyplay.pp.persistence;

import com.polyplay.pp.domain.SearchCriteria;

import java.util.ArrayList;

import com.polyplay.pp.domain.ContentsVo;

public interface ContentsService_Mapper {

	public ArrayList<ContentsVo> selectGenreList(int gidx);
	
	public ArrayList<ContentsVo> selectSearchList(SearchCriteria scri);
	
	public ArrayList<ContentsVo> selectlSimilarList(int gidx);
	
	public ContentsVo selectContentsInfo(int cidx); 
	
	public int updateViewCnt(int cidx);
	
	public ContentsVo selectPreVideo(int cidx);
	
	
	
	
	

	
}
