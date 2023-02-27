package kr.co.mall.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.mall.mapper.AdminMapper;
import kr.co.mall.vo.AdminVo;

@Service
@Qualifier("as")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper mapper;

	@Override
	public String adminmain(HttpSession session) {
		if(session.getAttribute("userid")==null)
			return "/admin/adminlogin";
		if(session.getAttribute("userid").equals("admin"))
		{
			
			return "/admin/adminmain";
		}
		else
		{
			return "redirect:/main/main";
		}
	}

	@Override
	public String adminlogin_ok(AdminVo avo,HttpSession session) {
		AdminVo avo2=mapper.adminlogin(avo);
		if(avo2==null)
		{
			return "redirect:/main/main";			
		}
		else
		{
			session.setAttribute("userid", avo2.getUserid());
			return "redirect:/admin/adminmain";
		}
	}
}
