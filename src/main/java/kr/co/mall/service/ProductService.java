package kr.co.mall.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface ProductService {

	public String pro_home(Model model, HttpServletRequest request);

	public String pcontent(Model model, HttpServletRequest request, HttpSession session);

	public void wish_add(HttpServletRequest request, HttpSession session, PrintWriter out);

	public void cart_add(HttpServletRequest request, HttpSession session, PrintWriter out);

}
