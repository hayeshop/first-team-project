package kr.co.mall.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mall.service.AdminService;
import kr.co.mall.vo.AdminVo;

@Controller
public class AdminController {

	@Autowired
	@Qualifier("as")
	private AdminService service;

	@RequestMapping("/admin/adminmain")
	public String adminmain(HttpSession session)
	{
		return service.adminmain(session);
	}
	
	@RequestMapping("/admin/adminlogin")
	public String adminlogin()
	{
		return "/admin/adminlogin";
	}
	
	@RequestMapping("/admin/adminlogin_ok")
	public String adminlogin_ok(AdminVo avo,HttpSession session)
	{
		return service.adminlogin_ok(avo,session);
	}
	
	// 상품 파트
	@RequestMapping("/admin/adminproduct")
	public String adminproduct(HttpSession session,Model model)
	{
		return service.adminproduct(session,model);
	}
	@RequestMapping("/admin/getCat2")
	public void getCat2(HttpServletRequest request,PrintWriter out)
	{
		service.getCat2(request,out);
	}
	@RequestMapping("/admin/getCat3")
	public void getCat3(HttpServletRequest request,PrintWriter out)
	{
		service.getCat3(request,out);
	}
	@RequestMapping("/admin/getCode")
	public void getCode(HttpServletRequest request,PrintWriter out)
	{
		service.getCode(request,out);
	}
	@RequestMapping("/admin/product_input")
	public String product_input(HttpServletRequest request) throws IOException
	{
		return service.product_input(request);
	}
}