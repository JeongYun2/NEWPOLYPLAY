package com.polyplay.pp.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.polyplay.pp.domain.BoardVo;
import com.polyplay.pp.domain.MemberVo;
import com.polyplay.pp.service.BoardService;
import com.polyplay.pp.service.BoardServiceImpl;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	 @Autowired
	   BoardServiceImpl bsi;
	 @Autowired
	   BoardService bs;
	 
	 
	@RequestMapping(value="/BoardNoticeList")
	   public String boardNoticeListController(Model model) {
		ArrayList<BoardVo> alist =  bsi.selectNoticeList();		
		model.addAttribute("alist", alist);	
	
	      //selectNoticeList 
	      
	      return "views/board/boardNoticeList";
	   }
	

	@RequestMapping(value="/BoardNoticeContent")
	public String BoardNoticeContentController(
			@RequestParam("bidx") int bidx, Model model){


		BoardVo bvo = bsi.selectNoticeContent(bidx);		
		model.addAttribute("bvo", bvo);
	
		return "views/board/boardNoticeContent";
	}
	
	
	@RequestMapping(value="/BoardFAQUserList")
	   public String boardFAQUserListController(Model model) {
		ArrayList<BoardVo> alist =  bsi.selectFAQUserList();		
		model.addAttribute("alist", alist);	
	      //selectFAQList 
	      return "views/board/boardFAQUserList";
	   }
	@RequestMapping(value="/BoardFAQPlayerList")
	   public String boardFAQPlayerListController(Model model) {
		ArrayList<BoardVo> alist =  bsi.selectFAQPlayerList();		
		model.addAttribute("alist", alist);	
	      //selectFAQList 
	      return "views/board/boardFAQPlayerList";
	   }
	@RequestMapping(value="/BoardFAQPayList")
	   public String boardFAQPayListController(Model model) {
		ArrayList<BoardVo> alist =  bsi.selectFAQPayList();		
		model.addAttribute("alist", alist);	
	      //selectFAQList 
	      return "views/board/boardFAQPayList";
	   }
	@RequestMapping(value="/BoardFAQEtcList")
	   public String boardFAQEtcListController(Model model) {
		ArrayList<BoardVo> alist =  bsi.selectFAQEtcList();		
		model.addAttribute("alist", alist);	
	      //selectFAQList 
	      return "views/board/boardFAQEtcList";
	   }
	
	@RequestMapping(value="/BoardFAQContent")
	public String BoardFAQContentController(
			@RequestParam("bidx") int bidx, Model model){
		

		BoardVo bvo = bsi.selectFAQContent(bidx);		
		model.addAttribute("bvo", bvo);
	
		return "views/board/boardFAQContent";
	}
	
	@RequestMapping(value="/BoardInquiryList")
	   public String boardInquiryListController(Model model) {
		ArrayList<BoardVo> alist =  bsi.selectInquiryList();		
		model.addAttribute("alist", alist);	
	      //selectInquiryList 
	      
	      return "views/board/boardInquiryList";
	   }
	
	@RequestMapping(value="/BoardInquiryWrite")
	   public String boardInquiryWriteController() {
	      
	      //
	      
	      return "views/board/boardInquiryWrite";
	   }
	
	@RequestMapping(value="/BoardInquiryWriteAction")
	public String boardInquiryWriteActionController(HttpServletRequest request,
			@RequestParam("bSubcate") String bSubcate,
			@RequestParam("bWriter") String bWriter,
			@RequestParam("bSubject") String bSubject,
			@RequestParam("bContent") String bContent,
			
			@RequestParam("bPassword") String bPassword
			) throws UnknownHostException {
				
		System.out.println("들어옴");
		System.out.println("컨트롤러에서 서브카테"+bSubcate);
		InetAddress local = InetAddress.getLocalHost();		
		String bIp = local.getHostAddress();		
		
	
		
		int res = bsi.insertInquiry(bSubcate, bWriter,bSubject, bContent,bIp,bPassword);
		
		
		return "redirect:/BoardInquiryList";
	}
	
	@RequestMapping(value="/BoardInquiryContentPassword")
	public String boardInquiryContentPasswordController(
			@RequestParam("bidx") int bidx,Model model) {
	      System.out.println("비아이디엑스가 있니이"+bidx);
	      //
	      BoardVo bvo=null;
	      bvo=bs.selectInquiryContent(bidx);
	      model.addAttribute("bvo",bvo);
	      return "views/board/boardInquiryContentPassword";
	   }
	
	
	
	@RequestMapping(value="/BoardInquiryContent")
	public String boardInquiryContentController(
			@RequestParam("bidx") int bidx,Model model) {
	      System.out.println("비아이디엑스가 있니이"+bidx);
	      //
	      BoardVo bvo=null;
	      bvo=bsi.selectInquiryContent(bidx);
	      model.addAttribute("bvo",bvo);
	      return "views/board/boardInquiryContent";
	   }

	
	
	@RequestMapping(value="/BoardInquiryCheckContent")
	public String BoardInquiryCheckContentController(
			@ModelAttribute("bvo") BoardVo bvo, 
			@RequestParam("bidx") int bidx,HttpSession session,
			@RequestParam("bPassword") String bPassword){
			
		System.out.println("인큐어리컨텐츠들어왓니");
		
		int bvv= 0;		
		String url="";
		
		
		System.out.println("넘어온비밀번호: "+bPassword);
		bvo.setBidx(bidx);	
		int result= bs.bPasswordCheck(bidx, bPassword);
		
		System.out.println("패스워드체크결과값"+result);
		System.out.println("인큐어리컨텐츠들어왓니2?"+bidx);
		System.out.println("인큐어리컨텐츠들어왓니3?"+bPassword);
		System.out.println("인큐어리컨텐츠들어왓니100?"+bvo);
		
		if(result==1){
			url= "redirect:/BoardInquiryContent?bidx="+bidx;
			
		}else{		
			url= "redirect:/BoardInquiryList";
		}
		
		return url;
	}
	
	

	
	@RequestMapping(value="/BoardInquiryContentDelete")
	public String BoardInquiryContentDelete(HttpServletRequest request,
			
			@RequestParam("bidx") int bidx ,Model model) throws UnknownHostException {
		
		
			
		InetAddress local = InetAddress.getLocalHost();							
		String bIp=local.getHostAddress();	
		
		
		int res = bsi.deleteInquiry(bIp, bidx);
				
		return "redirect:/BoardInquiryList";
	}
	
	@RequestMapping(value="/BoardInquiryModify")
	public String BoardInquiryModifyController(@RequestParam("bidx") int bidx, Model model){

		BoardVo bvo= null;
		bvo= bsi.selectInquiryContent(bidx);
		model.addAttribute("bvo",bvo);
	
		return "views/board/boardInquiryModify";
	}
	
	@RequestMapping(value="/BoardInquiryModifyAction")
	public String boardInquiryModifyActionController(HttpServletRequest request,
			
			@RequestParam("bSubcate") String bSubcate,
			@RequestParam("bSubject") String bSubject,
			@RequestParam("bContent") String bContent,
			@RequestParam("bidx") int bidx, Model model) throws UnknownHostException {		
			
		InetAddress local = InetAddress.getLocalHost();		
		String bIp  = local.getHostAddress();			
			
		
	
		int res = bsi.updateInquiry(bSubcate,bSubject, bContent, bIp, bidx);			
			
		
		return "redirect:/BoardInquiryContent?bidx="+bidx;
		
	}
	
	
}