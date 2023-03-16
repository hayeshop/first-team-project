package kr.co.mall.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.mall.vo.BaesongVo;

public interface ProductService {

	public String pro_home(Model model, HttpServletRequest request);

	public String pcontent(Model model, HttpServletRequest request, HttpSession session, HttpServletResponse response);

	public void wish_add(HttpServletRequest request, HttpSession session, PrintWriter out);

	public void cart_add(HttpServletRequest request, HttpSession session, PrintWriter out);

	public String order(HttpServletRequest request, HttpSession session, Model model);

	public String bae_view(HttpSession session, Model model);

	public String bae_add();

	public String bae_add_ok(BaesongVo bvo, HttpSession session);

	public String bae_up(HttpServletRequest request, Model model);

	public String bae_up_ok(BaesongVo bvo, HttpSession session);

	public String bae_del(HttpServletRequest request, HttpSession session);

	public String bae_cla(HttpServletRequest request, Model model);

	public void chg_ok(HttpServletRequest request, PrintWriter out);

}
