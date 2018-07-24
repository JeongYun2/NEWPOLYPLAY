package com.polyplay.pp.interceptor;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.polyplay.pp.domain.MemberVo;
import com.polyplay.pp.service.MemberService;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	// 세션  유효기한
	private static int expir_date = 14;
	
	@Autowired(required=false)
	MemberService ms;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, 
			ModelAndView modelAndView) throws Exception{
		
		logger.info("LoginInterceptorPost에 들어옴");
		
		HttpSession session = request.getSession();
		
		Object sMemberId = modelAndView.getModel().get("sMemberId");
		Object sMemberMidx = modelAndView.getModel().get("sMemberMidx");
		Object sMemberName = modelAndView.getModel().get("sMemberName");
		
			
		if(sMemberMidx != null){		// 로그인 안했을 경우
			
			// 세션에 midx값을 login라는 이름으로 저장한다.
			session.setAttribute("sMemberId", sMemberId);
			session.setAttribute("sMemberMidx", sMemberMidx);
			session.setAttribute("sMemberName", sMemberName);
			
			System.out.println(request.getParameter("useCookie"));
			
			if (request.getParameter("useCookie") == "on") {
				
				Cookie loginCookie = new Cookie("loginCookie",request.getSession().getId());
				System.out.println(loginCookie);
				loginCookie.setPath("/");
				// 7동안 세션쿠키를 저장한다.
				loginCookie.setMaxAge(60*60*24*expir_date);
				// 세션쿠키를 반환한다.
				response.addCookie(loginCookie);	
			}
		}
	}
	
//	완료
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		logger.info("LoginInterceptorPre에 들어옴");
		
		HttpSession session = request.getSession();
		
		
		if(session.getAttribute("sMemberMidx") != null){
			
			int midx = (Integer) session.getAttribute("sMemberMidx");
			System.out.println(midx);
			
			MemberVo mvo = new MemberVo();
			mvo.setMidx(midx);
			mvo.setmSessionId("");
			mvo.setmSessionLimit("");
			ms.updateAutoLogin(mvo);
			
			session.removeAttribute("sMemberId");
			session.removeAttribute("sMemberMidx");
			session.removeAttribute("sMemberName");
		}
		
		return true;
	}
	
}
