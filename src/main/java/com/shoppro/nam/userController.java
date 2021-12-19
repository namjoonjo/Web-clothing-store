package com.shoppro.nam;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shoppro.domain.itemVO;
import com.shoppro.domain.memberVO;
import com.shoppro.service.LoginService;
import com.shoppro.service.itemService;

@Controller
public class userController {

	private static final Logger logger = LoggerFactory.getLogger(userController.class);
	
	@Autowired
	private LoginService loginservice;
	
	@Autowired
	private itemService itemservice;
	
	@RequestMapping(value="/loginPro",method=RequestMethod.GET)
	public String loginProcess(memberVO memvo,Model model,HttpServletRequest request) throws Exception {
		HttpSession session=request.getSession();
		
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
		
		String msg="로그인 할 수 없습니다.";
		String url="/nam/";
		try {
			memberVO login=loginservice.loginServiceMethod(memvo);
			if(login==null) {	//로그인 하지 못할 경우
				session.setAttribute("login",null);
				model.addAttribute("msg",msg);
				model.addAttribute("url",url);
				return "justalert";
			}
			else {
				if(login.getMemid().equals("admin")) {	//관리자로 로그인 했을 경우
					System.out.println(login.getMemid());
					session.setAttribute("login", login);
					session.setMaxInactiveInterval(1800);
					model.addAttribute("login",login);
					return "admin/adminmain";
				}
				else {	//일반 사용자가 로그인 했을 경우
					System.out.println(login.getMemid());
					session.setAttribute("login", login);
					session.setMaxInactiveInterval(1800);
					model.addAttribute("login",login);
					model.addAttribute("roaldhk","from loginpro");
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
				}
			}
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
	
	@RequestMapping(value="/logoutPro",method=RequestMethod.GET)
	public String LogoutProcess(Model model,HttpSession session) {
		String url="/nam/";
		String msg="로그아웃 되었습니다.";
		session.invalidate();
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "justalert";
	}
	
	@RequestMapping(value="/signupPro",method=RequestMethod.POST)
	@ResponseBody
	public String signupPro(Model model,String memid,String password,String name,String email,String address,String phonenum1,String phonenum2,String phonenum3,String homepage) throws Exception{
		String url="/nam/";
		String msg="회원가입이 성공적으로 완료되었습니다.";
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);
		memberVO memvo=new memberVO();
		memvo.setMemid(memid);
		memvo.setName(name);
		memvo.setPassword(password);
		memvo.setAddress(address);
		memvo.setPhonenum(phonenum1+" - "+phonenum2+" - "+phonenum3);
		memvo.setEmail(email+"@"+homepage);			
		System.out.println(memvo);
		loginservice.signUpMethod(memvo);
		logger.info(memvo.toString());
		return "success";
	}
	
	@RequestMapping(value="/movingsignPage",method=RequestMethod.GET)
	public String movingSignPage() {
		return "signup";
	}
	
	
	@RequestMapping(value="/movingfindPage",method=RequestMethod.GET)
	public String movingfindPage() {
		return "main/findPSID";
	}
	
	@RequestMapping(value="/findID",method=RequestMethod.GET)
	public String findID(memberVO memvo,Model model) {
		
		String msg="아이디를 찾을 수 없습니다. 이름이나 이메일을 다시 확인해 주십시오.";
		String url="/nam/";
		try {
			memberVO findidvo=loginservice.findID(memvo);
			msg=memvo.getName()+"님의 아이디는 : < "+findidvo.getMemid()+" > 입니다.";
			System.out.println(msg);
		}catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "findIDPS_alert";
	}
	
	@RequestMapping(value="/findPS",method=RequestMethod.GET)
	public String findPS(memberVO memvo,Model model) {
		String msg="비밀번호를 찾을 수 없습니다.이름이나 아이디, 비밀번호를 다시 확인하여 주십시오.";
		String url="/nam/";
		try {
			memberVO findidvo=loginservice.findID(memvo);
			msg=memvo.getName()+"님의 비밀번호는 : < "+findidvo.getPassword()+" > 입니다.";
			System.out.println(msg);
		}catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "findIDPS_alert";
	}
	
	@RequestMapping(value="/isitoverlapping",method=RequestMethod.POST)
	@ResponseBody
	public String checkoverlappingID(Model model,String memid) throws Exception {
	
		logger.info("memberIdChk() 진입");
		logger.info(memid);
		int result=100;
		try {
			if(memid.equals("")) return "empty";	// 아이디가 입력되지 않았음
			result = loginservice.isitoverlapId(memid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result != 0) {
		return "fail";	// 중복 아이디가 존재
		} 
		else {
		return "success";	// 중복 아이디 없음, 성공.
		}	
	}
	
	@RequestMapping(value="/iscorrectpasswordform",method=RequestMethod.POST)
	@ResponseBody
	public String iscorrectPasswordForm(String password) {
		try {
			if(!(password.length()>=8)) return "long_enough";	//비밀번호가 8 이상이 아닌 경우
			if(!passwordProof(password)) return "condition_fail";	//비밀번호 조건에 부합하지 않을 경우
		}catch(Exception e) {
			e.printStackTrace();	
		}
		return "success";	//비밀번호 조건 부합,성공
	}
	
	public boolean passwordProof(String password) {
		boolean Special_word_result=false;	//특수문자가 쓰였으면 true, 아니면 false
		boolean word_uppercheck_result=false;	//대문자가 쓰였으면 true, 아니면 false
		String [] sp= {"!","@","#","$","%","^","&","*","~"};
		for(int i=0;i<sp.length;i++) {
			if(password.contains(sp[i])) {	//특수문자가 포함되어 있다면...
				Special_word_result=true;
				break;
			}
		}
		for(int i=0;i<password.length();i++) {
			if(Character.isUpperCase(password.charAt(i))) {
				word_uppercheck_result=true;
				break;
			}
		}
		return Special_word_result && word_uppercheck_result;
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
