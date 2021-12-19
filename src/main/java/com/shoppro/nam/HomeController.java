package com.shoppro.nam;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shoppro.domain.itemVO;
import com.shoppro.service.itemService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private itemService itemservice;
	@RequestMapping(value = "/", method = RequestMethod.GET)	
	public String home(Locale locale, Model model){	//로그인 전 main 컨트롤러
		
		List<itemVO> allofgetbestitems=null;
		List<itemVO> bestmantoman=null;
		List<itemVO> bestshirts=null;
		List<itemVO> bestpants=null;
		List<itemVO> bestouter=null;		
		List<itemVO> bestshoes=null;
		
		ArrayList<String> allgetbestimg=null;
		ArrayList<String> mantomanimg=null;
		ArrayList<String> shirtsimg=null;
		ArrayList<String> pantsimg=null;
		ArrayList<String> outerimg=null;
		ArrayList<String> shoesimg=null;

		try {
			allofgetbestitems=itemservice.allofgetbestitems();
			bestmantoman=itemservice.kindofgetbestitems("맨투맨");
			bestshirts=itemservice.kindofgetbestitems("셔츠");
			bestpants=itemservice.kindofgetbestitems("바지");
			bestouter=itemservice.kindofgetbestitems("아우터");
			bestshoes=itemservice.kindofgetbestitems("신발");
			
			allgetbestimg=getRepresentdata(allofgetbestitems);
			mantomanimg=getRepresentdata(bestmantoman);
			shirtsimg=getRepresentdata(bestshirts);
			pantsimg=getRepresentdata(bestpants);
			outerimg=getRepresentdata(bestouter);
			shoesimg=getRepresentdata(bestshoes);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		//객체전체의 정보를 보냄
		model.addAttribute("allofgetbestitems",allofgetbestitems);
		model.addAttribute("bestmantoman",bestmantoman);
		model.addAttribute("bestshirts",bestshirts);
		model.addAttribute("bestpants",bestpants);
		model.addAttribute("bestouter",bestouter);
		model.addAttribute("bestshoes",bestshoes);
		
		//대표사진만 보냄
		model.addAttribute("allgetbestimg",allgetbestimg);
		model.addAttribute("mantomanimg",mantomanimg);
		model.addAttribute("shirtsimg",shirtsimg);
		model.addAttribute("pantsimg",pantsimg);
		model.addAttribute("outerimg",outerimg);
		model.addAttribute("shoesimg",shoesimg);
		return "main/main";
		
	}
	
	public ArrayList<String> getRepresentdata(List<itemVO> items){
		ArrayList<String> rlist=new ArrayList<String>();
		String [] str=new String[4];
		for(int i=0;i<items.size();i++) {
			str=items.get(i).getItemimg().split(",");
			rlist.add(str[0]); System.out.println(str[0]);
			str=null;
		}
		return rlist;
	}
}
