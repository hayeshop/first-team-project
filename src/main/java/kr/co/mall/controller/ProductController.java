package kr.co.mall.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mall.service.ProductService;
import kr.co.mall.vo.BaesongVo;
import kr.co.mall.vo.OrderVo;

@Controller
public class ProductController {

	@Autowired
	@Qualifier("ps")
	private ProductService service;
	
	@RequestMapping("/product/pro_home")
	public String pro_home(Model model,HttpServletRequest request)
	{
		return service.pro_home(model,request);
	}
	
	@RequestMapping("/product/pcontent")
	public String pcontent(Model model,HttpServletRequest request, HttpSession session,HttpServletResponse response)
	{
		return service.pcontent(model,request,session,response);
	}
	
	@RequestMapping("/product/wish_add")
	public void wish_add(HttpServletRequest request,HttpSession session, PrintWriter out)
	{
		service.wish_add(request,session,out);
	}
	
	@RequestMapping("/product/cart_add")
	public void cart_add(HttpServletRequest request,HttpSession session,PrintWriter out)
	{
		service.cart_add(request,session,out);
	}
	
	@RequestMapping("/product/order")
	public String order(HttpServletRequest request,HttpSession session,Model model)
	{
		return service.order(request,session,model);
	}
	
	@RequestMapping("/product/bae_view")
	public String bae_view(HttpSession session,Model model)
	{
		return service.bae_view(session,model);
	}
	
	@RequestMapping("/product/bae_add")
	public String bae_add()
	{
		return service.bae_add();
	}
	
	@RequestMapping("/product/bae_add_ok")
	public String bae_add_ok(BaesongVo bvo,HttpSession session)
	{
		return service.bae_add_ok(bvo,session);
	}
	
	@RequestMapping("/product/bae_up")
	public String bae_up(HttpServletRequest request,Model model)
	{
		return service.bae_up(request,model);
	}
	
	@RequestMapping("/product/bae_up_ok")
	public String bae_up_ok(BaesongVo bvo,HttpSession session)
	{
		return service.bae_up_ok(bvo,session);
	}
	
	@RequestMapping("/product/bae_del")
	public String bae_del(HttpServletRequest request,HttpSession session)
	{
		return service.bae_del(request,session);
	}
	
	@RequestMapping("/product/bae_cla")
	public String bae_cla(HttpServletRequest request,Model model)
	{
		return service.bae_cla(request,model);
	}
	
	@RequestMapping("/product/chg_ok")
	public void chg_ok(HttpServletRequest request,PrintWriter out)
	{
		service.chg_ok(request,out);
	}
	
	@RequestMapping("/product/order_ok")
	public String order_ok(HttpSession session,OrderVo ovo)
	{
		return service.order_ok(session,ovo);
	}
	
	@RequestMapping("/product/order_view")
	public String order_view()
	{
		return "/product/order_view";
	}
	
}
