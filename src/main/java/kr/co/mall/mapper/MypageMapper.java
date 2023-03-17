package kr.co.mall.mapper;

import java.util.ArrayList;

import kr.co.mall.vo.CartVo;
import kr.co.mall.vo.MemberVo;
import kr.co.mall.vo.MtmVo;
import kr.co.mall.vo.WishVo;

public interface MypageMapper {

	public int getMtm(String userid);

	public ArrayList<MtmVo> mtm_view(String userid);

	public ArrayList<CartVo> cart(String userid);

	public void cart_su(String su, String pcode, String userid);

	public void cart_del(String id);

	public int getCart(String userid);

	public ArrayList<WishVo> wish(String userid);

	public int getWish(String userid);

	public void wish_del(String id);

	public int cart_check(String pcode, String userid);

	public void cart_up(String pcode, String userid);

	public void cart_add(String pcode, String userid);

	public int getOrder(String userid);

	public MemberVo getMember(String userid);

}
