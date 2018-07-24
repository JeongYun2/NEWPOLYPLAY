package com.polyplay.pp.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.polyplay.pp.domain.BasketListVo;
import com.polyplay.pp.domain.OrderPayVo;
import com.polyplay.pp.service.OrderService;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService os;
	
	
	
	
	@RequestMapping(value="/JustOrderPay")
	public String justOrderPayController(@RequestParam("cidx")int cidx, @RequestParam("midx")int midx,
			@RequestParam("cPrice")int cPrice, Model model) {
		
		System.out.println("justOrderPayController들어옴");
		
		System.out.println("addToWishListController들어옴");
		System.out.println("cidx: "+cidx);
		System.out.println("cPrice: "+cPrice);
		
		OrderPayVo opv = new OrderPayVo();
		
		opv.setCidx(cidx);
		opv.setoPrice(cPrice);
		
		opv.setMidx(midx);
		
		InetAddress local = null;
		try {
			local = InetAddress.getLocalHost();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		String oIp = local.getHostAddress();   
		opv.setoIp(oIp);
		
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		String orderDate = sdf.format(dt);
		String orderDateRe = orderDate.replaceAll("/", "");
		
		//랜덤함수
		Random random = new Random();
		int randomInt = random.nextInt();
		
		String randomString = Integer.toString(randomInt);
		String randomStringRe = randomString.replaceAll("-", "");
		
		String randomOid = orderDateRe+ "-" + randomStringRe;
		System.out.println("randomOid: "+randomOid);
		opv.setOid(randomOid);

		
		os.insertJustOrder(opv);
		
		//인서트된 오더정보를 order페이지에 뿌려주기위해 셀렉트
		ArrayList<OrderPayVo> olist = os.selectOrder(randomOid);
		model.addAttribute("orderList", olist);
		
		
		return "views/order/order";
	}
	
	
	
	
	
	@RequestMapping(value="/OrderPay")
	public String orderPayController(@RequestParam("midx")int midx,
			HttpServletRequest request, Model model) {
		
//		@RequestParam("cidx")int cidx, @RequestParam("baPrice")int baPrice
		
		OrderPayVo opv = new OrderPayVo();
		
	    String[] cidx = request.getParameterValues("cidx");
		
	    String h="";
		
		System.out.println("orderPayController들어옴");
		//System.out.println("opv에서 cidx"+opv.getCidx());
		
		System.out.println("리퀘스트파람 cidx 담은개수: "+cidx.length);
		for(int i=0; i<cidx.length;i++) {
			System.out.println(cidx[i]);
			
			h = h +","+ cidx[i];		
			
//			if(i<cidx.length) {
//				h = h +","+cidx[i];	
//			}
//			else if(i==cidx.length) {
//				h = h + cidx[i];
//			}
			
		}
		System.out.println(h);				
			String	hh = h.replaceFirst(",", "");		
		System.out.println(hh);
		opv.setH(hh);
		
		
		
/*		String[] oPrice = request.getParameterValues("baPrice");
		
		String p="";
		
		for(int i=0; i<oPrice.length;i++) {
			System.out.println(oPrice[i]);
			
//			h = h + cidx[i]+",";			
			
			if(i<oPrice.length) {
				p = p + oPrice[i]+",";	
			}
			else if(i==oPrice.length) {
				p = p + oPrice[i];
			}
			
		}
		System.out.println(p);
		opv.setP(p);*/
		
		
		System.out.println("cidx: "+cidx);
//		System.out.println("baPrice: "+baPrice);
//		opv.setoPrice(baPrice);
		
		//ip가져오는클래스
		InetAddress local = null;
		try {
			local = InetAddress.getLocalHost();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		String oIp = local.getHostAddress();   
		
		opv.setoIp(oIp);
		
		
		opv.setMidx(midx);
		
		
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		String orderDate = sdf.format(dt);
		String orderDateRe = orderDate.replaceAll("/", "");
		
		//랜덤함수
		Random random = new Random();
		int randomInt = random.nextInt();
		
		String randomString = Integer.toString(randomInt);
		String randomStringRe = randomString.replaceAll("-", "");
		
		String randomOid = orderDateRe+ "-" + randomStringRe;
		System.out.println("randomOid: "+randomOid);
		opv.setOid(randomOid);

		
		//장바구니에 선택한 상품을 order테이블에 인서트
		os.insertOrder(opv);
		
		//인서트된 오더정보를 order페이지에 뿌려주기위해 셀렉트
		ArrayList<OrderPayVo> olist = os.selectOrder(randomOid);
		model.addAttribute("orderList", olist);
		
	
		
		
		return "views/order/order";
	}
	
	
	
	
	@RequestMapping(value="/OrderPayAction") //결제하기를 눌렀을때
	public String orderPayActionController(@RequestParam("midx")int midx,
			@RequestParam("pMethod")String pMethod, @RequestParam("pDepositor")String pDepositor,
			@RequestParam("pPrice")int pPrice, @RequestParam("oid")String oid, Model model) {
		
		
		System.out.println("pMethod: "+pMethod);
		System.out.println("pDepositor: "+pDepositor);
		System.out.println("pPrice: "+pPrice);
		System.out.println("oid: "+oid);
		
		OrderPayVo opv = new OrderPayVo();
		opv.setMidx(midx);
		opv.setpMethod(pMethod);
		opv.setpPrice(pPrice);
		opv.setpDepositor(pDepositor);
		opv.setOid(oid);
		
		
		int result = os.insertPay(opv);
		System.out.println("pay컨트롤러 insert결과: "+result);
		
		//model.addAttribute("oid", oid);
		
		//System.out.println("썸네일 받아져있나? : "+opv.getcImage());
		
		
		// 전체 셀렉트
		ArrayList<OrderPayVo> reopv = os.selectCheckOrder(opv);
		
		model.addAttribute("orderCompleteList", reopv);
		
		
		
		return "views/order/orderComplete";
	}
	
	
	
	
	
	
	
	


}
