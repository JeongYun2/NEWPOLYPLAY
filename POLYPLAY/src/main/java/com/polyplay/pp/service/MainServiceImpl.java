package com.polyplay.pp.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.polyplay.pp.domain.ContentsVo;
import com.polyplay.pp.domain.SalesListVo;
import com.polyplay.pp.domain.StarPointListVo;
import com.polyplay.pp.persistence.MainService_Mapper;


@Service("mainServiceImpl")
public class MainServiceImpl implements MainService {

	@Autowired
	private SqlSession sqlSession;

	
	@Override
	public ArrayList<ContentsVo> selectRecentList() {
		
		System.out.println("sqlSession연결됐냐? : "+sqlSession);
		
		MainService_Mapper csm = sqlSession.getMapper(MainService_Mapper.class);
		
		System.out.println("csm주소값: "+csm);
		ArrayList<ContentsVo> alist = csm.selectRecentList();
		
		System.out.println("selectRecentList의 alist: "+alist);
		return alist;
	}

	@Override
	public ArrayList<ContentsVo> selectViewCntList() {
		
		MainService_Mapper csm = sqlSession.getMapper(MainService_Mapper.class);
		ArrayList<ContentsVo> alist = csm.selectViewCntList();
		return alist;
	}

	@Override
	public ArrayList<StarPointListVo> selectStarPointList() {

		MainService_Mapper csm = sqlSession.getMapper(MainService_Mapper.class);
		ArrayList<StarPointListVo> alist = csm.selectStarPointList();
		return alist;
	}

	@Override
	public ArrayList<SalesListVo> selectSalesList() {
		
		MainService_Mapper csm = sqlSession.getMapper(MainService_Mapper.class);
		ArrayList<SalesListVo> alist = csm.selectSalesList();
		return alist;
	}

}
