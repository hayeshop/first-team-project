package kr.co.mall.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.mall.mapper.CommunityMapper;
import kr.co.mall.vo.CommunityVo;

@Service
@Qualifier("cs")
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired
	private CommunityMapper mapper;
	
	@Override
	public String cwrite_ok(CommunityVo cvo) {
		mapper.cwrite_ok(cvo);
		return "redirect:/community/clist";
	}
	
	@Override
	public String clist(Model model, CommunityVo cvo) {
		ArrayList<CommunityVo> clist=mapper.clist();
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
	
	@Override
	public String cupdate(CommunityVo cvo,Model model) {
		CommunityVo cvo2=mapper.cupdate(cvo);
		model.addAttribute("cvo",cvo2);
		return "/community/cupdate";
	}

	@Override
	public String cupdate_ok(CommunityVo cvo) {
		String userid="";
		mapper.cupdate_ok(cvo);
		return "redirect:/community/ccontent";
		
	}
	
}