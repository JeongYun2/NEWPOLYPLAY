package com.polyplay.pp.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.polyplay.pp.domain.AdReviewListVo;
import com.polyplay.pp.domain.BoardVo;
import com.polyplay.pp.domain.ContentsVo;
import com.polyplay.pp.domain.MemberVo;
import com.polyplay.pp.domain.OrderPayVo;
import com.polyplay.pp.domain.ReviewVo;
import com.polyplay.pp.domain.SearchCriteria;
import com.polyplay.pp.persistence.AdminService_Mapper;


@Service("AdminServiceImpl")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<MemberVo> selectAdMember(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public ContentsVo selectAdContentsOne(int cidx) {
		
		AdminService_Mapper asm = sqlSession.getMapper(AdminService_Mapper.class);
		ContentsVo cv = asm.selectAdContentsOne(cidx);
		
		return cv;
	}
	
	@Override
	public int updateAuthMember(MemberVo mv) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<ContentsVo> selectAdContents(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertContents(ContentsVo cv) {
		
		
		
		AdminService_Mapper asm = sqlSession.getMapper(com.polyplay.pp.persistence.AdminService_Mapper.class);
		int result = asm.insertContents(cv);
		
		return result;
	}

	@Override
	public int updateContents(ContentsVo cv) {
		
		AdminService_Mapper asm = sqlSession.getMapper(com.polyplay.pp.persistence.AdminService_Mapper.class);
		int result = asm.updateContents(cv);
		
		return result;
	}

	@Override
	public int deleteContents(ContentsVo cv) {
		AdminService_Mapper asm = sqlSession.getMapper(com.polyplay.pp.persistence.AdminService_Mapper.class);
		int result = asm.deleteContents(cv);
		
		return result;
	}

	@Override
	public ArrayList<OrderPayVo> selectAdOrder(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<AdReviewListVo> selectAdReview(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteAdReview(ReviewVo rv) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<BoardVo> selectAdBoard(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardVo selectAdBoardContent() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteAdBoard(BoardVo bv) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertAdBoard(BoardVo bv) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int adReplyBoard(BoardVo bv) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateAdBoard(BoardVo bv) {
		// TODO Auto-generated method stub
		return 0;
	}

	

}
