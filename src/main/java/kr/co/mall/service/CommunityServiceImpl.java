package kr.co.mall.service;

import java.io.IOException;
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

import kr.co.mall.mapper.CommunityMapper;
import kr.co.mall.vo.CommunityVo;

@Service
@Qualifier("cs")
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired
	private CommunityMapper mapper;
	
	@Override
	public String cwrite_ok(HttpSession session, HttpServletRequest request, CommunityVo cvo) throws IOException {
		String path=request.getRealPath("resources/community");
		int size=1024*1024*10;
		MultipartRequest multi=new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy());
		
		if(session.getAttribute("userid")==null)
			return "/login/login";
		
		int id=Integer.parseInt(multi.getParameter("id"));
		String userid=session.getAttribute("userid").toString();
		String title=multi.getParameter("title");
		String name=session.getAttribute("name").toString();
		String content=multi.getParameter("content");
		String writeday=multi.getParameter("writeday");
		String space=multi.getParameter("space");
		
		//String cimg=multi.getFilesystemName("cimg");
		
		Enumeration file=multi.getFileNames();
		
		String img="";
		while(file.hasMoreElements())
		{
			img=img+multi.getFilesystemName(file.nextElement().toString())+",";
		}
		
		CommunityVo cvo1 = new CommunityVo();
		cvo1.setId(id);
		cvo1.setUserid(userid);
		cvo1.setTitle(title);
		cvo1.setName(name);
		cvo1.setContent(content);
		cvo1.setWriteday(writeday);
		cvo1.setSpace(space);
		cvo1.setImg(img);
		
		mapper.cwrite_ok(cvo1);
		
		return "redirect:/community/clist";
	}
	
	@Override
	public String clist(Model model, CommunityVo cvo) {
		ArrayList<CommunityVo> clist=mapper.clist();
		for(int i=0;i<clist.size();i++)  //  ,로 구분된 그림파일명의 집합을 배열로 변경
		{
		  
			  String[] img=clist.get(i).getImg().split(",");
			  clist.get(i).setImg(img[i]);
		   
		}
		model.addAttribute("clist",clist);
		return "/community/clist";
	}
	
	@Override
	public String ccontent(Model model, HttpServletRequest request) {
		String id=request.getParameter("id");
        CommunityVo cvo=mapper.ccontent(id);
        model.addAttribute("cvo",cvo);
		return "/community/ccontent";
	}
	
	@Override
	public String cdelete(CommunityVo cvo, HttpSession session) {
		mapper.cdelete(cvo.getId());
		return "redirect:/community/clist";
	}
	
}