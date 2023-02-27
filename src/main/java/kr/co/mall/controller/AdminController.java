package kr.co.mall.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
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
}
