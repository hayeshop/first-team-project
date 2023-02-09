package kr.co.mall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mall.service.MemberService;
import kr.co.mall.vo.MemberVo;

@Controller
public class MemberController {

	@Autowired
	@Qualifier("ms")
	private MemberService service;
	
	@RequestMapping("/member/member_input")
	public String member_input()
	{
		return "/member/member_input";
	}
	
	@RequestMapping("/member/member_input_ok")
	public String member_input_ok(MemberVo mvo)
	{
		return service.member_input_ok(mvo);
	}
}
