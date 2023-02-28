package kr.co.mall.service;

import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.mall.mapper.AdminMapper;
import kr.co.mall.vo.AdminVo;
import kr.co.mall.vo.Cat2Vo;
import kr.co.mall.vo.Cat3Vo;

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

	@Override
	public String adminproduct(HttpSession session, Model model) {
		if(session.getAttribute("userid")==null)
			return "/admin/adminlogin";
		if(session.getAttribute("userid").equals("admin"))
		{
			// category테이블 읽어오기, view에 전달
			model.addAttribute("category",mapper.getCat());
			return "/admin/adminproduct";
		}
		else
		{
			return "redirect:/main/main";
		}
	}

	@Override
	public void getCat2(HttpServletRequest request, PrintWriter out) {
		String catcode=request.getParameter("catcode");
		ArrayList<Cat2Vo> cat2=mapper.getCat2(catcode);
		
		String str="<option value='' disabled selected>"+URLEncoder.encode("카테고리2")+"</option>";
		for(int i=0;i<cat2.size();i++)
		{
			str=str+"<option value='"+cat2.get(i).getCode()+"'>"+URLEncoder.encode(cat2.get(i).getName())+"</option>";
		}
		out.print(str);
	}

	@Override
	public void getCat3(HttpServletRequest request, PrintWriter out) {
		String catncat2=request.getParameter("catncat2");
		ArrayList<Cat3Vo> cat3=mapper.getCat3(catncat2);
		
		String str="<option value='' disabled selected>"+URLEncoder.encode("카테고리3")+"</option>";
		for(int i=0;i<cat3.size();i++)
		{
			str=str+"<option value='"+cat3.get(i).getCode()+"'>"+URLEncoder.encode(cat3.get(i).getName())+"</option>";
		}
		out.print(str);
	}

	@Override
	public void getCode(HttpServletRequest request, PrintWriter out) {
		String pcode=request.getParameter("pcode");
		out.print(mapper.getCode(pcode));
	}
}
