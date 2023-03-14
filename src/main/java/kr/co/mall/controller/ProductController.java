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
}
