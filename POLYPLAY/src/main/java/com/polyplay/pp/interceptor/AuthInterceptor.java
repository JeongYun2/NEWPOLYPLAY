package com.polyplay.pp.interceptor;

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
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.polyplay.pp.domain.MemberVo;
import com.polyplay.pp.service.MemberService;



public class AuthInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	MemberService ms;
	
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object handler) throws Exception{
		
		logger.info("AuthInterceptor pre로 들어왔습니다.");
		HttpSession session = request.getSession();		
		
		
		if(session.getAttribute("sMemberMidx") == null){	// 로그인 안했을 때
			
			saveDest(request);
			Cookie loginCookie = WebUtils.getCookie(request,"loginCookie"); 
			
			if (loginCookie  != null){ 		// 쿠키 값이 존재할떄
				
				MemberVo mv =  ms.selectAutoLogin(loginCookie.getValue());
				
				if (mv != null) {			//쿠키 값에 유효 할때
				 
					request.getSession().setAttribute("sMemberId", mv.getmId());
					request.getSession().setAttribute("sMemberMidx", mv.getMidx());
					request.getSession().setAttribute("sMemberName", mv.getmName());
					
					Cookie loginCookie2 = new Cookie("loginCookie",loginCookie.getValue());
					loginCookie2.setPath("/");
					loginCookie2.setMaxAge(60*60*24*14);
					response.addCookie(loginCookie2);	
					
					Calendar cal = Calendar.getInstance();
					cal.setTime(new Date());
					cal.add(Calendar.DATE, 14);
					DateFormat df1 = new SimpleDateFormat("yy-MM-dd");   
					String sessionLimit = df1.format(cal.getTime());
					
					mv.setmSessionId(loginCookie.getValue());
					mv.setmSessionLimit(sessionLimit);	
					ms.updateAutoLogin(mv);
					
					System.out.println("mv");
					return true;
				}
				System.out.println("mv != null");
			}		
			System.out.println("/MemberLogin");
			response.sendRedirect(request.getContextPath()+"/MemberLogin");
			return false;
		}
		System.out.println("session.getAttribute('login') == null");
		return true;
		
	}
	
	private void saveDest(HttpServletRequest req){
		
		String uri = req.getRequestURI();		 
		String query = req.getQueryString();
		
		 
		if (query ==null || query.equals("null")){
			query = "";
		}else {
			query = "?" + query;
		}
		
//		method가 GET이면 url과 query를 합친다.
		if (req.getMethod().equals("GET")){
			 req.getSession().setAttribute("dest", uri+query);
			
		}		 
	 }	
	 

}

