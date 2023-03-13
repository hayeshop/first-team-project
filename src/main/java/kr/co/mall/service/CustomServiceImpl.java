package kr.co.mall.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.mall.mapper.CustomMapper;
import kr.co.mall.vo.FaqVo;
import kr.co.mall.vo.GongjiVo;
import kr.co.mall.vo.MtmVo;

@Service
@Qualifier("cs")
public class CustomServiceImpl implements CustomService {

	@Autowired
	private CustomMapper mapper;

	@Override
	public String custom(Model model) {
		ArrayList<FaqVo> flist=mapper.getFaq();
		model.addAttribute("flist",flist);
		
		ArrayList<GongjiVo> glist=mapper.getGongji();
		model.addAttribute("glist",glist);
		
		return "/customer/custom";
	}

	@Override
	public String gongji_content(Model model, HttpServletRequest request) {
		String id=request.getParameter("id");
        GongjiVo gvo=mapper.gongji_content(id);
        String content=gvo.getContent().replace("\r\n", "<br>");
        gvo.setContent(content);
        model.addAttribute("gvo",gvo);
		return "/customer/gongji_content";
	}

	@Override
	public String mtm_input(MtmVo mvo, HttpSession session) {
		String userid=session.getAttribute("userid").toString();
		mvo.setUserid(userid);
		mapper.mtm_input(mvo);
		return "redirect:/customer/mtm_finish";
	}

	@Override
	public String mtm(HttpSession session) {
		if(session.getAttribute("userid")==null)
			return "redirect:/login/login";
		else
		{
			return "/customer/mtm";
		}
	}
}
