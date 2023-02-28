package kr.co.mall.mapper;

import java.util.ArrayList;

import kr.co.mall.vo.AdminVo;
import kr.co.mall.vo.Cat2Vo;
import kr.co.mall.vo.Cat3Vo;
import kr.co.mall.vo.CatVo;

public interface AdminMapper {

	public AdminVo adminlogin(AdminVo avo);

	public ArrayList<CatVo> getCat();

	public ArrayList<Cat2Vo> getCat2(String catcode);

	public ArrayList<Cat3Vo> getCat3(String catncat2);

	public int getCode(String pcode);
	
}
