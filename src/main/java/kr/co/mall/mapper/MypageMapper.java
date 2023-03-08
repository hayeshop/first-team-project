package kr.co.mall.mapper;

import java.util.ArrayList;

import kr.co.mall.vo.MtmVo;

public interface MypageMapper {

	public int getMtm(String userid);

	public ArrayList<MtmVo> mtm_view(String userid);

}
