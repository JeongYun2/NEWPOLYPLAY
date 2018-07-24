package com.polyplay.pp.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.polyplay.pp.domain.ReviewVo;
import com.polyplay.pp.service.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired 
	ReviewService rs;
	
	@RequestMapping(value="/ReviewList")
	public String reviewListController(@RequestParam("cidx") int cidx, Model model) {
		
		
		System.out.println("리뷰리스트컨트롤러cidx: "+cidx);
		
		//selectMyReview	
		//selectReviewList 
		
/*		ArrayList<ReviewVo> alist = null;
		alist = rs.selectReviewList();
		
		ReviewVo rv  = null;
		rv = rs.selectMyReview(6,8);
		
		model.addAttribute("rv", rv);
		model.addAttribute("alist", alist);	*/
		
		model.addAttribute("cidx", cidx);
		
		return "views/contents/contentsReview";
	}
	
	@RequestMapping(value = "/ReviewListAjax/{cidx}")
	public @ResponseBody ArrayList<ReviewVo> boardListAjaxController(@PathVariable("cidx") int cidx) {
	
		System.out.println("ReviewListAjax컨트롤러들어옴?");
		
		ArrayList<ReviewVo> alist = null;
		alist = rs.selectReviewList(cidx);
		
		System.out.println("alist: "+alist);
		
		return alist;

	}
	
	
	
	@RequestMapping(value="/ReviewDelete")
	public String reviewDeleteController(@ModelAttribute("rv") ReviewVo rv) {
		//deleteMyReview
		String page = "";
		
		int cc = rs.deleteMyReview(rv);
		 System.out.println("들어옵니다 :"+cc);
		if (cc == 1) {
			page = "/ReviewList";
		}else{
			page = "/index";
		}
		return page;
			
	
	}
	
	
	
	
	@RequestMapping(value="/ReviewLikePlus/{ridx}/{cidx}")
	public @ResponseBody int reviewLikePlusController(@PathVariable("ridx") int ridx,@PathVariable("cidx") int cidx) {

		System.out.println("reviewLikePlusController들어옴");
		
		int result = rs.updateLikePlus(ridx);
	
				
		return result;
	}
	
	@RequestMapping(value="/ReviewLikeMinus")
	public String reviewLikeMinusController() {
		
		
		//updateLikeMinus	
		
		return "";
	}
	
			
	
	
	
	
	
	
	
	@RequestMapping(value="/ReviewWrite")
	public String reviewWriteController(@RequestParam("cidx") int cidx, Model model, HttpSession session) {
		
		System.out.println("reviewWriteController들어옴");
		
		int midx = (Integer)session.getAttribute("sMemberMidx");
		
		model.addAttribute("midx", midx);
		model.addAttribute("cidx", cidx);
		
		System.out.println("ReviewWrite cidx: "+cidx);
		
		return "views/contents/contentsReviewWrite";
	}
	
	@RequestMapping(value="/ReviewWriteAction")
	public String reviewWriteActionController(@RequestParam("cidx") int cidx, @RequestParam("midx") int midx,
			@RequestParam("rPoint")int rPoint,@RequestParam("rContent")String rContent,
			@ModelAttribute("rv") ReviewVo rv, Model model) {
		
		System.out.println("reviewWriteActionController들어옴");
		System.out.println("cidx: "+cidx);
		System.out.println("rPoint: "+rPoint);
		System.out.println("rContent: "+rContent);
		
		rv.setMidx(midx);
		rv.setCidx(cidx);
		rv.setrPoint(rPoint);
		rv.setrContent(rContent);
		
		InetAddress local = null;
		try {
			local = InetAddress.getLocalHost();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		String rIp = local.getHostAddress();   
		rv.setrIp(rIp);
		
		
		rs.insertReview(rv);
		
		model.addAttribute("cidx", cidx);
	
		
		return "redirect:/ReviewList";
	}

}