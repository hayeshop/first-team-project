package kr.co.mall.mapper;

import java.util.ArrayList;

import kr.co.mall.vo.BaesongVo;
import kr.co.mall.vo.MemberVo;
import kr.co.mall.vo.ProductVo;

public interface ProductMapper {

	public ArrayList<ProductVo> getPro(String pcode, int index);

	public int getChong(String pcode);

	public ProductVo pcontent(String pcode);

	public int getWish(String pcode, String userid);

	public void wish_del(String pcode, String userid);

	public void wish_add(String pcode, String userid);
	
	public void cart_add(String pcode, String su, String userid);
	
	public void cart_up(String pcode, String su, String userid);

	public int IsPcode(String pcode, String userid);

	public ProductVo getNow(String string);

	public MemberVo getMember(String userid);

	public BaesongVo getBaesong(String userid);

	public void setBaesong(BaesongVo bvo2);

	public ArrayList<BaesongVo> bae_view(String userid);

}
