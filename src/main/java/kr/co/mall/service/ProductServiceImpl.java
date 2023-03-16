package kr.co.mall.service;

import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalDateTime;
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
import kr.co.mall.vo.BaesongVo;
import kr.co.mall.vo.MemberVo;
import kr.co.mall.vo.OrderVo;
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

		// 페이지 작업
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
					imsi=imsi.substring(n+1);  // 기존의 상품+현재보는 상품으로 3개 이하의 상품코드를 가진다
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
		System.out.println(imsi);
		
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

	@Override
	public String order(HttpServletRequest request, HttpSession session, Model model) {
		if(session.getAttribute("userid")==null)
			return "redirect:/login/login";
		
		String userid=session.getAttribute("userid").toString();
		MemberVo mvo=mapper.getMember(userid);
		model.addAttribute("mvo",mvo);
		
		// 배송지 정보
		BaesongVo bvo=mapper.getBaesong(userid);
		if(bvo==null)
		{
			BaesongVo bvo2=new BaesongVo();
			bvo2.setName(mvo.getName());
			bvo2.setPhone(mvo.getPhone());
			bvo2.setPost(mvo.getPost());
			bvo2.setJuso(mvo.getJuso());
			bvo2.setJuso_etc(mvo.getJuso_etc());
			bvo2.setUserid(userid);
			
			mapper.setBaesong(bvo2);
			
			model.addAttribute("bvo",bvo2);
		}
		else
		{
			model.addAttribute("bvo",bvo);
		}
		
		// 상품 정보
		String[] pcode=request.getParameter("pcode").split(",");
		String[] su=request.getParameter("su").split(",");
		ArrayList<ProductVo> plist=new ArrayList<ProductVo>();
		int price=0;	// 상품가격(할인까지 처리)
		int bae=0;	// 배송비
		int cprice=0;	// 총 금액
		String juk="";
		String pprice=""; // 각 상품의 가격
		for(int i=0;i<pcode.length;i++)
		{
			ProductVo pvo=mapper.pcontent(pcode[i]);
			pvo.setSu(Integer.parseInt(su[i]));
			plist.add(pvo);
			
			// 상품가격, 배송비, 적립금
			int imsi=(pvo.getPrice()-(int)(pvo.getPrice()*pvo.getHalin()/100.0))*pvo.getSu();
			price=price+imsi;
			int imsi2=pvo.getBaesong();
			bae=bae+imsi2;
			
			juk=juk+(pvo.getPrice()*pvo.getJuk()/100)*pvo.getSu()+",";
			pprice=pprice+(imsi+imsi2)+",";
		}
		cprice=price+bae;
		
		model.addAttribute("pcode",request.getParameter("pcode"));
		model.addAttribute("su",request.getParameter("su"));
		model.addAttribute("price",price);
		model.addAttribute("bae",bae);
		model.addAttribute("cprice",cprice);
		model.addAttribute("pprice",pprice);
		model.addAttribute("juk",juk);
		model.addAttribute("plist",plist);
		
		return "/product/order";
	}

	@Override
	public String bae_view(HttpSession session, Model model) {
		String userid=session.getAttribute("userid").toString();
		model.addAttribute("blist",mapper.bae_view(userid));
		return "/product/bae_view";
	}

	@Override
	public String bae_add() {
		return "/product/bae_add";
	}

	@Override
	public String bae_add_ok(BaesongVo bvo, HttpSession session) {
		String userid=session.getAttribute("userid").toString();
		bvo.setUserid(userid);
		
		if(bvo.getGibon()==1)
			mapper.gibon(userid);
		
		mapper.bae_add_ok(bvo);
		return "redirect:/product/bae_view";
	}

	@Override
	public String bae_up(HttpServletRequest request, Model model) {
		String id=request.getParameter("id");
		model.addAttribute("bvo",mapper.bae_up(id));
		return "/product/bae_up";
	}

	@Override
	public String bae_up_ok(BaesongVo bvo, HttpSession session) {
		String userid=session.getAttribute("userid").toString();
		
		if(bvo.getGibon()==1)
			mapper.gibon(userid);
		
		mapper.bae_up_ok(bvo);
		return null;
	}

	@Override
	public String bae_del(HttpServletRequest request, HttpSession session) {
		String id=request.getParameter("id");
		int chk=Integer.parseInt(request.getParameter("chk"));
		
		mapper.bae_del(id);
		
		if(chk==1)
		{
			String userid=session.getAttribute("userid").toString();
			mapper.gibonchg(userid);
		}
		
		return "redirect:/product/bae_view";
	}

	@Override
	public String bae_cla(HttpServletRequest request, Model model) {
		String cla=request.getParameter("cla");
		String id=request.getParameter("id");
		
		model.addAttribute("cla",cla);
		model.addAttribute("id",id);
		
		return "/product/bae_cla";
	}

	@Override
	public void chg_ok(HttpServletRequest request, PrintWriter out) {
		String id=request.getParameter("id");
		String cla=request.getParameter("cla");
		try
		{
			mapper.chg_ok(cla,id);
			out.print("0");
		}
		catch(Exception e)
		{
			out.print("1");
		}
	}

	@Override
	public String order_ok(HttpSession session, OrderVo ovo) {
		LocalDate today=LocalDate.now();
		int y=today.getYear();
		int m=today.getMonthValue();
		String mm=m+"";
		if(mm.length()==1)
			mm="0"+mm;
		
		int d=today.getDayOfMonth();
		String dd=d+"";
		if(dd.length()==1)
			dd="0"+dd;
		
		String ordercode="j"+y+mm+dd;
		int num=mapper.getOcode(ordercode);
		String code=String.format("%04d", num);
		ordercode=ordercode+code;
		ovo.setOrdercode(ordercode);
		
		String userid=session.getAttribute("userid").toString();
		ovo.setUserid(userid);
		
		String[] pcode=ovo.getPcode().split(",");
		String[] su=ovo.getSu2().split(",");
		String[] pprice=ovo.getCprice2().split(",");
		String[] juk=ovo.getJuk2().split(",");
		
		for(int i=0;i<pcode.length;i++)
		{
			ovo.setPcode(pcode[i]);
			ovo.setSu(Integer.parseInt(su[i]));
			ovo.setPprice(Integer.parseInt(pprice[i]));
			ovo.setPro_juk(Integer.parseInt(juk[i]));
			mapper.order_ok(ovo);			
		}
		
		return "redirect:/product/order_view?ordercode="+ordercode;
	}
}
