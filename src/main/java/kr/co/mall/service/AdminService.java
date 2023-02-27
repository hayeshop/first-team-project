package kr.co.mall.service;

import javax.servlet.http.HttpSession;

import kr.co.mall.vo.AdminVo;

public interface AdminService {

	public String adminmain(HttpSession session);

	public String adminlogin_ok(AdminVo avo, HttpSession session);

}
