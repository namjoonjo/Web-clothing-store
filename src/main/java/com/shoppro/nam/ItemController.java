package com.shoppro.nam;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shoppro.domain.itemVO;
import com.shoppro.service.itemService;

@Controller
public class ItemController {

	private static final Logger logger = LoggerFactory.getLogger(ItemController.class);
	
	@Autowired
	private itemService itemservice;
	
	@RequestMapping(value="/itemDetail", method=RequestMethod.GET)
	public String itemDetail(@RequestParam("itemid") String itemid,Model model) throws Exception{
		DecimalFormat formatter=new DecimalFormat("###,###.##");
	
		itemVO itemDetails=itemservice.getitemDetails(Integer.parseInt(itemid));
		String [] itemimg=new String[4];
		String [] itemsize=new String[5];
		System.out.println(itemDetails.toString());
		System.out.println(itemDetails.getItemimg());
		System.out.println(formatter.format(Double.parseDouble(itemDetails.getPrice())));
		itemimg=itemDetails.getItemimg().split(",");
		itemsize=itemDetails.getItemsize().split("/");
		model.addAttribute("itemDetails",itemDetails);
		model.addAttribute("price",formatter.format(Double.parseDouble(itemDetails.getPrice())));
		for(int i=0;i<itemsize.length;i++) {
			model.addAttribute("itemsize"+String.valueOf(i+1),itemsize[i]);
		}
		for(int i=0;i<itemimg.length;i++) {
			model.addAttribute("itemimg"+String.valueOf(i+1),itemimg[i]);
		}
		return "main/itemDetail";
	}
	
	@RequestMapping(value="/paymentPro",method=RequestMethod.POST)
	@ResponseBody
	public String paymentPro(int itemid,String itemsize,String itemdiscount,String memid,String itemcount) {
		System.out.println("결제완료 : "+itemid+","+itemsize+","+itemdiscount+","+itemcount);
		return "success";
	}
	
	@RequestMapping(value="/tocartPro",method=RequestMethod.POST)
	@ResponseBody
	public String tocartPro(int itemid,String itemsize,String itemdiscount,String memid,String itemcount) {
		
		Date nowDate=new Date();
		SimpleDateFormat simpledateformat=new SimpleDateFormat("yyyy년 MM월 dd일");
		String strNowDate=simpledateformat.format(nowDate);
		System.out.println("장바구니 : "+ itemid+","+itemsize+","+itemdiscount+","+strNowDate+","+itemcount);
		
		return "success";
	}
	
	
	
}
