package kr.co.mall.mapper;

import java.util.ArrayList;

import kr.co.mall.vo.CartVo;
import kr.co.mall.vo.MtmVo;

public interface MypageMapper {

	public int getMtm(String userid);

	public ArrayList<MtmVo> mtm_view(String userid);

	public ArrayList<CartVo> cart(String userid);

	public void cart_su(String su, String pcode, String userid);

	public void cart_del(String id);

	public int getCart(String userid);

}
