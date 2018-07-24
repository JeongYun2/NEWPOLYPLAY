package com.polyplay.pp.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.polyplay.pp.domain.ContentsVo;
import com.polyplay.pp.domain.PageMaker;
import com.polyplay.pp.domain.SalesListVo;
import com.polyplay.pp.domain.StarPointListVo;
import com.polyplay.pp.service.MainService;

@Controller
public class MainController {
	
	@Autowired 
	MainService ms;
	
	@RequestMapping(value="/GoToHome")
	public String HomeController() {
		
		
		
		return "home";
	}
	
	
	
	@RequestMapping(value="/MainList")
	public String mainListController(Model model) {
		
		//selectRecentList
		//selectViewCntList
		//selectStarPointList
		//selectSalesList
//		PageMaker pageMaker = new PageMaker();
		
//		model.addAttribute("pageMaker", pageMaker);
		
//		System.out.println("메인pageMaker: "+pageMaker);
		
		
		ArrayList<ContentsVo> alist1 = null;
		alist1 = ms.selectRecentList(); 
		
		ArrayList<ContentsVo> alist2 = null;
		alist2 = ms.selectViewCntList(); 
		
		ArrayList<StarPointListVo> alist3 = null;
		alist3 = ms.selectStarPointList();
		
		ArrayList<SalesListVo> alist4 = null;
		alist4 = ms.selectSalesList();
		
		model.addAttribute("alist1", alist1);
		model.addAttribute("alist2", alist2);
		model.addAttribute("alist3", alist3);
		model.addAttribute("alist4", alist4);
		
		return "/main";
	}



}
