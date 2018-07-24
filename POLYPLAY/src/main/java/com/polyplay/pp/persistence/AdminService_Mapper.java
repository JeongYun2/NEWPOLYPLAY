package com.polyplay.pp.persistence;

import java.util.ArrayList;
import com.polyplay.pp.domain.ContentsVo;
import com.polyplay.pp.domain.SearchCriteria;

public interface AdminService_Mapper {
	
	public ArrayList<ContentsVo> selectAdContents(SearchCriteria scri); 
	
	public ContentsVo selectAdContentsOne(int cidx);
	
	public int insertContents(ContentsVo cv);
	
	public int updateContents(ContentsVo cv);
	
	public int deleteContents(ContentsVo cv);
	
}
