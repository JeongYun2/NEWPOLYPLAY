package com.polyplay.pp.domain;

import com.polyplay.pp.domain.Criteria;

public class SearchCriteria extends Criteria { //검색을 위해 필요한 변수 지정한 클래스. Criteria를 상속받음
	
	private String searchType;
	private String keyword;
	
	
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
	@Override
	public String toString() {
		
		return super.toString()+"SearchCriteria"+"[searchType="+searchType+", keyword="+keyword+"]";
	}

}