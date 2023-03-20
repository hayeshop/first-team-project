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
import kr.co.mall.vo.FaqVo;
import kr.co.mall.vo.GongjiVo;
import kr.co.mall.vo.MemberVo;

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
	public String adminproduct(HttpSession session,Model model,HttpServletRequest request)
	{
		return service.adminproduct(session,model,request);
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
	
	// 회원 파트
	@RequestMapping("/admin/adminmember")
	public String adminmember(Model model,HttpSession session)
	{
		return service.adminmember(model,session);
	}
	
	// 고객센터 파트
	@RequestMapping("/admin/admincustom")
	public String admincustom(HttpSession session,Model model)
	{
		return service.admincustom(session,model);
	}
	
	@RequestMapping("/admin/faq_input")
	public String faq_input(HttpSession session,FaqVo fvo)
	{
		return service.faq_input(session,fvo);
	}
	
	@RequestMapping("/admin/gongji_input")
	public String gongji_input(HttpSession session,GongjiVo gvo)
	{
		return service.gongji_input(session,gvo);
	}
	
	@RequestMapping("/admin/gong_del")
	public String gong_del(HttpSession session,GongjiVo gvo)
	{
		return service.gong_del(session,gvo);
	}
	
	@RequestMapping("/admin/gongji_update")
	public String gongji_update(HttpSession session,GongjiVo gvo)
	{
		return service.gongji_update(session,gvo);
	}
	
	@RequestMapping("/admin/faq_update")
	public String faq_update(HttpSession session,FaqVo fvo)
	{
		return service.faq_update(session,fvo);
	}
	
	@RequestMapping("/admin/faq_del")
	public String faq_del(HttpSession session,FaqVo fvo)
	{
		return service.faq_del(session, fvo);
	}
	
	@RequestMapping("/admin/mtm_update")
	public String mtm_update(HttpSession session,HttpServletRequest request)
	{
		return service.mtm_update(session,request);
	}
	

	@RequestMapping("/main/main")
	public String main(Model model)
	{
		return service.main(model);
	}
	
}
