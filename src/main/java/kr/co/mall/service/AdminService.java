package kr.co.mall.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.mall.vo.AdminVo;
import kr.co.mall.vo.FaqVo;
import kr.co.mall.vo.GongjiVo;
import kr.co.mall.vo.MemberVo;

public interface AdminService {

	public String adminmain(HttpSession session);

	public String adminlogin_ok(AdminVo avo, HttpSession session);

	public String adminproduct(HttpSession session, Model model, HttpServletRequest request);

	public void getCat2(HttpServletRequest request, PrintWriter out);

	public void getCat3(HttpServletRequest request, PrintWriter out);

	public void getCode(HttpServletRequest request, PrintWriter out);

	public String product_input(HttpServletRequest request) throws IOException;

	public String adminmember(Model model, HttpSession session);

	public String admincustom(HttpSession session, Model model);

	public String faq_input(HttpSession session, FaqVo fvo);

	public String gongji_input(HttpSession session, GongjiVo gvo);

	public String gong_del(HttpSession session, GongjiVo gvo);
	
	public String gongji_update(HttpSession session, GongjiVo gvo);

	public String faq_update(HttpSession session, FaqVo fvo);

	public String faq_del(HttpSession session, FaqVo fvo);

	public String mtm_update(HttpSession session, HttpServletRequest request);

	public String main(Model model);

}
