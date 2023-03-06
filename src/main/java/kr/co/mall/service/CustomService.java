package kr.co.mall.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface CustomService {

	public String custom(Model model);

	public String gongji_content(Model model, HttpServletRequest request);

}
