package com.polyplay.pp.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.polyplay.pp.domain.BasketListVo;
import com.polyplay.pp.domain.ContentsVo;
import com.polyplay.pp.domain.OrderPayVo;
import com.polyplay.pp.domain.WishListVo;
import com.polyplay.pp.service.MyPageService;
import com.polyplay.pp.service.MyPageServiceImpl;

@Controller
public class MyPageController {
	
//	@Resource(name="myPageServiceImpl")
//	private MyPageService mps;
	
	@Autowired
	private MyPageService mps;
	
	


	
	//@ModelAttribute("cv") ContentsVo cv //@RequestParam("midx")int midx,
	@RequestMapping(value="/AddToWishList")
	public String addToWishListController(@RequestParam("cidx")int cidx,
			@RequestParam("cSubject")String cSubject, @RequestParam("cPrice")int cPrice) { 
		
		System.out.println("addToWishListController들어옴");
		System.out.println("cidx: "+cidx);
		System.out.println("cSubject: "+cSubject);
		System.out.println("cPrice: "+cPrice);
		
		mps.insertWishList(1, cidx);
		

		//addToWishList
		
		return "redirect:/MyWishList";
	}
	
	
	@RequestMapping(value="/AddToBasket")
	public String addToBasketController(@RequestParam("cidx")int cidx,
			@RequestParam("cSubject")String cSubject, @RequestParam("cPrice")int cPrice) {
		
		//addToBasket
		System.out.println("addToBasketController들어옴");
		
		BasketListVo blv = new BasketListVo();
		
		blv.setCidx(cidx);
		
		System.out.println(" 배스킷 cidx: "+cidx);
		
		blv.setcPrice(cPrice);
		blv.setcSubject(cSubject);
		blv.setMidx(1);
		
		mps.insertBasket(blv);
		
		return "redirect:/MyBasketList";
	}
	
	
	
	@RequestMapping(value="/MyBasketList")
	public String myBasketListController(Model model, HttpSession session) { //@RequestParam("midx") int midx,
		
		System.out.println("myBasketListController들어옴");
		
		int midx = (Integer)session.getAttribute("sMemberMidx");
		
		ArrayList<BasketListVo> alist = null;
		
//		alist = mps.selectBasketList(1);
		alist = mps.selectBasketList(midx);
		
		model.addAttribute("basketList", alist);
		
		System.out.println("메소드실행하고 장바구니리스트뿌리기");
		
		return "views/mypage/myBasket";
	}
	
	@RequestMapping(value="/MyBasketDelete")
	public String myBasketDeleteController(@RequestParam("midx")int midx, @RequestParam("cidx")int cidx,
			Model model) {
		
		System.out.println("myBasketDeleteController들어옴");
		
		//deleteBasket
		mps.deleteBasket(midx, cidx);
		
		model.addAttribute("midx", midx);
		
		return "redirect:/MyBasketList";
	}
	
	@RequestMapping(value="/MyWishList")
	public String myWishListController( Model model, HttpSession session) { //@RequestParam("midx") int midx,
		
		//System.out.println("위시midx: "+midx);
		int midx = (Integer)session.getAttribute("sMemberMidx");
		
		ArrayList<WishListVo> alist = null;
		

		alist = mps.selectMyWishList(midx);
		
		model.addAttribute("wishList", alist);
		

		
		return "views/mypage/myWishList";
	}
	
	
	@RequestMapping(value="/FromBaToWish")
	public String fromBaToWishController(
			@RequestParam("midx")int midx, @RequestParam("cidx")int cidx,
			Model model) { //

		System.out.println("fromBaToWishController들어옴");
		System.out.println("midx: "+midx);
		System.out.println("cidx: "+cidx);
		
		int result = mps.fromBaToWish(midx, cidx);
		
		System.out.println("fromBaToWish의 result: "+result);
		
/*		ArrayList<WishListVo> alist = null;
		
		alist = mps.selectMyWishList(midx);
		
		model.addAttribute("wishList", alist);*/
		
		return "redirect:/MyWishList";
	}
	


	
	
	
	
	@RequestMapping(value="/MyContentsList")
	public String myContentsController(Model model, HttpSession session) {
		
		System.out.println("myContentsController들어옴");
		//selectMyContents
		
		int midx = (Integer)session.getAttribute("sMemberMidx");
		
		ArrayList<OrderPayVo> alist = null;
		
		alist = mps.selectMyContents(midx);

		
		model.addAttribute("myContentsList", alist);
		
		return "views/mypage/myContents";
	}	
	
	
	
	
	
	
	@RequestMapping(value="/MyOrderList")
	public String myOrderController(Model model, HttpSession session) {
		
		System.out.println("myOrderController들어옴");
		
		int midx = (Integer)session.getAttribute("sMemberMidx");
		
		ArrayList<OrderPayVo> alist = null;
		

		alist = mps.selectMyOrder(midx);
		
		model.addAttribute("myOrderList", alist);
		
		
		return "views/mypage/myOrder";
	}
	
	
	
	
	
	
	
	

	
	

}
