package kr.co.mall.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.mall.mapper.MypageMapper;

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
			
			// mtm테이블에서 userid별로 문의한 숫자 불러오기
			int mnum=mapper.getMtm(userid);
			model.addAttribute("mnum",mnum);
			
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
}
