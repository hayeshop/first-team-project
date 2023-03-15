package kr.co.mall.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mall.service.CommunityService;
import kr.co.mall.vo.CommunityVo;

@Controller

public class CommunityController {
	
	@Autowired
	@Qualifier("cs")
	private CommunityService service;
	
	@RequestMapping("/community/cmain")
	public String cmain()
	{
		return "/community/cmain";
	}
	
	@RequestMapping("/community/cwrite")
	public String write()
	{
		return "/community/cwrite";
	}
	
	@RequestMapping("/community/cwrite_ok")
	 public String write_ok(CommunityVo cvo)
	 {
		return service.cwrite_ok(cvo);
	 }
	
	@RequestMapping("/community/clist")
	public String clist(Model model,CommunityVo cvo)
	{
		return service.clist(model,cvo);
	}
	
	@RequestMapping("/community/ccontent")
	public String ccontent(Model model,HttpServletRequest request)
	{
		return service.ccontent(model,request);
	}
	
	@RequestMapping("/community/cdelete")
	public String cdelete(CommunityVo cvo, HttpSession session)
	{
		return service.cdelete(cvo, session);
	}
	
	@RequestMapping("/community/cupdate")
	public String cupdate(CommunityVo cvo, Model model)
	{
		return service.cupdate(cvo,model);
	}
	
	@RequestMapping("community/cupdate_ok")
	public String cupdate_ok(CommunityVo cvo)
	{
		return service.cupdate_ok(cvo);
	}
}