package kr.co.mall.controller;

import java.io.IOException;

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
		return "redirect:/community/clist";
	}
	
	@RequestMapping("/community/cwrite")
	public String write()
	{
		return "/community/cwrite";
	}
	
	@RequestMapping("/community/cwrite_ok")
	 public String write_ok(HttpSession session, HttpServletRequest request, CommunityVo cvo) throws IOException
	 {
		return service.cwrite_ok(session, request, cvo);
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
}