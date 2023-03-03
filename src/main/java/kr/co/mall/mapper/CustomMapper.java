package kr.co.mall.mapper;

import java.util.ArrayList;

import kr.co.mall.vo.FaqVo;
import kr.co.mall.vo.GongjiVo;

public interface CustomMapper {

	public ArrayList<FaqVo> getFaq();

	public ArrayList<GongjiVo> getGongji();

}
