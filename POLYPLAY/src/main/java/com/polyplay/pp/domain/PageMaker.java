package com.polyplay.pp.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker { //리스트 하단에 페이징표현을 위한 클래스
	
	
	private int totalCount; //총 게시물 개수
	private int startPage; 
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum = 10; //하단에 보여지는 페이지수
//	private Criteria cri; //가지고다니는애
	private SearchCriteria scri; //검색할때 쓰는애로 변경
	
	
	public SearchCriteria getScri() {
		return scri;
	}
	public void setScri(SearchCriteria scri) {
		this.scri = scri;
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	//왜 getPrev가 아니라 is? 불린타입은 값이 아니라 true false로 나타나니까 이미 정해져있는값을 꺼내는거라서
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	

	
	//메소드를 통해 4변수 구함 
	private void calcData() {
		
		//예를들어 게시물이 100개면  7페이지까지 있는것을 구하는것		 //Math.ceil:올림/ 반올림 round
		endPage = (int) (Math.ceil(scri.getPage()/
				(double)displayPageNum) * displayPageNum);
		
		// Math 클래스 안에 메소드가 public static final 로 올라와있어서 메모리 클래스 영역에 떠있으므로 객체생성안하고 바로 사용가능한것 Math.메소드
		// Math ma = new Math(); 객체생성한다면 ma.메소드 이렇게 호출....
		
		
		
		System.out.println("endPage: "+endPage);
		
		
		startPage = (endPage - displayPageNum)+1;
		
		System.out.println("startPage: "+startPage);
	
		
		int tempEndPage = (int) (Math.ceil(totalCount)/(double) scri.getPerPageNum());
		
		//마지막페이지
		if(endPage>tempEndPage) {
			endPage = tempEndPage+1;
		}	
		
		prev = startPage == 1 ? false : true;		
		// 자바의 이항연산식.. prev에 stratPage가 1이면 false, 1이 아니면 true 대입
		
		next = endPage * scri.getPerPageNum() >= totalCount ? false : true;
	}	
	
	
	//UriComponentsBuilder방식으로 page파라미터 넘기기위한 메소드 추가
	public String makeQuery(int page) {
		
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
//				.queryParam("perPageNum", cri.getPerPageNum()) 바꿀필요없어서...
				.build();
		
		return uriComponents.toUriString();
		
	}

	
	
	//페이지,서치타입,키워드를 가지고 다니기 위한 메소드 추가
	public String makeSearch(int page) {
		
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				//.queryParam("searchType", ((SearchCriteria) scri).getSearchType())
				.queryParam("searchType", scri.getSearchType())
				//  ((SearchCriteria) scri).getSearchType() 왜 이렇게 쓰는지 모르게쑴...
				//책에서는 그냥cri를 형변환해서 쓴거얌  부모타입이 자식타입으로 다운캐스팅한거임 키워드라는 변수가 서치안에 들어가져있으니까 가능한것
				
				//.queryParam("keyword", ((SearchCriteria) scri).getKeyword())
				.queryParam("keyword", scri.getKeyword())
				.build();
		
		return uriComponents.toUriString();
		
	}
	
	
	//키워드 글자 인코딩 메소드 추가
	private String encoding(String keyword) {
		
		if(keyword==null||keyword.trim().length()==0) {
			//키워드가 널이거나 트림(공백제거)하고 길이가 0인것은 리턴을 빈값으로주겠다
			return "";
		}
		try {
			return URLEncoder.encode(keyword, "UTF-8");
			//URLEncoder안에 있는 encode를 사용해서 키워드를 UTF-8로 입히겠다
		}catch(UnsupportedEncodingException e) {
			return "";
		}
	}

}