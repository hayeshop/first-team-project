package kr.co.mall.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mall.service.MypageService;

@Controller
public class MypageController {

	@Autowired
	@Qualifier("ms")
	private MypageService service;
	
	@RequestMapping("/mypage/mypage")
	public String mypage(HttpSession session,Model model)
	{
		return service.mypage(session,model);
	}
	
	@RequestMapping("/mypage/mtm_view")
	public String mtm_view(HttpSession session,Model model)
	{
		return service.mtm_view(session,model);
	}
	
	@RequestMapping("/mypage/cart")
	public String cart(HttpSession session,Model model)
	{
		return service.cart(session,model);
	}
	
	@RequestMapping("/mypage/cart_su")
	public void cart_su(HttpServletRequest request,HttpSession session,PrintWriter out)
	{
		service.cart_su(request,session,out);
	}
	
	@RequestMapping("/mypage/cart_del")
	public String cart_del(HttpServletRequest request)
	{
		return service.cart_del(request);
	}
	
	@RequestMapping("/mypage/wish")
	public String wish(HttpSession session,Model model)
	{
		return service.wish(session,model);
	}
	
	@RequestMapping("/mypage/wish_del")
	public String wish_del(HttpServletRequest request)
	{
		return service.wish_del(request);
	}
	
	@RequestMapping("/mypage/cart_add")
	public String cart_add(HttpServletRequest request,HttpSession session)
	{
		return service.cart_add(request,session);
	}
}
