package com.polyplay.pp.persistence;

import java.util.ArrayList;

import com.polyplay.pp.domain.ContentsVo;
import com.polyplay.pp.domain.SalesListVo;
import com.polyplay.pp.domain.StarPointListVo;

public interface MainService_Mapper {

	public ArrayList<ContentsVo> selectRecentList();
	
	public ArrayList<ContentsVo> selectViewCntList();
	
	public ArrayList<StarPointListVo> selectStarPointList();
	
	public ArrayList<SalesListVo> selectSalesList();
}
