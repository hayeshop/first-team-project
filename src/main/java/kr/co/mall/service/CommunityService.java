package kr.co.mall.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.mall.vo.CommunityVo;

public interface CommunityService {
	public String cwrite_ok(HttpSession session, HttpServletRequest request, CommunityVo cvo) throws IOException;
	public String clist(Model model, CommunityVo cvo);
	public String ccontent(Model model, HttpServletRequest request);
	public String cdelete(CommunityVo cvo, HttpSession session);
}