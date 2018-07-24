package com.polyplay.pp.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.polyplay.pp.domain.BoardVo;
import com.polyplay.pp.domain.MemberVo;
import com.polyplay.pp.persistence.BoardService_Mapper;
import com.polyplay.pp.persistence.MemberService_Mapper;


@Service("boardServiceImpl")
public class BoardServiceImpl implements BoardService{

		
		@Autowired
		SqlSession sqlSession;

		public ArrayList<BoardVo> selectNoticeList() {		
			
			ArrayList<BoardVo> alist = null;
			BoardService_Mapper bsm = sqlSession.getMapper(BoardService_Mapper.class);
			alist = bsm.selectNoticeList();			

			return alist;
		
	}

		@Override
		public BoardVo selectNoticeContent(int bidx) {
			BoardVo bvo = null;
			BoardService_Mapper bsm = sqlSession.getMapper(com.polyplay.pp.persistence.BoardService_Mapper.class);
			bvo =bsm.selectNoticeContent(bidx);

			return bvo;
		}
		
		@Override
		public ArrayList<BoardVo> selectFAQUserList() {

			ArrayList<BoardVo> alist = null;
			BoardService_Mapper bsm = sqlSession.getMapper(BoardService_Mapper.class);
			alist = bsm.selectFAQUserList();			

			return alist;
		}
		@Override
		public ArrayList<BoardVo> selectFAQPlayerList() {

			ArrayList<BoardVo> alist = null;
			BoardService_Mapper bsm = sqlSession.getMapper(BoardService_Mapper.class);
			alist = bsm.selectFAQPlayerList();			

			return alist;
		}
		@Override
		public ArrayList<BoardVo> selectFAQPayList() {

			ArrayList<BoardVo> alist = null;
			BoardService_Mapper bsm = sqlSession.getMapper(BoardService_Mapper.class);
			alist = bsm.selectFAQPayList();			

			return alist;
		}
		@Override
		public ArrayList<BoardVo> selectFAQEtcList() {

			ArrayList<BoardVo> alist = null;
			BoardService_Mapper bsm = sqlSession.getMapper(BoardService_Mapper.class);
			alist = bsm.selectFAQEtcList();			

			return alist;
		}
		@Override
		public BoardVo selectFAQContent(int bidx) {
			BoardVo bvo = null;
			BoardService_Mapper bsm = sqlSession.getMapper(com.polyplay.pp.persistence.BoardService_Mapper.class);
			bvo =bsm.selectFAQContent(bidx);

			return bvo;
		}

		
		
		
		@Override
		public ArrayList<BoardVo> selectInquiryList() {
			
			ArrayList<BoardVo> alist = null;
			BoardService_Mapper bsm = sqlSession.getMapper(BoardService_Mapper.class);
			alist = bsm.selectInquiryList();		
			
			return alist;
		}


		@Override
		public int insertInquiry(String bSubcate,String bWriter,String bSubject, String bContent,  String bIp, String bPassword){
			
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("bSubcate", bSubcate);
			System.out.print(bSubcate);
			map.put("bWriter", bWriter);
			map.put("bSubject", bSubject);
			map.put("bContent", bContent);
			map.put("bIp", bIp);
			
			map.put("bPassword", bPassword);
				
			
			BoardService_Mapper bsm = sqlSession.getMapper(com.polyplay.pp.persistence.BoardService_Mapper.class);
			int result = bsm.insertInquiry(map);	

			return result;
		}
	
		
		@Override
		public BoardVo selectInquiryContent(int bidx) {
			BoardVo bvo = null;
			BoardService_Mapper bsm = sqlSession.getMapper(com.polyplay.pp.persistence.BoardService_Mapper.class);
			bvo =bsm.selectInquiryContent(bidx);

			return bvo;
		}
		
		@Override
		public int deleteInquiry(String bIp, int bidx) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("bIp", bIp);
			map.put("bidx", bidx);
			
			BoardService_Mapper bsm = sqlSession.getMapper(com.polyplay.pp.persistence.BoardService_Mapper.class);
			int res = bsm.deleteInquiry(map);		
			
			return res;
		}
		
		
	
		@Override
		public int updateInquiry(String bSubcate,String bSubject, String bContent, String bIp, int bidx){
			
			HashMap<String,Object> map = new HashMap<String,Object>();
			
			map.put("bSubcate", bSubcate);
			map.put("bSubject", bSubject);
			map.put("bContent", bContent);			
			map.put("bIp", bIp);
			map.put("bidx", bidx);
			
			BoardService_Mapper bsm = sqlSession.getMapper(com.polyplay.pp.persistence.BoardService_Mapper.class);
			int result = bsm.updateInquiry(map);	
			
			return result;
			
		}
		
		@Override
		public int bPasswordCheck(int bidx, String bPassword) {
			HashMap<String,Object> map = new HashMap<String,Object>();
			
		
			map.put("bidx", bidx);
			map.put("bPassword", bPassword);
			
			BoardService_Mapper bsm = sqlSession.getMapper(BoardService_Mapper.class);
			int result = bsm.bPasswordCheck(map);			
		
			return result;
		}

}