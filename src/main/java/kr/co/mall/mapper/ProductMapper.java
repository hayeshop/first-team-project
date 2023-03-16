package kr.co.mall.mapper;

import java.util.ArrayList;

import kr.co.mall.vo.BaesongVo;
import kr.co.mall.vo.MemberVo;
import kr.co.mall.vo.OrderVo;
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

	public void gibon(String userid);

	public void bae_add_ok(BaesongVo bvo);

	public BaesongVo bae_up(String id);

	public void bae_up_ok(BaesongVo bvo);

	public void bae_del(String id);

	public void gibonchg(String userid);

	public void chg_ok(String cla, String id);

	public int getOcode(String ordercode);

	public void order_ok(OrderVo ovo);

}
