package kr.co.mall.mapper;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import kr.co.mall.vo.CommunityVo;

public interface CommunityMapper {
	
	public String cmain();
	public String cwrite_ok(CommunityVo cvo);
	public ArrayList<CommunityVo> clist();
	public CommunityVo ccontent(String id);
	public void cdelete(int id);
	public CommunityVo cupdate(CommunityVo cvo);
	public void cupdate_ok(CommunityVo cvo);
}