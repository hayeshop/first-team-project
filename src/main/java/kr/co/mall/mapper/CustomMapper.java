package kr.co.mall.mapper;

import java.util.ArrayList;

import kr.co.mall.vo.FaqVo;
import kr.co.mall.vo.GongjiVo;
import kr.co.mall.vo.MtmVo;

public interface CustomMapper {

	public ArrayList<FaqVo> getFaq();

	public ArrayList<GongjiVo> getGongji();

	public GongjiVo gongji_content(String id);

	public void mtm_input(MtmVo mvo);

}
