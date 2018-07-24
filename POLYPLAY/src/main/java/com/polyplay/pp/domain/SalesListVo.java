package com.polyplay.pp.domain;

public class SalesListVo { //메인 selectSalesList에서 쓰는것
	
	private int cidx;
	private String cSubject;
	private String cRuntime;
	private String cOpenYear;
	private String cStory;
	private String cImage;
	private String cPreVideo;
	private String oid;
	private String pStatus;
	
	
	
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
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public String getpStatus() {
		return pStatus;
	}
	public void setpStatus(String pStatus) {
		this.pStatus = pStatus;
	}


}