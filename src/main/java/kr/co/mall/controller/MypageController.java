package kr.co.mall.controller;

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
}
