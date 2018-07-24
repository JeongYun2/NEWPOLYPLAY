package com.polyplay.pp.domain;

public class AdReviewListVo { // 관리자 selectAdReview에서 쓰는 것. 

	private int midx;
	private int ridx;
	private int cidx;
	private String cSubject;
	private String mNickname;
	private int rPoint;
	private String rContent;
	private int rLike;
	private String rWriteday;
	private String rDel_yn;
	
	
	
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public int getRidx() {
		return ridx;
	}
	public void setRidx(int ridx) {
		this.ridx = ridx;
	}
	public int getCidx() {
		return cidx;
	}
	public void setCidx(int cidx) {
		this.cidx = cidx;
	}
	public String getcSubject() {
		return cSubject;
	}
	public void setcSubject(String cSubject) {
		this.cSubject = cSubject;
	}
	public String getmNickname() {
		return mNickname;
	}
	public void setmNickname(String mNickname) {
		this.mNickname = mNickname;
	}
	public int getrPoint() {
		return rPoint;
	}
	public void setrPoint(int rPoint) {
		this.rPoint = rPoint;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public int getrLike() {
		return rLike;
	}
	public void setrLike(int rLike) {
		this.rLike = rLike;
	}
	public String getrWriteday() {
		return rWriteday;
	}
	public void setrWriteday(String rWriteday) {
		this.rWriteday = rWriteday;
	}
	public String getrDel_yn() {
		return rDel_yn;
	}
	public void setrDel_yn(String rDel_yn) {
		this.rDel_yn = rDel_yn;
	}


	
}