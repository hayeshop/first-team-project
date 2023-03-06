package kr.co.mall.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mall.service.CustomService;

@Controller
public class CustomController {

	@Autowired
	@Qualifier("cs")
	private CustomService service;
	
	@RequestMapping("/customer/custom")
	public String custom(Model model)
	{
		return service.custom(model);
	}
	
	@RequestMapping("/customer/gongji_content")
	public String gongji_content(Model model,HttpServletRequest request)
	{
		return service.gongji_content(model,request);
	}
}
