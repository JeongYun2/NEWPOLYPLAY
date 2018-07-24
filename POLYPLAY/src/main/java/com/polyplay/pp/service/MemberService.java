package com.polyplay.pp.service;

import com.polyplay.pp.domain.MemberVo;

public interface MemberService {

	public MemberVo selectLogin(MemberVo mvo);
	
	public MemberVo selectAutoLogin(String mSessionid);
	
	public int updateAutoLogin(MemberVo mvo);
	
	public int selectIdCheck(String mId);
	
	public int selectNicknameCheck(String mNickname);
	
	public int selectEmailCheck(String mEmail);
	
	public int insertMember(MemberVo mvo);
	
	public String selectIdFind(MemberVo mvo);
	
	public String selectPwFind(MemberVo mvo);
	
	public MemberVo selectMyMember(int midx);
	
	public int updateMember(MemberVo mvo);
	
	public int deleteMember(MemberVo mvo);
}
