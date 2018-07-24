package com.polyplay.pp.persistence;

import java.util.ArrayList;
import java.util.HashMap;

import com.polyplay.pp.domain.BoardVo;
import com.polyplay.pp.domain.MemberVo;

public interface BoardService_Mapper {
	
		public ArrayList<BoardVo> selectNoticeList();
		
		public BoardVo selectNoticeContent(int bidx);
		
		public ArrayList<BoardVo> selectFAQUserList(); 
		public ArrayList<BoardVo> selectFAQPlayerList(); 
		public ArrayList<BoardVo> selectFAQPayList(); 
		public ArrayList<BoardVo> selectFAQEtcList(); 
		
		public BoardVo selectFAQContent(int bidx);
		
		public ArrayList<BoardVo> selectInquiryList();
		
		public BoardVo selectInquiryContent(int bidx);
		
		public int insertInquiry(HashMap<String,Object> map);
		
		public int updateInquiry(HashMap<String,Object> map);

		public int deleteInquiry(HashMap<String,Object> map);
		
		public int bPasswordCheck(HashMap<String,Object> map);
}