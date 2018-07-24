package com.polyplay.pp.persistence;

import com.polyplay.pp.domain.MemberVo;

public interface MemberService_Mapper {

	// int mId, String mId, String mName, String mNickname
	public MemberVo selectLogin(MemberVo mvo);
	
	// String mSessionId 
	public MemberVo selectAutoLogin(String mSessionId);

	// String mSessionId, String mSessionLimit, int midx
	public int updateAutoLogin(MemberVo mvo);
	
	public int selectIdCheck(String mId);
	
	public int selectNicknameCheck(String mNickname);
	
	public int selectEmailCheck(String mEmail);
	
	// int midx, String mname, String mnickname, String mid, String mpassword, String memail, String mphone, String mip
	public int insertMember(MemberVo mvo);
	
	// String mName, String mEmail
	public String selectIdFind(MemberVo mvo);
	
	// int mId, String mEmail, String mPhone
	public String selectPwFind(MemberVo mvo);
	
	public MemberVo selectMyMember(int midx);
	
	// int midx, String mPassword
	public int selectPwConfirm(MemberVo mvo);
	
	// String mNickname, String mPassword, String mPhone, String mModifyday, int midx
	public int updateMember(MemberVo mvo);
	
	public int deleteMember(int midx);
}
