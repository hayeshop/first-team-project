package kr.co.mall.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.mall.vo.MtmVo;

public interface CustomService {

	public String custom(Model model);

	public String gongji_content(Model model, HttpServletRequest request);

	public String mtm_input(MtmVo mvo, HttpSession session);

	public String mtm(HttpSession session);

}
