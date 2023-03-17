package kr.co.mall.service;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.mall.mapper.MypageMapper;
import kr.co.mall.vo.CartVo;

@Service
@Qualifier("ms")
public class MypageServiceImpl implements MypageService {

	@Autowired
	private MypageMapper mapper;

	@Override
	public String mypage(HttpSession session, Model model) {
		if(session.getAttribute("userid")==null)
			return "redirect:/login/login";
		else
		{
			String userid=session.getAttribute("userid").toString();
			// 회원정보
			model.addAttribute("mvo",mapper.getMember(userid));
			
			// mtm테이블에서 userid별로 문의한 숫자 불러오기
			int mnum=mapper.getMtm(userid);
			model.addAttribute("mnum",mnum);
			
			// cart테이블에서 userid별로 장바구니 상품 개수 불러오기
			int cnum=mapper.getCart(userid);
			model.addAttribute("cnum",cnum);
			
			// wish테이블에서 userid별로 위시리스트 상품 개수 불러오기
			int wnum=mapper.getWish(userid);
			model.addAttribute("wnum",wnum);
			
			// order테이블에서 userid별로 주문 개수 불러오기
			int onum=mapper.getOrder(userid);
			model.addAttribute("onum",onum);
			
			return "/mypage/mypage";
		}
	}

	@Override
	public String mtm_view(HttpSession session, Model model) {
		if(session.getAttribute("userid")==null)
			return "redirect:/login/login";
		else
		{
			String userid=session.getAttribute("userid").toString();
			
			model.addAttribute("mlist",mapper.mtm_view(userid));
			
			return "/mypage/mtm_view";
		}
	}

	@Override
	public String cart(HttpSession session, Model model) {
		if(session.getAttribute("userid")==null)
		{
			return "redirect:/login/login";
		}
		else
		{
			String userid=session.getAttribute("userid").toString();
			ArrayList<CartVo> clist=mapper.cart(userid);
			model.addAttribute("clist",clist);
			
			String proprice="";
			String prohalin="";
			String probae="";
			for(int i=0;i<clist.size();i++)
			{
				proprice=proprice+clist.get(i).getPrice()+",";
				int imsi=(int)(clist.get(i).getPrice()*(clist.get(i).getHalin()/100.0));
				prohalin=prohalin+imsi+",";
				probae=probae+clist.get(i).getBaesong()+",";
			}
			model.addAttribute("proprice",proprice);
			model.addAttribute("prohalin",prohalin);
			model.addAttribute("probae",probae);
			
			return "/mypage/cart";
		}
	}

	@Override
	public void cart_su(HttpServletRequest request, HttpSession session, PrintWriter out) {
		String pcode=request.getParameter("pcode");
		String su=request.getParameter("su");
		String userid=session.getAttribute("userid").toString();
		
		try
		{
			mapper.cart_su(su,pcode,userid);
			out.print("0");
		}
		catch(Exception e)
		{
			out.print("1");
		}
	}

	@Override
	public String cart_del(HttpServletRequest request) {
		String[] id=request.getParameter("id").split(",");
		for(int i=0;i<id.length;i++)
			mapper.cart_del(id[i]);
		return "redirect:/mypage/cart";
	}

	@Override
	public String wish(HttpSession session, Model model) {
		if(session.getAttribute("userid")==null)
		{
			return "redirect:/login/login";
		}
		else
		{
			String userid=session.getAttribute("userid").toString();
			model.addAttribute("wlist",mapper.wish(userid));
			return "/mypage/wish";
		}
	}

	@Override
	public String wish_del(HttpServletRequest request) {
		String[] id=request.getParameter("id").split(",");
		for(int i=0;i<id.length;i++)
			mapper.wish_del(id[i]);
		return "redirect:/mypage/wish";
	}

	@Override
	public String cart_add(HttpServletRequest request, HttpSession session) {
		String pcode=request.getParameter("pcode");
		String userid=session.getAttribute("userid").toString();
		
		int cnt=mapper.cart_check(pcode,userid);
		if(cnt==1)
		{
			mapper.cart_up(pcode,userid);
		}
		else
		{
			mapper.cart_add(pcode,userid);
		}
		return "redirect:/mypage/wish";
	}

	@Override
	public String mem_up(HttpSession session, Model model) {
		String userid=session.getAttribute("userid").toString();
		
		model.addAttribute("mvo",mapper.getMember(userid));
		return "/mypage/mem_up";
	}
}
