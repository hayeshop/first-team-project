package kr.co.mall.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface MypageService {

	public String mypage(HttpSession session, Model model);

	public String mtm_view(HttpSession session, Model model);

	public String cart(HttpSession session, Model model);

	public void cart_su(HttpServletRequest request, HttpSession session, PrintWriter out);

	public String cart_del(HttpServletRequest request);

}
