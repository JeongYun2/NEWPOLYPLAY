package com.polyplay.pp.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.polyplay.pp.domain.BoardVo;
import com.polyplay.pp.domain.MemberVo;



public interface BoardService {

	
	public ArrayList<BoardVo> selectNoticeList(); 
	
	public BoardVo selectNoticeContent(int bidx);
	
	
	
	public ArrayList<BoardVo> selectFAQUserList(); 
	public ArrayList<BoardVo> selectFAQPlayerList(); 
	public ArrayList<BoardVo> selectFAQPayList(); 
	public ArrayList<BoardVo> selectFAQEtcList(); 
	
	public BoardVo selectFAQContent(int bidx);
	
	
	
	public ArrayList<BoardVo> selectInquiryList();
	
	public BoardVo selectInquiryContent(int bidx);
	
	public int insertInquiry(String bSubcate,String bWriter,String bSubject, String bContent,  String bIp, String bPassword);
	
	public int updateInquiry(String bSubcate,String bSubject, String bContent, String bIp, int bidx);
	
	public int deleteInquiry(String bIp, int bidx);
	
	public int bPasswordCheck(int bidx, String bPassword);
	
}