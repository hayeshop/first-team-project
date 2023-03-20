package kr.co.mall.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.mall.vo.MemberVo;
import kr.co.mall.vo.OrderVo;

public interface MypageService {

	public String mypage(HttpSession session, Model model);

	public String mtm_view(HttpSession session, Model model);

	public String cart(HttpSession session, Model model);

	public void cart_su(HttpServletRequest request, HttpSession session, PrintWriter out);

	public String cart_del(HttpServletRequest request);

	public String wish(HttpSession session, Model model);

	public String wish_del(HttpServletRequest request);

	public String cart_add(HttpServletRequest request, HttpSession session);

	public String mem_up(HttpSession session, Model model);

	public String pwd_up(HttpSession session);

	public String pwd_up_ok(HttpSession session, HttpServletRequest request);

	public String mem_up_ok(HttpSession session, MemberVo mvo);

	public String order_list(OrderVo ovo, Model model, HttpSession session);

}
