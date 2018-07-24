package com.polyplay.pp.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.polyplay.pp.domain.ContentsVo;
import com.polyplay.pp.domain.PageMaker;
import com.polyplay.pp.domain.SearchCriteria;
import com.polyplay.pp.service.ContentsService;
import com.polyplay.pp.service.ContentsServiceImpl;

@Controller
public class ContentsController {

	@Autowired
	ContentsService cs;
	
	@RequestMapping(value="/ContentsList")
	public String contentsListController(@RequestParam("gidx") int gidx,Model model) {
		//selectGenreList
		//selectSearchList
		
		ArrayList<ContentsVo> alist = null;
				
		alist = cs.selectGenreList(gidx);
		
		model.addAttribute("alist", alist);
		
		
		
		return "views/contents/contentsList";
	}
	
	
	@RequestMapping(value="/ContentsSearchList")
	public String contentsSearchListController(SearchCriteria scri, Model model) {
		
		System.out.println("contentsSearchListController들어옴");
		System.out.println("scri: "+scri);
		
		ArrayList<ContentsVo> alist = null;
		
		alist = cs.selectSearchList(scri);
		System.out.println("selectSearchList: "+alist);
		
		
		PageMaker pageMaker = new PageMaker();
		
		model.addAttribute("searchList", alist);
		model.addAttribute("pageMaker", pageMaker);
		
		System.out.println("pageMaker: "+pageMaker);
		
		return "/views/contents/contentsSearchList";
	}
	
	
	
	@RequestMapping(value="/ContentsInfo")
	public String contentsInfoController(@RequestParam("cidx") int cidx,Model model) {
		//selectContentsInfo
		
		System.out.println("cidx :"+cidx);
		
		ContentsVo cv = null;
		cv = cs.selectContentsInfo(cidx);
		
		System.out.println("cv :"+cv);
		
		
		model.addAttribute("cv", cv);
		
		
		
		
		return "views/contents/contentsInfo";
	}
	

	
	/*@RequestMapping(value="/ContentsSimilar")
	public String contentsSimilarController(@RequestParam("gidx") int gidx,Model model) {
		
		//selectSimilarList
		ArrayList<ContentsVo> alist = null;
		
		alist = cs.selectlSimilarList(gidx);
		
		model.addAttribute("alist", alist);
		
		
		
		return "views/contents/contentsSimilar";
	}*/
	
	@RequestMapping(value="/ContentsPlay")
	public String contentsPlayController(@RequestParam("cidx") int cidx,Model model) {
		//playVideo
		
		ContentsVo cv = cs.playVideo(cidx);
		model.addAttribute("cv", cv);
		return "/views/contents/contentsPlay";
	}
	
}