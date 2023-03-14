package kr.co.mall.service;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	public String pcontent(Model model, HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		String pcode=request.getParameter("pcode");
		ProductVo pvo=mapper.pcontent(pcode);
		model.addAttribute("pvo",pvo);
		
		// 쿠키작업
		Cookie[] cookie=request.getCookies();
		
		String imsi=null;
		// 읽어온 쿠키 중에서 작업할 쿠키변수 => pcode
		for(int i=0;i<cookie.length;i++)  // Cookie배열의 모든 값을 다 열람 getName(),getValue()
		{
			// getName()이 pcode인 쿠키의 getValue()
			if(cookie[i].getName().equals("pcode"))
			{
				// 지금 보는 상품을 제외한 이전에 본 상품만 존재
				imsi=cookie[i].getValue();
				// 현재 보는 상품의 pcode를 추가하여 저장
				if(imsi.indexOf(pcode)==-1)  // 현재 보는 상품이 imsi문자열 변수에 존재하지 않는다면
				{
					imsi=imsi+pcode+"/";
				}
				// 하나의 상품을 추가했다면 imsi라는 문자열에 상품이 몇개인지
				int len=imsi.split("/").length;
				if(len>3)	// 상품이 3개 이상 => 4개라면
				{
					int n=imsi.indexOf("/");
					imsi.substring(n+1);  // 기존의 상품+현재보는 상품으로 3개 이하의 상품코드를 가진다
				}
				// 변경된 imsi를 쿠키변수 pcode에 저장
				Cookie cookie2=new Cookie("pcode",imsi);
				cookie2.setMaxAge(600);
				response.addCookie(cookie2);
			}
		}
		
		if(imsi==null)  // pcode값이 없다면 현재상품만 추가하여 쿠키변수에 저장
		{
			imsi=pcode+"/";  // 현재 상품을 imsi라는 변수에 저장
			Cookie cookie2=new Cookie("pcode",imsi);
			cookie2.setMaxAge(600);
			response.addCookie(cookie2);
		}
		// imsi문자열에 있는  pcode를 이용하여 해당 그림파일의 이름 가져오기
		String[] pcode2=imsi.split("/");
		ArrayList<ProductVo> plist2=new ArrayList<ProductVo>();
		for(int i=0;i<pcode2.length;i++)
		{
			ProductVo pvo2=mapper.getNow(pcode2[i]);
			plist2.add(pvo2);
		}
		model.addAttribute("plist2",plist2);  // 쿠키변수에 있는 상품코드를 이용하여 그림파일명,상품코드를 전달
		
		// 상세이미지 처리
		String[] old_img2=pvo.getImg2().split(",");	// 순서가 역순임
		String[] img2=new String[old_img2.length];	// 배열 뒤집기
		for(int i=0;i<old_img2.length;i++)
		{
			img2[i]=old_img2[old_img2.length-i-1];
		}
		model.addAttribute("img2",img2);
		int im_leng=img2.length;
		model.addAttribute("im_leng",im_leng);
		
		// 위시리스트 처리
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
