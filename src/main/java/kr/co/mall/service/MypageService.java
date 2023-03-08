package kr.co.mall.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface MypageService {

	public String mypage(HttpSession session, Model model);

	public String mtm_view(HttpSession session, Model model);

}
