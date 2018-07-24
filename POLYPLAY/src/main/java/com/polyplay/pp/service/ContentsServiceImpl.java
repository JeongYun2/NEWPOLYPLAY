package com.polyplay.pp.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.polyplay.pp.domain.ContentsVo;
import com.polyplay.pp.domain.SearchCriteria;
import com.polyplay.pp.persistence.ContentsService_Mapper;


@Service("ContentsServiceImpl")
public class ContentsServiceImpl  implements ContentsService{

	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public ArrayList<ContentsVo> selectGenreList(int gidx) {
		
		ContentsService_Mapper csm = sqlSession.getMapper(ContentsService_Mapper.class);
		ArrayList<ContentsVo> alist = csm.selectGenreList(gidx);
		return alist;
	}

	@Override
	public ArrayList<ContentsVo> selectSearchList(SearchCriteria scri) {
		
		System.out.println("impl에서 scri: "+scri);
		ContentsService_Mapper csm = sqlSession.getMapper(ContentsService_Mapper.class);
		ArrayList<ContentsVo> alist = csm.selectSearchList(scri);
		
		System.out.println("impl에서 selectSearchList: "+alist);
		
		return alist;
	}

	@Override
	public ContentsVo selectContentsInfo(int cidx){
		
		ContentsService_Mapper csm = sqlSession.getMapper(ContentsService_Mapper.class);
		ContentsVo cv = csm.selectContentsInfo(cidx);
		
		return cv;
	}

	@Override
	public ArrayList<ContentsVo> selectlSimilarList(int gidx) {
		
		ContentsService_Mapper csm = sqlSession.getMapper(ContentsService_Mapper.class);
		ArrayList<ContentsVo> alist = csm.selectlSimilarList(gidx);
		
		return alist;
	}
	@Transactional
	@Override
	public ContentsVo playVideo(int cidx) {
		
		ContentsService_Mapper csm = sqlSession.getMapper(ContentsService_Mapper.class);
		ContentsVo cv = csm.selectPreVideo(cidx);
		int result = csm.updateViewCnt(cidx);
		System.out.println("조회수 업데이트 됐니?: "+result);
		 
		
		return cv;
	}

	@Override
	public ContentsVo selectPreVideo(int cidx) {
		ContentsService_Mapper csm = sqlSession.getMapper(ContentsService_Mapper.class);
		ContentsVo cv = csm.selectPreVideo(cidx);
		return cv;
	}

}
