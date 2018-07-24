package com.polyplay.pp.domain;

public class StarPointListVo { //메인 selectStarPointList에서 쓰는 것. 

	private int cidx;
	private String cSubject;
	private String cRuntime;
	private String cOpenYear;
	private String cStory;
	private String cImage;
	private String cPreVideo;
	private int rPoint;

	
	
	
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
	public String getcRuntime() {
		return cRuntime;
	}
	public void setcRuntime(String cRuntime) {
		this.cRuntime = cRuntime;
	}
	public String getcOpenYear() {
		return cOpenYear;
	}
	public void setcOpenYear(String cOpenYear) {
		this.cOpenYear = cOpenYear;
	}
	public String getcStory() {
		return cStory;
	}
	public void setcStory(String cStory) {
		this.cStory = cStory;
	}
	public String getcImage() {
		return cImage;
	}
	public void setcImage(String cImage) {
		this.cImage = cImage;
	}
	public String getcPreVideo() {
		return cPreVideo;
	}
	public void setcPreVideo(String cPreVideo) {
		this.cPreVideo = cPreVideo;
	}
	public int getrPoint() {
		return rPoint;
	}
	public void setrPoint(int rPoint) {
		this.rPoint = rPoint;
	}

	
}