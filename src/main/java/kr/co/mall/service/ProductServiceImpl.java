package kr.co.mall.service;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.mall.mapper.ProductMapper;
import kr.co.mall.vo.ProductVo;

@Service
@Qualifier("ps")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper mapper;

	@Override
	public String pro_home(Model model, HttpServletRequest request) {
		String pcode=request.getParameter("pcode");
		model.addAttribute("pcode",pcode);
		
		int page;
		if(request.getParameter("page")==null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
		
		int index=(page-1)*20;
		
		ArrayList<ProductVo> plist=mapper.getPro(pcode,index);
		model.addAttribute("plist",plist);
		
		int pstart=page/10;
		if(page%10==0)
			pstart--;
		pstart=pstart*10+1;
		int pend=pstart+9;
		
		int chong=mapper.getChong(pcode);
		
		if(pend>chong)
			pend=chong;
		
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong);
		model.addAttribute("page",page);
		
		return "/product/pro_home";
	}

	@Override
	public String pcontent(Model model, HttpServletRequest request, HttpSession session) {
		String pcode=request.getParameter("pcode");
		ProductVo pvo=mapper.pcontent(pcode);
		model.addAttribute("pvo",pvo);
		
		String[] img2=pvo.getImg2().split(",");
		model.addAttribute("img2",img2);
		int im_leng=img2.length-1;
		model.addAttribute("im_leng",im_leng);
		
		if(session.getAttribute("userid")!=null)
		{
			String userid=session.getAttribute("userid").toString();
			int wcnt=mapper.getWish(pcode,userid);
			model.addAttribute("wcnt",wcnt);
		}
		
		return "/product/pcontent";
	}

	@Override
	public void wish_add(HttpServletRequest request, HttpSession session, PrintWriter out) {
		String pcode=request.getParameter("pcode");
		String userid=session.getAttribute("userid").toString();
		int ck=Integer.parseInt(request.getParameter("ck"));
		
		if(ck==1)
		{
			mapper.wish_del(pcode,userid);
			out.print("0");
		}
		else
		{
			try
			{
				mapper.wish_add(pcode,userid);
				out.print("0");
			}
			catch(Exception e)
			{
				out.print("1");
			}
		}
	}

	@Override
	public void cart_add(HttpServletRequest request, HttpSession session, PrintWriter out) {
		String pcode=request.getParameter("pcode");
		String su=request.getParameter("su");
		
		if(session.getAttribute("userid")!=null)
		{
			String userid=session.getAttribute("userid").toString();
			
			try
			{
				if(mapper.IsPcode(pcode,userid)==1)
				{
					mapper.cart_up(pcode,su,userid);
				}
				else
				{
					mapper.cart_add(pcode,su,userid);
				}
				out.print("0");
			}
			catch(Exception e)
			{
				out.print("1");
			}
		}
	}
}
