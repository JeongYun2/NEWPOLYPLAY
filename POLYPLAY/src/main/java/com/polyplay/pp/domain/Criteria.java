package com.polyplay.pp.domain;

public class Criteria { //쿼리를 사용하기위해 필요한만큼 뽑아내기 위한 클래스 
	
	private int page; //게시물 확인용 페이지. 현재 페이지. 눌렀을때 이동할 페이지
	private int perPageNum; //한 페이지에 게시물을 몇개보여줄것인가? 
	

	//생성자를 통해 page와 perPageNum 지정
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}


	public int getPage() {
		return page;
	}

	//1이면 1페이지로 고정
	public void setPage(int page) {
		if(page <=1){
			this.page = 1;
			return;
		}
		this.page = page;
	}

	//한 페이지당 보여지는 페이지 개수
	public int getPerPageNum() {
		return perPageNum;
	}

	//특이사항 PerPageNum을 0이나 100으로 했을경우 10으로 처리하겠다
	public void setPerPageNum(int perPageNum) {
		if(perPageNum <=0 || perPageNum > 100){ 		
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	
	//페이지의 게시물 시작번호
	public int  getPageStart(){
		return(this.page-1)*perPageNum+1;
	}
	//예를들어 2페이지를 눌렀을경우 (2-1)*15+1 ->16번부터 시작
	
	

	//페이지의 게시물 끝번호
	public int  getPageEnd(){
		return (this.page-1)*perPageNum + perPageNum;
	}
	//예를들어 2페이지를 눌렀을경우 (2-1)*15+15 ->30번까지 출력
	
	
	
	
	//Object클래스에 있는 String의 메소드를 오버라이딩한것. 페이지값 찍어보기위해서 설정함
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}




}