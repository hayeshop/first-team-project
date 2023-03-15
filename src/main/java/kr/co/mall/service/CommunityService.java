package kr.co.mall.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.mall.vo.CommunityVo;

public interface CommunityService {
	public String cwrite_ok(CommunityVo cvo);
	public String clist(Model model, CommunityVo cvo);
	public String ccontent(Model model, HttpServletRequest request);
	public String cdelete(CommunityVo cvo, HttpSession session);
	public String cupdate(CommunityVo cvo, Model model);
	public String cupdate_ok(CommunityVo cvo);
}