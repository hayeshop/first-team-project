package kr.co.mall.service;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import kr.co.mall.mapper.AdminMapper;
import kr.co.mall.vo.AdminVo;
import kr.co.mall.vo.Cat2Vo;
import kr.co.mall.vo.Cat3Vo;
import kr.co.mall.vo.FaqVo;
import kr.co.mall.vo.GongjiVo;
import kr.co.mall.vo.MemberVo;
import kr.co.mall.vo.MtmVo;
import kr.co.mall.vo.ProductVo;

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
			session.setAttribute("name", avo2.getName());
			return "redirect:/admin/adminmain";
		}
	}

	@Override
	public String adminproduct(HttpSession session, Model model, HttpServletRequest request) {
		if(session.getAttribute("userid")==null)
			return "/admin/adminlogin";
		if(session.getAttribute("userid").equals("admin"))
		{
			// category테이블 읽어오기, view에 전달
			model.addAttribute("category",mapper.getCat());
			
			// product테이블 읽어오기, view에 전달
			int page;
		    if(request.getParameter("page")==null)
		    {
		    	page=1;
		    }
		    else
		    {
		    	page=Integer.parseInt(request.getParameter("page"));
		    }
		    int index=(page-1)*10;
		    
		    // pstart,pend,chong		    
		    int pstart=page/10;
			if(page%10 == 0)
				pstart--;
			pstart=pstart*10+1;
		    int pend=pstart+9;
		    
		    int chong=mapper.getChong();
		    
		    if(pend>chong)
		       pend=chong;
		    
		    model.addAttribute("page",page);
		    model.addAttribute("pstart",pstart);
		    model.addAttribute("pend",pend);
		    model.addAttribute("chong",chong);
			
			ArrayList<ProductVo> plist=mapper.product_list(index);
			for(int i=0;i<plist.size();i++)
			{
				String[] img2=plist.get(i).getImg2().split(",");
				model.addAttribute("img2",img2);
			}
			model.addAttribute("plist",plist);
			
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

	@Override
	public String product_input(HttpServletRequest request) throws IOException {
		String path=request.getRealPath("resources/product");
		int size=1024*1024*10;
		MultipartRequest multi=new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy());
		
		String pcode=multi.getParameter("pcode");
		String title=multi.getParameter("title");
		String made=multi.getParameter("made");
		int price=Integer.parseInt(multi.getParameter("price"));
		int baesong=Integer.parseInt(multi.getParameter("baesong"));
		int su=Integer.parseInt(multi.getParameter("su"));
		int halin=Integer.parseInt(multi.getParameter("halin"));
		int juk=Integer.parseInt(multi.getParameter("juk"));
		
		String img1=multi.getFilesystemName("img1");
		
		Enumeration file=multi.getFileNames();
		
		String img2="";
		while(file.hasMoreElements())
		{
			img2=img2+multi.getFilesystemName(file.nextElement().toString())+",";
		}
		
		
		ProductVo pvo=new ProductVo();
		pvo.setPcode(pcode);
		pvo.setTitle(title);
		pvo.setMade(made);
		pvo.setPrice(price);
		pvo.setBaesong(baesong);
		pvo.setSu(su);
		pvo.setHalin(halin);
		pvo.setJuk(juk);
		pvo.setImg1(img1);
		pvo.setImg2(img2);
		
		mapper.product_input(pvo);
		
		return "redirect:/admin/adminproduct";
	}

	@Override
	public String adminmember(Model model, HttpSession session) {
		if(session.getAttribute("userid")==null)
			return "/admin/adminlogin";
		if(session.getAttribute("userid").equals("admin"))
		{
			
			model.addAttribute("mlist",mapper.getMember());
			return "/admin/adminmember";
		}
		else
		{
			return "redirect:/main/main";
		}
	}

	@Override
	public String admincustom(HttpSession session, Model model) {
		if(session.getAttribute("userid")==null)
			return "/admin/adminlogin";
		if(session.getAttribute("userid").equals("admin"))
		{
			// FAQ list
			ArrayList<FaqVo> flist=mapper.getFaq();
			for(int i=0;i<flist.size();i++)
			{
				String ans=flist.get(i).getAns().replace("\r\n", "<br>");
				ans=ans.replace(")", "]");
				ans=ans.replace("(", "[");
				ans=ans.replace("'", "");
				flist.get(i).setAns(ans);
			}
			model.addAttribute("flist",flist);
			
			// Gongji list
			ArrayList<GongjiVo> glist=mapper.getGongji();
			for(int i=0;i<glist.size();i++)
			{
				String content=glist.get(i).getContent().replace("\r\n", "<br>");
				content=content.replace(")", "]");
				content=content.replace("(", "[");
				content=content.replace("'", "");
				glist.get(i).setContent(content);
			}
			model.addAttribute("glist",glist);
			
			// mtm list
			ArrayList<MtmVo> mlist=mapper.getMtm();
			model.addAttribute("mlist",mlist);
			
			return "/admin/admincustom";
		}
		else
		{
			return "redirect:/main/main";
		}
	}

	@Override
	public String faq_input(HttpSession session, FaqVo fvo) {
		if(session.getAttribute("userid")==null)
			return "/admin/adminlogin";
		if(session.getAttribute("userid").equals("admin"))
		{
			mapper.faq_input(fvo);
			return "redirect:/admin/admincustom";
		}
		else
		{
			return "redirect:/main/main";
		}
	}

	@Override
	public String gongji_input(HttpSession session, GongjiVo gvo) {
		if(session.getAttribute("userid")==null)
			return "/admin/adminlogin";
		if(session.getAttribute("userid").equals("admin"))
		{
			mapper.gongji_input(gvo);
			return "redirect:/admin/admincustom";
		}
		else
		{
			return "redirect:/main/main";
		}
	}

	@Override
	public String gong_del(HttpSession session, GongjiVo gvo) {
		if(session.getAttribute("userid")==null)
			return "/admin/adminlogin";
		if(session.getAttribute("userid").equals("admin"))
		{
			mapper.gong_del(gvo.getId());
			return "redirect:/admin/admincustom";
		}
		else
		{
			return "redirect:/main/main";
		}
	}

	@Override
	public String gongji_update(HttpSession session, GongjiVo gvo) {
		if(session.getAttribute("userid")==null)
			return "/admin/adminlogin";
		if(session.getAttribute("userid").equals("admin"))
		{
			mapper.gongji_update(gvo);
			return "redirect:/admin/admincustom";
		}
		else
		{
			return "redirect:/main/main";
		}
	}

	@Override
	public String faq_update(HttpSession session, FaqVo fvo) {
		if(session.getAttribute("userid")==null)
			return "/admin/adminlogin";
		if(session.getAttribute("userid").equals("admin"))
		{
			mapper.faq_update(fvo);
			return "redirect:/admin/admincustom";
		}
		else
		{
			return "redirect:/main/main";
		}
	}

	@Override
	public String faq_del(HttpSession session, FaqVo fvo) {
		if(session.getAttribute("userid")==null)
			return "/admin/adminlogin";
		if(session.getAttribute("userid").equals("admin"))
		{
			mapper.faq_del(fvo.getId());
			return "redirect:/admin/admincustom";
		}
		else
		{
			return "redirect:/main/main";
		}
	}

	@Override
	public String mtm_update(HttpSession session, HttpServletRequest request) {
		if(session.getAttribute("userid")==null)
			return "/admin/adminlogin";
		if(session.getAttribute("userid").equals("admin"))
		{
			String id=request.getParameter("id");
			String ans=request.getParameter("ans");
			mapper.mtm_update(ans,id);
			return "redirect:/admin/admincustom";
		}
		else
		{
			return "redirect:/main/main";
		}
	}

	@Override
	public String main(Model model) {
		ArrayList<ProductVo> plist=mapper.getPro();
		model.addAttribute("plist",plist);
		return "main/main";
	}
}
