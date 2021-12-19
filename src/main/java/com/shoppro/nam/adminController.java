package com.shoppro.nam;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.support.HttpRequestHandlerServlet;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.shoppro.domain.itemVO;
import com.shoppro.service.adminService;


@Controller
public class adminController {

	
	@Autowired
	private adminService adminservice;
	
	private static final Logger logger = LoggerFactory.getLogger(adminController.class);
	
	
	@RequestMapping(value="/itemRegitPro",method=RequestMethod.POST)
	public String regitItem(MultipartHttpServletRequest request,Model model,itemVO itemvo) throws Exception{

		String orgFileName="";	//진짜 파일명
		String sysFileName="";	//변환된 파일명
		int fileLoop=0;			//파일 번호
		String filekinds="";	//파일 이미지 구분(대표사진,상세사진)
		String uploadFileName;	
		String itemimg="";		//db에 저장할 string
		String comma="";		//itemimg  ','로 구분하기 위한 변수
		MultipartFile mfile=null;
		// C:/image 폴더에 저장
		String rootUploadDir = "C:"+File.separator+"Users\\hanca\\Documents\\workspace-spring-tool-suite-4-4.12.0.RELEASE\\Shopping_M\\src\\main\\webapp\\resources\\image";
		File dir=new File(rootUploadDir+File.separator);
		if(!dir.exists()) {
			dir.mkdirs();
		}		
		Iterator<String> iterator=request.getFileNames();	//모든 파일 이름을 가져옴
		while(iterator.hasNext()) {
			fileLoop++;
			
			uploadFileName=iterator.next();	// file1
			if(uploadFileName.equals("itemimg_represent")) {
				filekinds="represent";
				comma=",";
			}
			else if(uploadFileName.equals("itemimg_detail3")) {
				filekinds="detail";
				comma="";
			}
			else {
				filekinds="detail";
				comma=",";
			}
			mfile=request.getFile(uploadFileName);
			orgFileName=mfile.getOriginalFilename();
			if(orgFileName!=null && orgFileName.length()!=0) {
				sysFileName=orgFileName;
				itemimg+=sysFileName+comma;
				try {
					mfile.transferTo(new File(dir+File.separator+sysFileName));
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		System.out.println("itemvo : "+itemvo.getItemmanual());
		System.out.println(itemimg);
		itemvo.setItemimg(itemimg);
		String msg="등록 완료.";
		String url="movingadminpage_registerItem";
		System.out.println(itemvo);
		int check=adminservice.itemRegit(itemvo);
		if(check!=1) {
			msg="등록 실패!";
		}
		model.addAttribute("itemname",itemvo.getItemname());
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "alert";
	}	
	@RequestMapping(value="/movingadminPage" ,method=RequestMethod.GET)
	public String movingadminPage() {
		return "admin/adminmain";
	}
	
	@RequestMapping(value="/movingadminpage_clientmanage",method=RequestMethod.GET)
	public String movingadminPage_clientmanage() {
		return "admin/cilentmanage";
	}
	
	@RequestMapping(value="/movingadminpage_registerItem",method=RequestMethod.GET)
	public String movingadminpage_registerItem() {
		return "admin/registeritem";
	}
	
	@RequestMapping(value="/movingadminpage_Itemlist",method=RequestMethod.GET)
	public String movingadminpage_Itemlist(HttpServletRequest request,Model model,Locale locale) throws Exception {
		List<itemVO> getitemlist=adminservice.itemList();
		model.addAttribute("getitemlist",getitemlist);
		return "admin/Itemlist";
	}
}
