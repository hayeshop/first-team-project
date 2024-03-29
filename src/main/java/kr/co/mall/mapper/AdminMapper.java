package kr.co.mall.mapper;

import java.util.ArrayList;

import kr.co.mall.vo.AdminVo;
import kr.co.mall.vo.Cat2Vo;
import kr.co.mall.vo.Cat3Vo;
import kr.co.mall.vo.CatVo;
import kr.co.mall.vo.FaqVo;
import kr.co.mall.vo.GongjiVo;
import kr.co.mall.vo.MemberVo;
import kr.co.mall.vo.MtmVo;
import kr.co.mall.vo.ProductVo;

public interface AdminMapper {

	public AdminVo adminlogin(AdminVo avo);

	public ArrayList<CatVo> getCat();

	public ArrayList<Cat2Vo> getCat2(String catcode);

	public ArrayList<Cat3Vo> getCat3(String catncat2);

	public int getCode(String pcode);

	public void product_input(ProductVo pvo);

	public ArrayList<ProductVo> product_list(int index);

	public ArrayList<MemberVo> getMember();

	public void faq_input(FaqVo fvo);

	public ArrayList<FaqVo> getFaq();

	public void gongji_input(GongjiVo gvo);

	public ArrayList<GongjiVo> getGongji();

	public void gong_del(int id);

	public void gongji_update(GongjiVo gvo);

	public void faq_update(FaqVo fvo);

	public void faq_del(int id);

	public ArrayList<MtmVo> getMtm();

	public void mtm_update(String ans, String id);

	public int getChong();

	public ArrayList<ProductVo> getPro();
	
}
