package com.polyplay.pp.controller;

import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.polyplay.pp.domain.MemberVo;
import com.polyplay.pp.service.MemberService;

@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired(required=false)
	MemberService ms;
	
	

	@RequestMapping(value="/MemberLogin")
	public String memberLoginController() {
		
		logger.info("/MemberLogin로 들어 왔습니다.");
		
		return "/views/member/memberLogin";
	}
	
	@RequestMapping(value="/MemberLoginAction", method= RequestMethod.POST)
	public String memberLoginActionController(MemberVo mvo, Model model, HttpSession session,
			@RequestParam(name="useCookie",required=false) String useCookie ) {
		
		logger.info("/MemberLoginAction로 들어 왔습니다.");
		logger.info("회원님의 아이디: "+mvo.getmId()+", 비밀번호: "+mvo.getmPassword()+", useCookie: "+useCookie);
		
		// 이동할 페이지
		String page = null;
		
		MemberVo mv = ms.selectLogin(mvo);
		logger.info("mvo값은 "+mv+"mvo .midx"+mv.getMidx());
		
		if(mv != null){			// 로그인 성공
			
			model.addAttribute("sMemberId", mv.getmId());
			model.addAttribute("sMemberMidx",mv.getMidx());
			model.addAttribute("sMemberName", mv.getmName());
			System.out.println("mv.getmName()의 갑은? : "+mv.getmName());
			
			System.out.println("useCookie: "+useCookie);
			
			if (useCookie != null) {		// 자동 로그인 체크
				
				Calendar cal = Calendar.getInstance();
			    cal.setTime(new Date());
			    cal.add(Calendar.DATE, 14);
			    DateFormat df = new SimpleDateFormat("yy-MM-dd");   
			    String sessionLimit = df.format(cal.getTime());
			    
			    mv.setmSessionId(session.getId());
			    mv.setmSessionLimit(sessionLimit);
			    int updateAuto_res = ms.updateAutoLogin(mv);
			    
			    System.out.println("자동로그인 체크 DB확인:"+updateAuto_res);
			}
		}
			
		if(mv != null) {
			page = "redirect:/MainList";
			
		}else {					// 로그인 실패
			page = "redirect:/MemberLogin";
		}
		
		return page;
	}
	
	@RequestMapping(value="/MemberLogout")
	public String memberLogoutController(HttpServletRequest request,HttpServletResponse response, HttpSession session) {	
		
		delSession(request, response, session);
		
		return "redirect:/MainList";
	}
	
	//서버상의 세션을 제거, 쿠키 유효기간을 0, DB에 세션정보를 지운다.
	public void delSession(HttpServletRequest request,HttpServletResponse response, HttpSession session){
		
		
		int sMemberMidx = (Integer)session.getAttribute("sMemberMidx");
		
		MemberVo mvo = new MemberVo();
		mvo.setMidx(sMemberMidx);
		mvo.setmSessionId("");
		mvo.setmSessionLimit("");
		ms.updateAutoLogin(mvo);
		
		
//		로그인을 하지 않았으면 메인 페이지로 보낸다.
		session.removeAttribute("sMemberMidx");
		session.removeAttribute("sMemberId");
		session.removeAttribute("sMemberName");
		session.invalidate();
		
		// 쿠키 존재 여부
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie"); 
		if (loginCookie != null) {
			 loginCookie.setPath("/");		
			 loginCookie.setMaxAge(0);				 
			 response.addCookie(loginCookie);			
		}
	}
	
	@RequestMapping(value="/MemberJoin")
	public String memberJoinController() {
		
		logger.info("/MemberJoin로 들어 왔습니다.");
		
		return "/views/member/memberJoin";
	}
	
	@RequestMapping(value="/MemberIdCheck", method=RequestMethod.POST)
	public @ResponseBody int memberIdCheckController(@RequestBody String userID) {
		
		logger.info("/MemberIdCheck/"+userID+"로 들어 왔습니다.");
		int cnt = ms.selectIdCheck(userID);
		System.out.println("로우 넘"+cnt);
		
		return cnt;
	}
	
	@RequestMapping(value="/MemberNickCheck", method=RequestMethod.POST)
	public @ResponseBody int memberNickCheckController(@RequestBody String userNick) {
		
		logger.info("/MemberNickCheck/"+userNick+"로 들어 왔습니다.");
		int cnt = ms.selectNicknameCheck(userNick);
		System.out.println("로우 넘"+cnt);
		
		return cnt;
	}
	
	@RequestMapping(value="/MemberJoinAction", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String memberJoinActionController(MemberVo mvo,
			HttpServletRequest request) throws UnsupportedEncodingException {
        
		// 사용자 아이피를 가져온다.
		String userIP = request.getRemoteAddr();
		mvo.setmIp(userIP);
		
		logger.info("/MemberJoinAction로 들어 왔습니다.");
		logger.info("회원님의 아이디: "+mvo.getmId()
						+", 비밀번호: "+mvo.getmPassword()
						+", 이메일: "+mvo.getmEmail()
						+", 전화번호: "+mvo.getmPhone()
						+", 이름: "+mvo.getmName()
						+", 닉네임: "+mvo.getmNickname()
						+", 아이피: "+mvo.getmIp());
		
		
		int res = ms.insertMember(mvo);
		System.out.println("res: "+res);
		
		String page = null;
		
		if(res == 1){
			page = "redirect:/MainList";
		} else {
			page = "redirect:/MemberJoin";
		}
		
		return page;
	}
	
	
	@RequestMapping(value="/MemberIdFind")
	public String memberIdFindController() {
		
		return "/views/member/memberIdFind";
	}
	
	@RequestMapping(value="/MemberIdFindAction", method=RequestMethod.POST)
	public @ResponseBody String memberIdFindActionController(MemberVo mvo,HttpServletRequest request) {
		
		logger.info("이름: "+mvo.getmName()+", 이메일: "+mvo.getmEmail());
		String mId = ms.selectIdFind(mvo);
		
		return mId;
	}
	
	
	@RequestMapping(value="/MemberPwFind")
	public String memberPwFindController() {
		
		return "/views/member/memberPwFind";
	}
	
	@RequestMapping(value="/MemberPwFindAction", method=RequestMethod.POST)
	public @ResponseBody String memberPwFindActionController(MemberVo mvo, HttpSession session) {
		
		logger.info("아이디: "+mvo.getmId()+", 이메일: "+mvo.getmEmail()+", 전화번호"+mvo.getmPhone());
		String Pw = ms.selectPwFind(mvo);
		
		return Pw;
	}
	
	@RequestMapping(value="/MemberModify")
	public String memberModifyController(HttpSession session,Model model) {
		
		
		int sMemberMidx = (Integer) session.getAttribute("sMemberMidx");
		
		MemberVo mvo = ms.selectMyMember(sMemberMidx);
		model.addAttribute("mvo",mvo);
		logger.info("mvo 값: "+mvo);
		
		return "/views/member/memberModify";
	}
	
	@RequestMapping(value="/MemberModifyAction", method=RequestMethod.POST)
	public String memberModifyActionController(MemberVo mvo, HttpSession session) {
		
		System.out.println(mvo);
		System.out.println(mvo.getmId()+", "+mvo.getmNewPassword()+", ");
		System.out.println(session.getAttribute("sMemberMidx"));
		int sMemberMidx = (Integer)session.getAttribute("sMemberMidx");
		
		mvo.setMidx(sMemberMidx);
		
		logger.info("midx: "+mvo.getMidx()+", mPassword: "+mvo.getmPassword());
		
		String page = null;
		int res = ms.updateMember(mvo);
		
		if(res == 1) {
			page = "redirect:/MemberModify";
		} else {
			page ="redirect:/MainList";
		}
		
		return page;
	}
	
	@RequestMapping(value="/MemberDelete")
	public String memberDeleteController() {
		
		return "/views/member/memberDelete";
	}
	
	@RequestMapping(value="/MemberDeleteAction", method=RequestMethod.POST)
	public String memberDeleteActionController(MemberVo mvo,
			HttpServletRequest request,HttpServletResponse response, HttpSession session) {
		
		int sMemberMidx = (Integer) session.getAttribute("sMemberMidx");
		mvo.setMidx(sMemberMidx);
		
		logger.info("비밀번호: "+mvo.getmPassword()+", midx:"+mvo.getMidx());
		
		String page = null;
		
		delSession(request, response, session);
		
		int res = ms.deleteMember(mvo);
		logger.info("deleteMember: "+res);
		
		if(res == 1) {
			page = "redirect:/GoToHome";
		} else {
			page ="redirect:/MemberDelete";
		}
		
		return page;
	}
}
